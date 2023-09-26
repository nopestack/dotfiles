local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup {
    size = 20,
    -- open_mapping = [[<C-t>]],
    open_mapping = [[<D-a>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "single",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    -- vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

local Terminal = require("toggleterm.terminal").Terminal

local horizontal_term = Terminal:new {
    direction = "horizontal",
    on_open = function(term)
        vim.cmd "startinsert!"
        vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "n",
            "<m-3>",
            "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
            { noremap = true, silent = true }
        )
        vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "t",
            "<m-3>",
            "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
            { noremap = true, silent = true }
        )
        vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "i",
            "<m-3>",
            "<cmd>3ToggleTerm size=10 direction=horizontal<cr>",
            { noremap = true, silent = true }
        )
        vim.api.nvim_buf_set_keymap(term.bufnr, "", "<m-2>", "<nop>", { noremap = true, silent = true })
    end,
    count = 3,
}

function _HORIZONTAL_TERM()
    horizontal_term:toggle(10)
end

vim.api.nvim_set_keymap("n", "<C-2>", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-2>", "<cmd>lua _HORIZONTAL_TERM()<CR>", { noremap = true, silent = true })
