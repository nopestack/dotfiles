return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
        },

        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "vimdoc",
                    "c",
                    "lua",
                    "rust",
                    "python",
                    "javascript",
                    "typescript",
                },
                auto_install = true,
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
}
