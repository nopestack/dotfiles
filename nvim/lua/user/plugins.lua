vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

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
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use "tom-anders/telescope-vim-bookmarks.nvim"

    -- Remember last buffer opened + line
    use "ethanholz/nvim-lastplace"

    -- Session
    use { "rmagatti/auto-session", branch = "dir-changed-fixes" }
    use "rmagatti/session-lens"

    -- Language Server plugins
    use "williamboman/nvim-lsp-installer"
    use {
        "neovim/nvim-lspconfig",
        requires = {
            "ray-x/go.nvim"
        },
    }

    use "simrat39/rust-tools.nvim"
    use "Saecki/crates.nvim"

    use "nvim-lua/lsp_extensions.nvim"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/nvim-treesitter-context"
    use "jose-elias-alvarez/null-ls.nvim"

    use "nvim-lua/lsp-status.nvim"
    use 'arkav/lualine-lsp-progress'


    -- Completions
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"

    use "hrsh7th/vim-vsnip"
    use "hrsh7th/cmp-vsnip"

    -- git management
    use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require("gitsigns").setup {} end,
    }

    use { "tanvirtin/vgit.nvim", requires = { "nvim-lua/plenary.nvim" } }

    -- UI & navigation
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use {
        "akinsho/bufferline.nvim",
        tag = "v2.*",
    }

    use {
        "narutoxy/dim.lua",
        config = function() require("dim").setup({}) end,
    }

    -- Statusline
    -- use 'beauwilliams/statusline.lua'
    use "nvim-lualine/lualine.nvim"

    use "SmiteshP/nvim-navic"

    use {
        "folke/trouble.nvim",
        config = function() require("trouble").setup {} end,
    }

    use "onsails/lspkind.nvim"

    -- Misc utilities
    use "windwp/nvim-autopairs"
    use "tpope/vim-surround"
    use {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup() end,
    }
    -- use "github/copilot.vim"
    use "lukas-reineke/indent-blankline.nvim"
    use 'andymass/vim-matchup'

    -- Terminal
    use "akinsho/toggleterm.nvim"

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
    use "mangeshrex/uwu.vim"
    use "rmehri01/onenord.nvim"
    use "yashguptaz/calvera-dark.nvim"
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
    use "mjlaufer/gruvbox-darker.nvim"
    use "tyrannicaltoucan/vim-quantum"
    use "cesarsl/neo-hybrid.nvim"
    use "marko-cerovac/material.nvim"
    use 'chriskempson/base16-vim'

end)
