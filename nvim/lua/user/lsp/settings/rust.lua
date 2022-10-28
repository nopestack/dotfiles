local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
if not rust_tools_status_ok then
    return
end

local keymap = require("user.utils").keymap

local function on_attach(client, bufnr)
    local on_attach_mod = require("user.lsp.handlers").on_attach

    on_attach_mod(client, bufnr)

    -- keymap("n", "K", rust_tools.hover_actions.hover_actions())
end

return {
    tools = {
        -- on_initialized = function()
        --     vim.api.nvim_create_autocmd({
        --         "BufWritePost",
        --         "BufEnter",
        --         "CursorHold",
        --         "InsertLeave"
        --     }, {
        --         pattern = { "*.rs" },
        --         callback = function()
        --             vim.lsp.codelens.refresh()
        --         end,
        --     })
        -- end,
        inlay_hints = {
            parameter_hints_prefix = "",
            other_hints_prefix = "",
            show_parameter_hints = true,
        },

        hover_actions = {
            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = true,
        },
    },
    server = {
        -- on_attach = require("user.lsp.handlers").on_attach,
        on_attach = on_attach,
        capabilities = require("user.lsp.handlers").capabilities,

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
            },
        },
    },
}
