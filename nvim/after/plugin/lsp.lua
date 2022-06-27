local nvim_lsp = require("lspconfig")

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- add capabilities from nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
    { "🭽", "FloatBorder" },
    { "▔", "FloatBorder" },
    { "🭾", "FloatBorder" },
    { "▕", "FloatBorder" },
    { "🭿", "FloatBorder" },
    { "▁", "FloatBorder" },
    { "🭼", "FloatBorder" },
    { "▏", "FloatBorder" },
}

-- TODO: figure out import paths
-- local efm = require("/after/plugin/lsp/efm")
-- local sumneko = require("/after/plugin/lsp/sumneko")

local efm = {
    filetypes = { "lua", "python" },
    -- TODO: setup TS/JS, Go and Python formatting
    init_options = { documentFormatting = true, codeAction = true },
    settings = {
        rootMarkers = { ".git/", "package.json", "yarn.lock" },
        log_level = 1,
        log_file = "~/.efm.log",
        languages = {
            lua = { { formatCommand = "lua-format -i", formatStdin = true } },
        },
    },
}

local sumneko = {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
        },
    },
}

-- local on_attach = function(client) require"completion".on_attach(client) end

local servers = {
    efm = efm,
    rust_analyzer = {
        flags = { debounce_text_changes = 150 },
        cargo = { allFeatures = true },
    },
    tsserver = {},
    gopls = {},
    pyright = {},
    -- solc = {
    --    filetypes = { "solidity" },
    -- },
    solidity_ls = { filetypes = { "solidity" } },
    solang = { filetypes = { "solidity" } },
    bashls = {},
    sqlls = {},
    sumneko_lua = sumneko,
    taplo = {},
    yamlls = {},
}

-- LSP settings (for overriding per client)
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
                                          { focus = true, border = border }),

    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers
                                                      .signature_help,
                                                  { border = border }),
}

for server, config in pairs(servers) do
    config.capabilities = capabilities
    config.handlers = handlers
    nvim_lsp[server].setup(config)
end

vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format()]]
-- vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)]]
-- vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.sol lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd BufWritePre *.solidity lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd BufWritePre *.toml lua vim.lsp.buf.formatting_sync(nil, 1000)]]

-- vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.diagnostic.config({
    virtual_text = {
        prefix = "●", -- Could be '●', '▎', 'x'
    },
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

local function goto_definition(split_cmd)
    local util = vim.lsp.util
    local log = require("vim.lsp.log")
    local api = vim.api

    -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
    local handler = function(_, result, ctx)
        if result == nil or vim.tbl_isempty(result) then
            local _ = log.info() and log.info(ctx.method, "No location found")
            return nil
        end

        if split_cmd then vim.cmd(split_cmd) end

        if vim.tbl_islist(result) then
            util.jump_to_location(result[1])

            if #result > 1 then
                util.set_qflist(util.locations_to_items(result))
                api.nvim_command("copen")
                api.nvim_command("wincmd p")
            end
        else
            util.jump_to_location(result)
        end
    end

    return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition("split")

local M = {}

M.icons = {
    Class = " ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Enum = "了 ",
    EnumMember = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = "ﰮ ",
    Keyword = " ",
    Method = "ƒ ",
    Module = " ",
    Property = " ",
    Snippet = "﬌ ",
    Struct = " ",
    Text = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
}

function M.setup()
    local kinds = vim.lsp.protocol.CompletionItemKind
    for i, kind in ipairs(kinds) do kinds[i] = M.icons[kind] or kind end
end

return M
