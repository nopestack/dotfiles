-- require("mapx").setup({ global = true })
-- TODO: eliminate dep on mapx
local utils = require("user.utils")

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.keymap.set

local nmap = function(lhs, rhs) keymap("n", lhs, rhs, opts) end

local buf_keymap = require("user.utils").buf_keymap

local meta_key = "M"
if vim.g.neovide then meta_key = "D" end
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
nmap("<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")

nmap("<leader>w", ":w<CR>")
nmap("<M-s>", ":w<CR>")

-- nnoremap("<leader>n", ":Ex<CR>", "silent")
-- nnoremap("<leader>b", ":Vex<CR>", "silent")
-- nnoremap("<leader>b", ":Lex<CR>", "silent")

-- nnoremap("<C-q>", ":confirm qall<CR>", "silent")
nmap("<C-q>", ":confirm qall<CR>")

-- Copy entire line with Y
nmap("Y", "yy")

-- To map <Esc> to exit terminal-mode:
nmap("<Esc>", "<C-\\><C-n>")

keymap("n", "<leader><space>", require("telescope.builtin").buffers,
    { desc = "[ ] Find existing buffers" })

keymap("n", "<leader>/", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").current_buffer_fuzzy_find(require(
        "telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = "[/] Fuzzily search in current buffer]" })

-- clear search
keymap("n", "<leader>n", ":noh<CR>", opts)
keymap("n", "<leader>?", require("telescope.builtin").oldfiles,
    { desc = "[?] Find recently opened files" })

local expr_opts = { expr = true, silent = true }
keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], expr_opts)
keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], expr_opts)

-- " Search mappings: These will make it so that going to the next one in a
-- " search will center on the line it's found in.
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- Split navigation
nmap("<C-J>", "<C-W><C-J>")
nmap("<C-K>", "<C-W><C-K>")
nmap("<C-L>", "<C-W><C-L>")
nmap("<C-H>", "<C-W><C-H>")

-- Buffer traversal with Tab
-- nnoremap("<Tab>", ":bnext<CR>", "silent")
-- nnoremap("<S-Tab>", ":bprev<CR>", "silent")

-- Alt + Tab and Alt + Shift + Tab
nmap("<A-Tab>", ":bnext<CR>")
nmap("<A-S-Tab>", ":bprev<CR>")

-- Ctrl + Tab and Ctrl + Shift + Tab
-- NOTE: doesnt work
-- nnoremap("<C-Tab>", ":bnext<CR>", "silent")
-- nnoremap("<C-S-Tab>", ":bprev<CR>", "silent")

-- "Close buffer
-- " Using command+w and ctrl+w respectively
nmap("<C-w>", ":bd<CR>")
--
-- TODO: debug M-w mapping to close windows on TUI
if vim.g.neovide then nmap("<" .. meta_key .. "-w>", ":bd<CR>") end

-- Open NvimTree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<" .. meta_key .. "-b>", ":NvimTreeToggle<CR>", opts)

-- open netrw
--  TODO: revisit netrw later
-- vim.keymap.set("n", "<leader>b", vim.cmd.Lex)

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap("n", "<leader>ff",
    "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fw",
    "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)

nmap("<leader>ft", "<cmd>lua require('telescope.builtin').colorscheme()<cr>")

nmap("<leader>fs",
    "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")

nmap("<leader>fh", "<cmd>lua require('telescope.builtin').command_history()<cr>")

nmap("<leader>c", "<cmd>lua require('telescope.builtin').commands()<cr>")

-- keymap("n", "<leader>fwd", require("telescope.builtin").diagnostics,
--     { desc = "[fd] Find Workspace Diagnostics" })

keymap("n", "<leader>fd", function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require("telescope.builtin").diagnostics(
        require("telescope.themes").get_dropdown {
            winblend = 10,
            previewer = false,
        })
end, { desc = "[fd] Find Diagnostics" })

keymap("n", "<leader>T", function()
    require("trouble").toggle({ mode = "document_diagnostics" })
end, { desc = "[T] Toggle Trouble" })

-- ctrl+f to open sessionizer
if vim.loop.os_uname().sysname == "Darwin" then
    keymap("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<cr>", opts)
end

-- Show code actions
keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>t", ":Telescope<CR>", opts)
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- indeed the greatest remap ever
-- when pasting with <leader>p, it doesnt swap the clipboard with the replaced text
keymap("x", "<leader>p", "\"_dP", opts)

M = {}

function M.lsp_keymaps(bufnr)

    buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>",
        opts)
    buf_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>",
        opts)
    buf_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        opts)
    buf_keymap(bufnr, "n", "<M-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        opts)

    -- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])

    keymap("n", "<leader>s", require("telescope.builtin").lsp_document_symbols,
        { desc = "[s] Document Symbols" })

    keymap("n", "<leader>S", ":SymbolsOutline<CR>", opts)

    -- update the window number here so that we can map escape to close even
    -- when there are no actions, update the rest of the state later
    -- M._state.winnr = winnr
    -- vim.api.nvim_buf_set_keymap(
    --   bufnr,
    --   "n",
    --   "<Esc>",
    --   ":lua require'rust-tools.hover_actions'._close_hover()<CR>",
    --   set_keymap_opt
    -- )
end

return M
