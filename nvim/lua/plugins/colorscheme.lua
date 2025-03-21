return {
    {
        "rebelot/kanagawa.nvim",
        config = function()
            local apply_colors = require("config.ui").apply_colors

            require("kanagawa").setup({
                compile = true,
                transparent = true,    -- do not set background color
                dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                background = {         -- map the value of 'background' option to a theme
                    dark = "dragon",   -- try "dragon" !
                    light = "lotus",
                },
                colors = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
                overrides = function(colors)
                    local theme = colors.theme

                    return {
                        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                        PmenuSbar = { bg = theme.ui.bg_m1 },
                        PmenuThumb = { bg = theme.ui.bg_p2 },
                    }
                end,
            })
            apply_colors("kanagawa")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            local apply_colors = require("config.ui").apply_colors

            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = {     -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = true, -- disables setting the background color.
                show_end_of_buffer = true,     -- shows the '~' characters after the end of buffers
                dim_inactive = {
                    enabled = true,            -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15,         -- percentage of the shade to apply to the inactive window
                },
            })

            -- apply_colors("catppuccin-frappe")
        end,
    },
    {
        "Shatur/neovim-ayu",
        config = function()
            local apply_colors = require("config.ui").apply_colors
            require("ayu").setup({
                mirage = true,
                terminal = true,
                overrides = {
                    Normal = { bg = "None" },
                    ColorColumn = { bg = "None" },
                    SignColumn = { bg = "None" },
                    Folded = { bg = "None" },
                    FoldColumn = { bg = "None" },
                    CursorLine = { bg = "None" },
                    CursorColumn = { bg = "None" },
                    WhichKeyFloat = { bg = "None" },
                    VertSplit = { bg = "None" },
                },
            })

            -- apply_colors("ayu")
        end,
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            local apply_colors = require("config.ui").apply_colors
            require("rose-pine").setup({ disable_background = true })

            -- apply_colors("rose-pine")
        end,
    },
    {
        "folke/tokyonight.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
            local apply_colors = require("config.ui").apply_colors

            -- require("tokyonight").setup({
            --     style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            --     light_style = "day", -- The theme is used when the background is set to light
            --     transparent = true, -- Enable this to disable setting the background color
            --     terminal_colors = true,
            -- })

            -- apply_colors("tokyonight")
        end,
    },

    {
        "shaunsingh/nord.nvim",
        config = function()
            local apply_colors = require("config.ui").apply_colors
            -- apply_colors("nord")
        end,
    },

    {
        "aktersnurra/no-clown-fiesta.nvim",
        lazy = false,

        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            "rktjmp/lush.nvim",
        },
        config = function()
            local apply_colors = require("config.ui").apply_colors

            require("no-clown-fiesta").setup({
                transparent = true, -- Enable this to disable the bg color
                styles = {
                    -- You can set any of the style values specified for `:h nvim_set_hl`
                    comments = {},
                    functions = {},
                    keywords = {},
                    lsp = { underline = true },
                    match_paren = {},
                    type = { bold = true },
                    variables = {},
                },
            })

            -- apply_colors("no-clown-fiesta")
        end,
    },

    "levouh/tint.nvim",
}
