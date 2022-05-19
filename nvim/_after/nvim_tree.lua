vim.g.nvim_tree_highlight_opened_files = 1

require("nvim-tree").setup({
    view = { side = "right", width = 65 },
    number = true,
})
