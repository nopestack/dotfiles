-- vim.cmd([[
--         imap <silent><script><expr> <C-space> copilot#Accept("\<CR>")
--         let g:copilot_no_tab_map = v:true
-- ]])

-- vim.g.copilot_no_tab_map = true
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-space>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
