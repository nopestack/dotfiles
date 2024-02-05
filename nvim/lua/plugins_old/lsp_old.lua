local M = {}

local utils = require("user.utils")

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
-- local lsp = require('lsp-zero')
local lsp_status_ok, lsp = pcall(require, "lsp-zero")
if not lsp_status_ok then
    vim.notify("cannot load lsp-zero", vim.log.levels.ERROR)
    return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify("cannot load cmp", vim.log.levels.ERROR)
    return
end

-- Turn on lsp status information
local fidget_status_ok, fidget = pcall(require, "fidget")
if not fidget_status_ok then
    vim.notify("cannot load fidget", vim.log.levels.ERROR)
    return
end

local lsp_keymaps = require("user.keymaps").lsp_keymaps

fidget.setup()

lsp.preset({
    name = "minimal",
    set_lsp_keymaps = false,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "lua_ls",
    -- "rust_analyzer",
    "pyright",
    "yamlls",
    "taplo",
    "efm",
    "gopls",
})

local lua_opts = require("user.lsp.servers.sumneko_lua")
local py_opts = require("user.lsp.servers.pyright")
local efm_opts = require("user.lsp.servers.efm")

lsp.configure("sumneko_lua", lua_opts)
lsp.configure("pyright", py_opts)
lsp.configure("efm", efm_opts)

lsp.configure("gdscript", {
    force_setup = true, -- because the LSP is global. Read more on lsp-zero docs about this.
    single_file_support = false,
    -- cmd = { 'ncat', '127.0.0.1', '6008' }, -- the important trick for Windows!
    root_dir = require("lspconfig.util").root_pattern("project.godot", ".git"),
    filetypes = { "gd", "gdscript", "gdscript3" },
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
    --
    -- Add tab support
    -- ["<Tab>"] = cmp.mapping.select_next_item(),
    -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    --
    -- ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    -- ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),

    -- Make cmp play nice with Copilot
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    }),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    sources = {
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "buffer" },
        { name = "path" },
    },
})

lsp.nvim_workspace()

lsp.setup()

local function lsp_highlight_document(client)
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
        return
    end

    illuminate.on_attach(client)
end

local function on_attach(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)

    utils.enable_format_on_save()
end

lsp.on_attach(function(client, bufnr)
    on_attach(client, bufnr)
end)

lsp.skip_server_setup({ "rust_analyzer" })

lsp.format_on_save({
    servers = {
        ["tsserver"] = { "javascript", "typescript" },
        ["usort"] = { "python" },
        ["black"] = { "python" },
        ["lua_ls"] = { "lua" },
        ["taplo"] = { "toml" },
        ["rust_analyzer"] = { "rust" },
    },
})

lsp.nvim_workspace()

lsp.setup()

vim.notify("running lsp")
--
-- -- setup rust by using rust-tools
-- local lsp_rust = lsp.build_options("rust_analyzer", {
--     settings = {
--         ["rust-analyzer"] = {
--             lens = { enable = true },
--             checkOnSave = { command = "clippy" },
--             cargo = { autoReload = true },
--             primeCaches = { numThreads = 4 },
--             diagnostics = { enable = true, experimental = { enable = true } },
--             procMacro = { enable = true },
--             inlayHints = {
--                 lifetimeElisionHints = {
--                     enable = true,
--                     useParameterNames = true
--                 }
--             },
--         },
--     },
-- })
--
-- local rust_opts = require("user.lsp.servers.rust")
-- local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
-- if not rust_tools_status_ok then
--     error("failed to load rust-tools")
--     return
-- end
--
-- rust_opts.server = lsp_rust
--
-- rust_opts["tools"].on_initialized = function()
--     vim.notify("rust-tools setup complete")
-- end

-- rust_tools.setup(rust_opts)

vim.diagnostic.config({ virtual_text = true })

return M
