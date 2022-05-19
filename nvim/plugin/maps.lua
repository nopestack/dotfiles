require"mapx".setup { global = true }

-- local map = vim.api.nvim_set_keymap

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

--  ,w
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

-- save file
nnoremap("<leader>w", ":w<CR>", "silent")
nnoremap("<M-s>", ":w<CR>", "silent")

nnoremap("Y", "yy", "silent")

-- To map <Esc> to exit terminal-mode:
tnoremap("<Esc>", "<C-\\><C-n>")

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
--
-- Tab traversal
nnoremap("<Tab>", ":bnext<CR>", "silent")
nnoremap("<S-Tab>", ":bprev<CR>", "silent")
--
-- "Close buffer
-- " Using command+w and ctrl+w respectively
nnoremap("<C-w>", ":bd<CR>", "silent")
-- nnoremap("<M-w>", ":bd<CR>", "silent")

-- nnoremap("<C-n>", ":NvimTreeToggle<CR>")
nnoremap("<leader>r", ":NvimTreeRefresh<CR>")

-- "Open NvimTree
-- " Using command+p and ctrl+p respectively
-- nnoremap("<C-b>", ":NvimTreeToggle<CR>", "silent")
-- nnoremap("<M-b>", ":NvimTreeToggle<CR>", "silent")

nnoremap("<C-b>", ":CHADopen<CR>", "silent")
nnoremap("<M-b>", ":CHADopen<CR>", "silent")

-- bind command + p to search
nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>",
         "silent")

nnoremap("<M-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>",
         "silent")

-- command+f to search
nnoremap("<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>",
         "silent")

nnoremap("<M-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>",
         "silent")

-- nnoremap("<M-k>", "<cmd>lua require('telescope.builtin').keymaps()<cr>",
-- "silent")

nnoremap("<leader>t", "<cmd>lua require('telescope.builtin').colorscheme()<cr>",
         "silent")

nnoremap("<leader>p", "<cmd>lua require('telescope.builtin').commands()<cr>",
         "silent")

-- Show docs on hover
nnoremap("K",
         "<cmd>lua vim.lsp.buf.hover()<CR><cmd>lua vim.lsp.buf.hover()<CR>",
         "silent")

-- Show code actions 
nnoremap("ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", "silent")

nnoremap("<M-i>", "<cmd>lua require('telescope.builtin').commands()<CR>",
         "silent")

-- nnoremap("<leader>v", "<cmd>CHADopen<cr>", "silent")
-- nnoremap("<M-b>", "<cmd>CHADopen<cr>", "silent")

