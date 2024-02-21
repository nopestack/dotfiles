return {
    {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        ft = { "rust" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "lvimuser/lsp-inlayhints.nvim",
                opts = {
                    parameter_hints = {
                        prefix = "",
                    },
                    -- highlight = "LspInlayHint",
                },
            },
        },
        config = function()
            vim.g.rustaceanvim = {
                inlay_hints = {
                    highlight = "NonText",
                    lifetime_elision_hints = true,
                },
                tools = {
                    hover_actions = {
                        auto_focus = true,
                    },
                },
                float_win_config = {
                    border = "single",
                },
                server = {
                    on_attach = function(client, bufnr)
                        local inlay_hints = require("lsp-inlayhints")
                        local lsp_keymaps = require("config.keymaps").lsp_keymaps

                        inlay_hints.on_attach(client, bufnr)
                        lsp_keymaps(bufnr)
                    end,
                },
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            loadOutDirsFromCheck = true,
                        },
                        checkOnSave = {
                            command = "clippy",
                        },
                    },
                },
            }
        end,
    },
    {
        "saecki/crates.nvim",
        version = "v0.3.0",
        lazy = true,
        ft = { "rust", "toml" },
        event = { "BufRead", "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup({
                popup = {
                    border = "single",
                },
            })
        end,
    },
}
