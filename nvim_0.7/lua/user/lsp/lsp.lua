local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers")
require("user.lsp.null-ls")

-- add capabilities from nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
--
-- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
-- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
--
-- local border = {
--     { "╭", "FloatBorder" },
--     { "─", "FloatBorder" },
--     { "╮", "FloatBorder" },
--     { "│", "FloatBorder" },
--     { "╯", "FloatBorder" },
--     { "─", "FloatBorder" },
--     { "╰", "FloatBorder" },
--     { "│", "FloatBorder" },
-- }

-- TODO: figure out import paths
-- local efm = require("/after/plugin/lsp/efm")
-- local sumneko = require("/after/plugin/lsp/sumneko")

-- local on_attach = function(client) require"completion".on_attach(client) end

-- local servers = {
--     efm = efm,
--     -- rust_analyzer = {},
--     tsserver = {},
--     gopls = {},
--     pyright = {},
--     -- solc = {
--     --    filetypes = { "solidity" },
--     -- },
--     solidity_ls = { filetypes = { "solidity" } },
--     solang = { filetypes = { "solidity" } },
--     bashls = {},
--     sqlls = {},
--     sumneko_lua = sumneko,
--     taplo = {},
--     yamlls = {},
-- }

-- -- LSP settings (for overriding per client)
-- local handlers = {
--     ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
--         { focus = true,
--             -- border = border,
--             border = "single"
--         }),
--
--     ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers
--         .signature_help,
--         { border = border }),
-- }

-- for server, config in pairs(servers) do
--     config.capabilities = capabilities
--     config.handlers = handlers
--     -- config.on_attach = on_attach
--     nvim_lsp[server].setup(config)
-- end

-- autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
-- vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format()]]
-- vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)]]
-- vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)]]
-- vim.cmd [[autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)]]
-- vim.cmd [[autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)]]
-- vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)]]
-- vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 1000)]]
-- -- vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.format()]]
-- vim.cmd [[autocmd BufWritePre *.sol lua vim.lsp.buf.formatting_sync(nil, 1000)]]
-- vim.cmd [[autocmd BufWritePre *.solidity lua vim.lsp.buf.formatting_sync(nil, 1000)]]
-- vim.cmd [[autocmd BufWritePre *.toml lua vim.lsp.buf.formatting_sync(nil, 1000)]]

-- vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- vim.diagnostic.config({
--     virtual_text = {
--         prefix = "●", -- Could be '●', '▎', 'x'
--     },
--     signs = true,
--     underline = true,
--     update_in_insert = false,
--     severity_sort = true,
-- })

-- vim.lsp.handlers["textDocument/definition"] = goto_definition("split")

-- require("rust-tools").setup({
--     tools = {
--         autoSetHints = true,
--         inlay_hints = {
--             only_current_line = false,
--             show_parameter_hints = true,
--             --
--             -- prefix for parameter hints
--             -- default: "<-"
--             parameter_hints_prefix = "",
--
--             -- prefix for all the other hints (type, chaining)
--             -- default: "=>"
--             other_hints_prefix = "",
--         }
--     }
--
-- })

local M = {}

-- local inlay_hints = require("lsp_extensions").inlay_hints
--
-- inlay_hints({
--     highlight = "Comment",
--     prefix = " > ",
--     aligned = false,
--     enabled = { "TypeHint", "ChainingHint", "ParameterHint" },
--     only_current_line = false
-- })

-- Global function, so you can just call it on the lua side
-- ShowInlineInlayHints = function()
--     vim.lsp.buf_request(0, 'rust-analyzer/inlayHints', inlay_hints.get_params(), inlay_hints.get_callback {
--         only_current_line = false
--     })
-- end
--
-- -- @rockerboo
-- M.show_line_hints_on_cursor_events = function()
--     vim.cmd [[augroup ShowLineHints]]
--     vim.cmd [[  au!]]
--     vim.cmd [[  autocmd CursorHold,CursorHoldI,CursorMoved *.rs :lua ShowInlineInlayHints()]]
--     vim.cmd [[augroup END]]
-- end

-- M.icons = {
--     Class = " ",
--     Color = " ",
--     Constant = " ",
--     Constructor = " ",
--     Enum = "了 ",
--     EnumMember = " ",
--     Field = " ",
--     File = " ",
--     Folder = " ",
--     Function = " ",
--     Interface = "ﰮ ",
--     Keyword = " ",
--     Method = "ƒ ",
--     Module = " ",
--     Property = " ",
--     Snippet = "﬌ ",
--     Struct = " ",
--     Text = " ",
--     Unit = " ",
--     Value = " ",
--     Variable = " ",
-- }
--
-- function M.setup()
--     local kinds = vim.lsp.protocol.CompletionItemKind
--     for i, kind in ipairs(kinds) do kinds[i] = M.icons[kind] or kind end
-- end
--
-- return M
