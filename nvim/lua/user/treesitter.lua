require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "help",
        "c",
        "lua",
        "rust",
    },
    auto_install = true,
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})
