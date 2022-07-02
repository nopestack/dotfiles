local chadtree_settings = {
    options = { show_hidden = true },
    ignore = { name_exact = { ".DS_Store", ".directory", "thumbs.db", ".git" } },
    view = { open_direction = "right" },
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
