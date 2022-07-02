local actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,

            },
        },
    },
    pickers = {
        live_grep = { theme = "dropdown" },
        find_files = { theme = "dropdown" },
        commands = { theme = "dropdown" },
        keymaps = { theme = "dropdown" },
    },
}
