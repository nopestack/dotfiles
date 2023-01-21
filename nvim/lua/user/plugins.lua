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
            return require('packer.util').float({ border = 'rounded' })
        end
    },
})

return packer.startup(function()
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "b0o/mapx.nvim"

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
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use "simrat39/rust-tools.nvim"
    use "Saecki/crates.nvim"

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    -- use "nvim-treesitter/nvim-treesitter-context"


    -- git management
    use {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup {} end,
    }

    -- UI & navigation
    -- use 'folke/lsp-colors.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use {
        "akinsho/bufferline.nvim",
        tag = "v2.*",
    }
    --
    -- Statusline
    use 'beauwilliams/statusline.lua'

    use {
        "folke/trouble.nvim",
        config = function() require("trouble").setup {} end,
    }

    use "github/copilot.vim"

    -- Misc utilities
    use "windwp/nvim-autopairs"
    use "tpope/vim-surround"
    use {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup() end,
    }

    use({
        "luukvbaal/statuscol.nvim",
        config = function() require("statuscol").setup() end
    })

    use 'simrat39/symbols-outline.nvim'

    use "lukas-reineke/indent-blankline.nvim"
    use 'andymass/vim-matchup'
    use "mbbill/undotree"

    -- Colorschemes
    use "folke/tokyonight.nvim"
    use "cocopon/iceberg.vim"
    use "rakr/vim-two-firewatch"
    use "projekt0n/github-nvim-theme"
    use "sainnhe/sonokai"
    use "elvessousa/sobrio"
    use "EdenEast/nightfox.nvim"
    use "kvrohit/substrata.nvim"
    use "rose-pine/neovim"
    use "rebelot/kanagawa.nvim"
    use "rmehri01/onenord.nvim"
    use "RRethy/vim-illuminate"
    use "jacoborus/tender.vim"
    use "rafamadriz/neon"
    use "MomePP/plastic-nvim"
    use "titanzero/zephyrium"
    use "sainnhe/everforest"
    use "nanotech/jellybeans.vim"
    use "sainnhe/edge"
    use "ChristianChiarulli/nvcode-color-schemes.vim"
    use "tyrannicaltoucan/vim-deep-space"
    use "w0ng/vim-hybrid"
    use "metalelf0/jellybeans-nvim"
    use "rktjmp/lush.nvim"
    use "Shatur/neovim-ayu"
    use "katawful/kat.nvim"
    use "kwsp/halcyon-neovim"
    use "tyrannicaltoucan/vim-quantum"
    use "cesarsl/neo-hybrid.nvim"
    use "marko-cerovac/material.nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'frenzyexists/aquarium-vim'
    use 'kdheepak/monochrome.nvim'
    use { "mangeshrex/everblush.vim" }
    use 'andreypopp/vim-colors-plain'
    use {
        'mastertinner/nvim-quantum',
    }
    use { 'shaunsingh/oxocarbon.nvim', run = './install.sh' }
    use {
        'andersevenrud/nordic.nvim'
    }
    use "Abstract-IDE/Abstract-cs"
    use "ray-x/starry.nvim"
    use 'NTBBloodbath/doom-one.nvim'
    use 'kvrohit/rasmus.nvim'
    use 'tiagovla/tokyodark.nvim'
    use "yazeed1s/minimal.nvim"
    use "lewpoly/sherbet.nvim"
    use "melkster/modicator.nvim"
    use 'davidosomething/vim-colors-meh'
    use 'santigo-zero/jetjbp.nvim' -- jetjbp.nvim
    use "ramojus/meliora.nvim"
    use({
        'mvllow/modes.nvim',
        tag = 'v0.2.0',
    })

    use {
        "jesseleite/nvim-noirbuddy",
        requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
    }

    use 'adrian5/oceanic-next-vim'
end)
