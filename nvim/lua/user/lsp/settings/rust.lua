return {
    tools = {
        inlay_hints = {
            parameter_hints_prefix = "",
            other_hints_prefix = "",
            show_parameter_hints = true,
        },

        hover_actions = {
            auto_focus = true,
        },
    },
    -- server = {
    --     -- on_attach = require("user.lsp.handlers").on_attach,
    --     -- on_attach = on_attach,
    --     -- capabilities = require("user.lsp.handlers").capabilities,
    --
    --     settings = {
    --         ["rust-analyzer"] = {
    --             lens = {
    --                 enable = true,
    --             },
    --             checkOnSave = {
    --                 command = "clippy",
    --             },
    --             cargo = {
    --                 autoReload = true
    --             },
    --             primeCaches = {
    --                 numThreads = 4,
    --             },
    --         },
    --     },
    -- },
}
