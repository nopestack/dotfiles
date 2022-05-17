-- vim.cmd([[
--     augroup packer_user_config
--         autocmd!
--         autocmd BufWritePost plugins.lua source <afile> | PackerSync
--     augroup end
-- ]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("could not require packer")
    return
end

packer.init({
    auto_clean = true,
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function()
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use "tom-anders/telescope-vim-bookmarks.nvim"

    -- Remember last buffer opened + line
    use "ethanholz/nvim-lastplace"

    -- Session
    use { "rmagatti/auto-session", branch = "dir-changed-fixes" }

    -- LSP Setup
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            { "williamboman/mason.nvim" }, -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    }

    -- Useful status updates for LSP
    use "j-hui/fidget.nvim"

    use "simrat39/rust-tools.nvim"
    use "Saecki/crates.nvim"

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    -- use "nvim-treesitter/nvim-treesitter-context"

    -- data science
    -- use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }

    -- git management
    use {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup {} end,
    }

    -- UI & navigation
    -- use 'folke/lsp-colors.nvim'
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use { "akinsho/bufferline.nvim", tag = "v2.*" }
    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use({
        "folke/which-key.nvim",
    })

    use {
        "folke/trouble.nvim",
    }

    use({
        'noib3/nvim-cokeline',
        requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
    })

    -- Statusline
    use "nvim-lualine/lualine.nvim"


    use "github/copilot.vim"

    -- Misc utilities
    use "rktjmp/lush.nvim"
    use "mfussenegger/nvim-dap"
    use "windwp/nvim-autopairs"
    use "tpope/vim-surround"
    use {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup() end,
    }
    use({ "mvllow/modes.nvim", tag = "v0.2.0" })
    use "RRethy/vim-illuminate"
    use({
        "luukvbaal/statuscol.nvim",
        config = function() require("statuscol").setup() end,
    })

    -- NOTE: this plugin changes the colorscheme to a dark one similar to coal
    -- use "folke/neodev.nvim"
    -- use({
    --     "folke/noice.nvim",
    --     config = function()
    --         require("noice").setup({
    --             -- add any options here
    --         })
    --     end,
    --     requires = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         -- "rcarriga/nvim-notify",
    --     },
    -- })

    use "simrat39/symbols-outline.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "andymass/vim-matchup"
    use "mbbill/undotree"
    use "levouh/tint.nvim"

    -- Colorschemes
    use "folke/tokyonight.nvim"
    use "cocopon/iceberg.vim"
    use "projekt0n/github-nvim-theme"
    use "rose-pine/neovim"
    use "rebelot/kanagawa.nvim"
    use "nanotech/jellybeans.vim"
    use "w0ng/vim-hybrid"
    use "metalelf0/jellybeans-nvim"
    use "cesarsl/neo-hybrid.nvim"
    use "tiagovla/tokyodark.nvim"
    use { "ntk148v/komau.vim" } -- Packer
    use "aktersnurra/no-clown-fiesta.nvim"
    use {
        "mcchrish/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        requires = "rktjmp/lush.nvim",

    }
    use "aditya-azad/candle-grey"
    use "rakr/vim-two-firewatch"
    use "Alexis12119/nightly.nvim"
    -- use { 'kevinhwang91/nvim-hlslens' }
end)
