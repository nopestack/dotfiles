require("nvim-treesitter.configs").setup {
    ensure_installed = "maintained",
    sync_install = false,
    highlight = { enable = true },
    -- playground = { enable = true },
    -- query_linter = { enable = true },
    additional_vim_regex_highlighting = false,
}

require("nvim-treesitter-context").setup {}
