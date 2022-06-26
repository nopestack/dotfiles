local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
            -- only_current_line_autocmd = "CursorHold",
            -- whether to show variable name before type hints with the inlay hints or not
            -- default: false
            show_variable_name = true,
        },
    },
    hover_actions = {
        -- the border that is used for the hover window
        -- see vim.api.nvim_open_win()
        border = {
            -- { "╭", "FloatBorder" },
            -- { "─", "FloatBorder" },
            -- { "╮", "FloatBorder" },
            -- { "│", "FloatBorder" },
            -- { "╯", "FloatBorder" },
            -- { "─", "FloatBorder" },
            -- { "╰", "FloatBorder" },
            -- { "│", "FloatBorder" },
        },

        -- whether the hover action window gets automatically focused
        auto_focus = false,
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        settings = {
            standalone = true,
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                --
                flags = { debounce_text_changes = 150 },
                lens = {
                    references = true,
                    enumVariantReferences = true,
                    methodReferences = true,
                },
                assist = { importEnforceGranularity = true },
                cargo = { allFeatures = true, loadOutDirsFromCheck = true },
                checkOnSave = { command = "clippy" },
                hoverActions = { references = true },
                inlayHints = {
                    closingBraceHints = { enable = true },
                    closureReturnTypeHints = { enable = true },
                    lifetimeElisionHints = { setParameterNames = true },
                    parameterHints = { enable = true },
                    hideNamedConstructorHints = { enable = true },

                },

                typing = { autoClosingAngleBrackets = { enable = true } },
                --
                -- procMacro = { enable = true },
                -- inlayHints = {
                --     closingBraceHints = { enable = true },
                --     closureReturnTypeHints = { enable = true },
                --     lifetimeElisionHints = { seParameterNames = true },
                --     parameterHints = { enable = true },
                -- },

            },
        },
    },
}

require("rust-tools").setup(opts)
