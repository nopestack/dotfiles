require("mapx").setup({ global = true })

local utils = require("user.utils")

local opts = {
    noremap = true,
    silent = true,
}

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

local meta_key = "M"
if vim.g.neovide then
    meta_key = "D"
end
--
--          Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang | ~
-- Command        +------+-----+-----+-----+-----+-----+------+------+ ~
-- [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |
--
-- ["<C-n>"] = actions.move_selection_next,
-- ["<C-p>"] = actions.move_selection_previous,

-- Move text up and down
-- TODO: map option to mean Alt
-- keymap("n", "<D-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<D-k>", "<Esc>:m .-2<CR>==gi", opts)
--
-- "*****************************************************************************
-- "" Abbreviations
-- "*****************************************************************************
-- "" no one is really happy until you have this shortcuts
-- cnoreabbrev W! w!
-- cnoreabbrev Q! q!
-- cnoreabbrev Qall! qall!
-- cnoreabbrev Wq wq
-- cnoreabbrev Wa wa
-- cnoreabbrev wQ wq
-- cnoreabbrev WQ wq
-- cnoreabbrev W w
-- cnoreabbrev Q q
-- cnoreabbrev Qall qall

-- Disable arrow keys
-- keymap('n', '<up>', '<nop>', opts)
-- keymap('n', '<down>', '<nop>', opts)
-- keymap('n', '<left>', '<nop>', opts)
-- keymap('n', '<right>', '<nop>', opts)

-- Reload config
-- nnoremap("<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
keymap("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>", opts)

-- save file
nnoremap("<leader>w", ":w<CR>", "silent")
nnoremap("<M-s>", ":w<CR>", "silent")

-- nnoremap("<leader>n", ":Ex<CR>", "silent")
-- nnoremap("<leader>b", ":Vex<CR>", "silent")
-- nnoremap("<leader>b", ":Lex<CR>", "silent")

-- nnoremap("<C-q>", ":confirm qall<CR>", "silent")
keymap("n", "<C-q>", ":confirm qall<CR>", opts)

-- Copy entire line with Y
nnoremap("Y", "yy", "silent")

-- To map <Esc> to exit terminal-mode:
nnoremap("<Esc>", "<C-\\><C-n>")

-- clear search
nnoremap("<leader><space>", ":noh<CR>", "silent")

inoremap("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], "silent", "expr")
inoremap("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], "silent", "expr")

-- " Search mappings: These will make it so that going to the next one in a
-- " search will center on the line it's found in.
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- Split navigation
nnoremap("<C-J>", "<C-W><C-J>")
nnoremap("<C-K>", "<C-W><C-K>")
nnoremap("<C-L>", "<C-W><C-L>")
nnoremap("<C-H>", "<C-W><C-H>")

-- Buffer traversal
-- nnoremap("<Tab>", ":bnext<CR>", "silent")
-- nnoremap("<S-Tab>", ":bprev<CR>", "silent")

-- Alt + Tab and Alt + Shift + Tab
nnoremap("<A-Tab>", ":bnext<CR>", "silent")
-- nnoremap("<C-Tab>", ":bnext<CR>", "silent")
nnoremap("<A-S-Tab>", ":bprev<CR>", "silent")

-- Ctrl + Tab and Ctrl + Shift + Tab
-- NOTE: doesnt work
-- nnoremap("<C-Tab>", ":bnext<CR>", "silent")
-- nnoremap("<C-S-Tab>", ":bprev<CR>", "silent")

-- "Close buffer
-- " Using command+w and ctrl+w respectively
nnoremap("<C-w>", ":bd<CR>", "silent")
--
-- TODO: debug M-w mapping to close windows on TUI
if vim.g.neovide then
    nnoremap("<" .. meta_key .. "-w>", ":bd<CR>", "silent")
end

keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<" .. meta_key .. "-b>", ":NvimTreeToggle<CR>", opts)

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Ctrl/Cmd + b to open fileexplorer
-- if vim.loop.os_uname().sysname == "Darwin" then
--     -- command+b to open file explorer
--     -- keymap("n", "<M-b>", ":NeoTreeFocusToggle<CR>", opts)
--     keymap("n", "<M-b>", ":NvimTreeToggle<CR>", opts)
-- end
-- if vim.loop.os_uname().sysname ~= "Darwin" then
--     -- ctrl+b to open file explorer
--     keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
--     -- keymap("n", "<C-b>", ":NeoTreeFocusToggle<CR>", opts)
--
-- end
--
-- nnoremap("<C-b>", ":NvimTreeToggle<CR>", "silent")
-- nnoremap("<M-b>", ":NvimTreeToggle<CR>", "silent")

-- nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", "silent")
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
-- nnoremap("<M-d>", "<cmd>lua require('telescope.builtin').buffers()<cr>", "silent")
nnoremap("<leader>ft", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", "silent")
-- keymap("n", "<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>", opts)
-- keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", opts)
keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').command_history()<cr>", opts)
nnoremap("<leader>c", "<cmd>lua require('telescope.builtin').commands()<cr>", "silent")


-- -- command+f to open sessionizer
-- if vim.loop.os_uname().sysname == "Darwin" then
--     nnoremap("<M-f>", "<cmd>!tmux neww tmux-sessionizer<cr>", "silent")
-- end

-- Ctrl/Cmd + p to search files
-- if vim.loop.os_uname().sysname == "Darwin" then
--     -- command+f to search
--     -- nnoremap("<M-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", "silent")
--     --
--     -- bind command + p to search
--     -- nnoremap("<M-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", "silent")
--     keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
-- end
--
-- if vim.loop.os_uname().sysname ~= "Darwin" then
--     -- ctrl+f to search
--     -- nnoremap("<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", "silent")
--
--     -- bind ctrl + p to search
--     nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", "silent")
-- end

-- ctrl+f to open sessionizer
if vim.loop.os_uname().sysname == "Darwin" then
    nnoremap("<C-f>", "<cmd>!tmux neww tmux-sessionizer<cr>", "silent")
end

-- nnoremap("<M-k>", "<cmd>lua require('telescope.builtin').keymaps()<cr>",
-- "silent")

-- Show code actions
nnoremap("ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", "silent")
-- keymap("n", "gD", "vim.diagnostic.open_float(nil, {focus=false})<CR>", opts)

-- nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "silent")
-- nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "silent")
nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "silent")
nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "silent")
nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", "silent")
-- keymap("n", "<leader>t", ":TagbarTogge<CR>", opts)

keymap("n", "<leader>t", ":Telescope<CR>", opts)
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- indeed the greatest remap ever
-- when pasting with <leader>p, it doesnt swap the clipboard with the replaced text
keymap("x", "<leader>p", "\"_dP", opts)
-- keymap("n", "<leader>b", vim.cmd.Ex)


-- Diagnostic keymaps
-- keymap('n', '[d', vim.diagnostic.goto_prev, opts)
-- keymap('n', ']d', vim.diagnostic.goto_next, opts)
-- keymap('n', '<leader>e', vim.diagnostic.open_float, opts)
-- keymap('n', '<leader>q', vim.diagnostic.setloclist, opts)
