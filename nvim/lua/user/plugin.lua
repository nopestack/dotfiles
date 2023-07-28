local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    vim.notify("could not require lazy", vim.log.levels.ERROR)
    return
end

local opts = {}

local plugins = {
    "nvim-lua/plenary.nvim",

    -- Telescope
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "tom-anders/telescope-vim-bookmarks.nvim",

    -- -- Session
    -- TODO: fix sessions layout + lsp issue
    "rmagatti/auto-session",
    "ethanholz/nvim-lastplace",

    -- Lua
    -- LSP Setup
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },             -- Required
            { "williamboman/mason.nvim" },           -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },         -- Required
            { "hrsh7th/cmp-nvim-lsp" },     -- Required
            { "hrsh7th/cmp-buffer" },       -- Optional
            { "hrsh7th/cmp-path" },         -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" },     -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" },             -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    },

    -- Useful status updates for LSP
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update = { with_sync = true }
        end
    },
    'nvim-treesitter/nvim-treesitter-context',

    -- git management
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup {} end,
    },
    'f-person/git-blame.nvim',

    "j-hui/fidget.nvim",
    "simrat39/rust-tools.nvim",
    "Saecki/crates.nvim",

    -- UI & navigation
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    'noib3/nvim-cokeline',
    "folke/which-key.nvim",
    "folke/trouble.nvim",
    "rktjmp/lush.nvim",
    {
        "luukvbaal/stabilize.nvim",
        config = function() require("stabilize").setup() end
    },
    "SmiteshP/nvim-navic",
    'fgheng/winbar.nvim',

    -- Statusline
    "nvim-lualine/lualine.nvim",

    -- Misc utilities
    "github/copilot.vim",
    "mfussenegger/nvim-dap",
    "windwp/nvim-autopairs",
    "tpope/vim-surround",
    {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup() end,
    },
    { "mvllow/modes.nvim", tag = "v0.2.0" },

    "RRethy/vim-illuminate",

    {
        "luukvbaal/statuscol.nvim",
        config = function()
            require("statuscol").setup()
        end,
    },

    "simrat39/symbols-outline.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "andymass/vim-matchup",
    "mbbill/undotree",
    "levouh/tint.nvim",

    -- Colorschemes
    "folke/tokyonight.nvim",
    "cocopon/iceberg.vim",
    "rose-pine/neovim",
    "rebelot/kanagawa.nvim",
    "tiagovla/tokyodark.nvim",
    "aktersnurra/no-clown-fiesta.nvim",
    'sam4llis/nvim-tundra',
    'andersevenrud/nordic.nvim',
    'kvrohit/substrata.nvim',
    "adisen99/apprentice.nvim",
    "lewpoly/sherbet.nvim",
    "mcchrish/zenbones.nvim",
    'yogeshdhamija/chandrian-theme.nvim',
    'cranberry-clockworks/coal.nvim',
    'kdheepak/monochrome.nvim',
    'kvrohit/rasmus.nvim',
    { "catppuccin/nvim",   name = "catppuccin" },
    "tjdevries/colorbuddy.vim",
    'JoosepAlviste/palenightfall.nvim',
    { "Alexis12119/nightly.nvim" },
    'voidekh/kyotonight.vim',
    'JoosepAlviste/palenightfall.nvim',
    "cesarsl/neo-hybrid.nvim",
}

lazy.setup(plugins, opts)
