local opts = {
    tools = { -- rust-tools options
        -- automatically set inlay hints (type hints)
        -- There is an issue due to which the hints are not applied on the first
        -- opened file. For now, write to the file to trigger a reapplication of
        -- the hints or just run :RustSetInlayHints.
        -- default: true
        autoSetHints = true,

        -- whether to show hover actions inside the hover window
        -- this overrides the default hover handler so something like lspsaga.nvim's hover would be overriden by this
        -- default: true
        hover_with_actions = true,

        -- how to execute terminal commands
        -- options right now: termopen / quickfix
        -- executor = require("rust-tools/executors").termopen,

        -- callback to execute once rust-analyzer is done initializing the workspace
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        -- on_initialized = nil,

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "",
        },

        -- options same as lsp hover / vim.lsp.util.open_floating_preview()
        hover_actions = {
            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = true,
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        ["rust-analyzer"] = {
            cargo = {
                autoReload = true
            },
            checkOnSave = {
                command = "clippy"
            },

            standalone = false,
        }
        -- standalone file support
        -- setting it to false may improve startup time
        -- standalone = false,
    }, -- rust-analyer options
}

require('rust-tools').setup(opts)
