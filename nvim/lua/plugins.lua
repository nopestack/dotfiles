return require("packer").startup(function()
    use "wbthomason/packer.nvim"
    use "b0o/mapx.nvim"
    use "w0ng/vim-hybrid"
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    }

    -- Remember last buffer opened + line
    use "ethanholz/nvim-lastplace"
    use({
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup {
                log_level = "info",
                auto_session_suppress_dirs = {
                    "~/",
                    "~/Workspace",
                    "~/work",
                    "~/personal",
                },
            }
        end,
    })

    -- Language Server plugins
    use "williamboman/nvim-lsp-installer"
    use {
        "neovim/nvim-lspconfig",
        requires = { "simrat39/rust-tools.nvim", "ray-x/go.nvim" },
        --    use "tomlion/vim-solidity"
    }
    use "tami5/lspsaga.nvim"

    use {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function() require("crates").setup() end,
    }

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/nvim-treesitter-context"
    use "jose-elias-alvarez/null-ls.nvim"

    --
    -- Completions
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"

    --
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/cmp-vsnip"
    --
    --
    -- git management
    use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require("gitsigns").setup {} end,
    }
    use { "tanvirtin/vgit.nvim", requires = { "nvim-lua/plenary.nvim" } }
    --
    -- UI & navigation
    use { "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } }
    use "stevearc/dressing.nvim"
    use { "ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps" }
    use {
        "hoob3rt/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    }
    use "nvim-lua/lsp-status.nvim"
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup {} end,
    }
    use "MunifTanjim/nui.nvim"
    -- use {
    --    "nvim-lua/popup.nvim",
    --    config = function() require("popup").setup {} end,
    -- }
    --
    --
    -- Misc utilities
    use "windwp/nvim-autopairs"
    use "tpope/vim-surround"
    use {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup() end,
    }
    use "github/copilot.vim"
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = true,
            })
        end,

    }

    --
    --
    --
    -- Colorschemes
    --    use "folke/tokyonight.nvim"
    --    use "cocopon/iceberg.vim"
    --    use "rakr/vim-two-firewatch"
    --    use "projekt0n/github-nvim-theme"
    --    use "sainnhe/sonokai"
    --    use "elvessousa/sobrio"
    --    use "EdenEast/nightfox.nvim"
    --    use "kvrohit/substrata.nvim"
    --    use "rose-pine/neovim"
    --    use "rebelot/kanagawa.nvim"
    --    use "mangeshrex/uwu.vim"
    --    use "rmehri01/onenord.nvim"
    --    use "yashguptaz/calvera-dark.nvim"
    --    use "frenzyexists/aquarium-vim"
    --    use "RRethy/vim-illuminate"
    --    use "jacoborus/tender.vim"
    --    use "rafamadriz/neon"
    --    use "MomePP/plastic-nvim"
    --    use({ "catppuccin/nvim", as = "catppuccin" })
    --    use({
    --        "rose-pine/neovim",
    --        as = "rose-pine",
    --        tag = "v1.*",
    --        -- config = function() vim.cmd("colorscheme rose-pine") end,
    --    })
    --    use "titanzero/zephyrium"
    --    use "sainnhe/everforest"
    --    use "nanotech/jellybeans.vim"
    --    use "sainnhe/edge"
    --    use "ChristianChiarulli/nvcode-color-schemes.vim"
    --    use "tyrannicaltoucan/vim-deep-space"

end)