local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

local nmap = function(lhs, rhs, desc)
    local opts = opts
    opts["desc"] = desc
    keymap("n", lhs, rhs, opts)
end

local meta_key = "M"
if vim.g.neovide then meta_key = "D" end

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

-- Move text up and down
-- TODO: map option to mean Alt
-- keymap("n", "<D-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<D-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Disable arrow keys
-- keymap('n', '<up>', '<nop>', opts)
-- keymap('n', '<down>', '<nop>', opts)
-- keymap('n', '<left>', '<nop>', opts)
-- keymap('n', '<right>', '<nop>', opts)

-- Reload config
-- nnoremap("<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
-- nmap("<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")

nmap("<leader>w", ":w<CR>", "[w]rite file to disk")
nmap("<M-s>", ":w<CR>", "[w]rite file to disk")

-- nmap("<leader>e", ":Lexplore<CR>", "[e]xplore directory")
-- nnoremap("<leader>n", ":Ex<CR>", "silent")
-- nnoremap("<leader>b", ":Vex<CR>", "silent")
-- nnoremap("<leader>b", ":Lex<CR>", "silent")

-- nnoremap("<C-q>", ":confirm qall<CR>", "silent")
nmap("<C-q>", ":confirm qall<CR>", "[q]uit all buffers and close NeoVim")

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

-- local expr_opts = { expr = true, silent = true }
-- keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], expr_opts)
-- keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], expr_opts)

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

-- Close buffer
-- Using ctrl+w
nmap("<C-w>", ":bd<CR>")

-- Open NvimTree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
-- keymap("n", "<" .. meta_key .. "-b>", ":NvimTreeToggle<CR>", opts)

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap("n", "<leader>ff",
    "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fw",
    "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)

nmap("<leader>ft", "<cmd>lua require('telescope.builtin').colorscheme()<cr>")
nmap("<leader>fh", "<cmd>lua require('telescope.builtin').command_history()<cr>")
nmap("<leader>c", "<cmd>lua require('telescope.builtin').commands()<cr>")
-- ctrl+f to open sessionizer
if vim.loop.os_uname().sysname == "Darwin" then
    keymap("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer<cr>", opts)
end

-- Show code actions
nmap("<leader>T", ":Telescope<CR>", "Toggle [T]elescope")
nmap("<leader>u", ":UndotreeToggle<CR>", "Toggle [u]ndotree")

-- indeed the greatest remap ever
-- when pasting with <leader>p, it doesnt swap the clipboard with the replaced text
-- NOTE: not needed since nvim 0.8.x
-- keymap("x", "<leader>p", "\"_dP", opts)

-- vim.api.nvim_set_keymap('n', 'n',
--     [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
--     opts)
-- vim.api.nvim_set_keymap('n', 'N',
--     [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
--     opts)
-- vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)

M = {}

function M.lsp_keymaps(bufnr)
    local local_opts = { buffer = bufnr, remap = false, silent = true }

    keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", local_opts)
    keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", local_opts)
    keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", local_opts)
    keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", local_opts)
    keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", local_opts)
    keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", local_opts)
    keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", local_opts)
    keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", local_opts)
    keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", local_opts)
    keymap("n", "<M-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", local_opts)

    nmap("<leader>fs",
        "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")

    keymap("n", "<leader>s", require("telescope.builtin").lsp_document_symbols,
        { desc = "[s] Document Symbols" })

    keymap("n", "<leader>S", ":SymbolsOutline<CR>", opts)

    keymap("n", "<leader>fd", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require("telescope.builtin").diagnostics(
            require("telescope.themes").get_dropdown {
                winblend = 10,
                previewer = false,
            })
    end, { desc = "Show Diagnostics" })

    keymap("n", "<leader>t", function()
            require("trouble").toggle({ mode = "document_diagnostics" })
        end,
        { desc = "Toggle [t]rouble" })
end

return M
