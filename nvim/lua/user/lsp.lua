-- local status_ok, _ = pcall(require, "lspconfig")
-- if not status_ok then
--     return
-- end
--
-- require("user.lsp.lsp-installer")
-- require("user.lsp.handlers")
-- require("user.lsp.null-ls")
--
-- LEGACY SETUP ABOVE


local M = {}

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
-- local lsp = require('lsp-zero')
local lsp_status_ok, lsp = pcall(require, "lsp-zero")
if not lsp_status_ok then
    print("cannot load lsp-zero")
    return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    print("cannot load cmp")
    return
end

-- local lspkind_status_ok, lspkind = pcall(require, "lspkind")
-- if not lspkind_status_ok then
--     print("cannot load lspkind")
--     return
-- end

local keymap = require("user.utils").keymap
local buf_keymap = require("user.utils").buf_keymap

lsp.preset('recommended')

lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer',
    "pyright",
    "yamlls",
    "taplo",
    -- "efm",
    "gopls",
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = 4,
                },
            },
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
            completion = {
                autoRequire = true,
            }
        }
    }
})


local py_opts = require("user.lsp.servers.rust")

lsp.configure("pyright", py_opts)

local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),

    -- Add tab support
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    }),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    sources = {
        -- { name = "cmp_tabnine" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
    },
})

local function lsp_highlight_document(client)
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
        return
    end

    illuminate.on_attach(client)
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }

    buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_keymap(bufnr, "n", "<M-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

    -- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])

    keymap("n", "<leader>s", ":SymbolsOutline<CR>", opts)

    -- update the window number here so that we can map escape to close even
    -- when there are no actions, update the rest of the state later
    -- M._state.winnr = winnr
    -- vim.api.nvim_buf_set_keymap(
    --   bufnr,
    --   "n",
    --   "<Esc>",
    --   ":lua require'rust-tools.hover_actions'._close_hover()<CR>",
    --   set_keymap_opt
    -- )
end

local function on_attach(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)

    M.enable_format_on_save()
end

lsp.on_attach(function(client, bufnr)
    on_attach(client, bufnr)
end)


function M.enable_format_on_save()
    vim.cmd([[
    augroup format_on_save
      autocmd! 

      autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
      echo "formatting done!"
    augroup end
  ]] )
    vim.notify("Enabled format on save")
end

function M.disable_format_on_save()
    M.remove_augroup("format_on_save")
    vim.notify("Disabled format on save")
end

function M.toggle_format_on_save()
    if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
        M.enable_format_on_save()
    else
        M.disable_format_on_save()
    end
end

function M.remove_augroup(name)
    if vim.fn.exists("#" .. name) == 1 then
        vim.cmd("au! " .. name)
    end
end

lsp.skip_server_setup({ "rust_analyzer" })

lsp.setup()

print("running lsp")


-- setup rust by using rust-tools

local lsp_rust = lsp.build_options("rust_analyzer", {
    -- on_attach = require("user.lsp.handlers").on_attach,
    -- capabilities = require("user.lsp.handlers").capabilities,
    -- on_attach = on_attach,
    -- capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {
        ["rust-analyzer"] = {
            lens = {
                enable = true,
            },
            checkOnSave = {
                command = "clippy",
            },
            cargo = {
                autoReload = true
            },
            primeCaches = {
                numThreads = 4,
            },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },

        },
    },
})

local rust_opts = require("user.lsp.servers.rust")
local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status_ok then
    error("failed to load rust-tools")
    return
end

rust_opts.server = lsp_rust
rust_tools.setup(rust_opts)

print("rust-tools setup complete")

vim.diagnostic.config({
    virtual_text = true,
})

-- vim.cmd([[
--     command! LspToggleAutoFormat execute 'lua require("user.lsp").toggle_format_on_save()'
-- ]])

return M
