require("mapx").setup({ global = true })

local utils = require("user.utils")

local opts = {
    noremap = true,
    silent = true,
}

local term_opts = { silent = true }

-- local keymap = vim.api.nvim_set_keymap
local keymap = utils.keymap
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

-- Reload config
nnoremap("<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")

-- save file
nnoremap("<leader>w", ":w<CR>", "silent")
nnoremap("<M-s>", ":w<CR>", "silent")

--
-- nnoremap("<leader>n", ":Ex<CR>", "silent")
-- nnoremap("<leader>b", ":Vex<CR>", "silent")
--

nnoremap("<C-q>", ":confirm qall<CR>", "silent")

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
--
-- TODO: debug M-w mapping to close windows
-- nnoremap("<M-w>", ":bd<CR>", "silent")

nnoremap("<C-b>", ":NvimTreeToggle<CR>", "silent")
nnoremap("<M-b>", ":NvimTreeToggle<CR>", "silent")

-- nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", "silent")
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
-- nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", "silent")
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
-- nnoremap("<M-d>", "<cmd>lua require('telescope.builtin').buffers()<cr>", "silent")
-- nnoremap("<leader>t", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", "silent")
keymap("n", "<leader>ft", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", opts)
nnoremap("<leader>c", "<cmd>lua require('telescope.builtin').commands()<cr>", "silent")


-- -- command+f to open sessionizer
-- if vim.loop.os_uname().sysname == "Darwin" then
--     nnoremap("<M-f>", "<cmd>!tmux neww tmux-sessionizer<cr>", "silent")
-- end

if vim.loop.os_uname().sysname == "Darwin" then
    -- command+f to search
    -- nnoremap("<M-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", "silent")
    --
    -- bind command + p to search
    -- nnoremap("<M-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", "silent")
    keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
end

if vim.loop.os_uname().sysname ~= "Darwin" then
    -- ctrl+f to search
    -- nnoremap("<C-f>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", "silent")

    -- bind ctrl + p to search
    nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", "silent")
end

-- ctrl+f to open sessionizer
if vim.loop.os_uname().sysname == "Darwin" then
    nnoremap("<C-f>", "<cmd>!tmux neww tmux-sessionizer<cr>", "silent")
end



-- nnoremap("<M-k>", "<cmd>lua require('telescope.builtin').keymaps()<cr>",
-- "silent")

-- Show code actions
nnoremap("ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", "silent")

-- nnoremap("<M-i>", "<cmd>lua require('telescope.builtin').commands()<CR>",
-- "silent")

-- nnoremap("<leader>v", "<cmd>CHADopen<cr>", "silent")
-- nnoremap("<M-b>", "<cmd>CHADopen<cr>", "silent")

keymap("n", "gD", "vim.diagnostic.open_float(nil, {focus=false})<CR>", opts)

-- nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "silent")
-- nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "silent")
nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "silent")
nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "silent")
nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>", "silent")
nnoremap("<leader>T", "<cmd>lua require('lsp_extensions').inlay_hints()<CR>", "silent")
