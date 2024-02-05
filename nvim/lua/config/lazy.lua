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

local opts = {
    ui = {
        border = "rounded",
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
}

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
            { "neovim/nvim-lspconfig" },    -- Required
            { "williamboman/mason.nvim" },  -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" },    -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    },

    -- Useful status updates for LSP
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update = { with_sync = true }
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",

    -- git management
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})
        end,
    },

    "f-person/git-blame.nvim",

    { "j-hui/fidget.nvim", branch = "legacy" },
    -- "simrat39/rust-tools.nvim",
    {
        "mrcjkb/rustaceanvim",
        version = "^3", -- Recommended
        ft = { "rust" },
    },

    "Saecki/crates.nvim",

    -- UI & navigation
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "noib3/nvim-cokeline",
    "folke/which-key.nvim",
    "folke/trouble.nvim",
    "rktjmp/lush.nvim",
    "fgheng/winbar.nvim",

    -- Statusline
    "nvim-lualine/lualine.nvim",

    -- Misc utilities
    "github/copilot.vim",
    "mfussenegger/nvim-dap",
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "windwp/nvim-autopairs",
    "tpope/vim-surround",
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    { "mvllow/modes.nvim", tag = "v0.2.0" },
    "RRethy/vim-illuminate",

    {
        "dustinblackman/oatmeal.nvim",
        cmd = { "Oatmeal" },
        keys = {
            { "<leader>om", mode = "n", desc = "Start Oatmeal session" },
        },
        opts = {
            backend = "ollama",
            model = "codellama:latest",
        },
    },

    {
        "luukvbaal/statuscol.nvim",
        config = function()
            require("statuscol").setup()
        end,
    },
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    { "folke/neodev.nvim",       opts = {} },

    "lukas-reineke/indent-blankline.nvim",
    "andymass/vim-matchup",
    "mbbill/undotree",
    "levouh/tint.nvim",
    "ahmedkhalf/project.nvim",
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    },

    -- Colorschemes
    "folke/tokyonight.nvim",
    "cocopon/iceberg.vim",
    "rose-pine/neovim",
    "rebelot/kanagawa.nvim",
    "tiagovla/tokyodark.nvim",
    "aktersnurra/no-clown-fiesta.nvim",
    "sam4llis/nvim-tundra",
    "kvrohit/substrata.nvim",
    "adisen99/apprentice.nvim",
    "lewpoly/sherbet.nvim",
    "mcchrish/zenbones.nvim",
    "yogeshdhamija/chandrian-theme.nvim",
    "cranberry-clockworks/coal.nvim",
    "kdheepak/monochrome.nvim",
    "kvrohit/rasmus.nvim",
    { "catppuccin/nvim",         name = "catppuccin" },
    "tjdevries/colorbuddy.vim",
    "JoosepAlviste/palenightfall.nvim",
    { "Alexis12119/nightly.nvim" },
    "voidekh/kyotonight.vim",
    "JoosepAlviste/palenightfall.nvim",
    "cesarsl/neo-hybrid.nvim",
    "AlexvZyl/nordic.nvim",
    "Yagua/nebulous.nvim",
    { "ellisonleao/gruvbox.nvim",   priority = 1000, config = true, opts = ... },
    -- Install without configuration
    { "projekt0n/github-nvim-theme" },

    {
        "fynnfluegge/monet.nvim",
        name = "monet",
    },
}

-- lazy.setup(plugins, opts)
lazy.setup({ import = "plugins" }, opts)
