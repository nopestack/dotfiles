-- vim.cmd([[
--     augroup packer_user_config
--       autocmd!
--       autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--     augroup end
-- ]])

-- Show diagnostic popup on cursor hold

-- Show diagnostic popup on cursor hold
-- TODO: figure out how to make this look prettier
-- vim.cmd([[
--     set updatetime=300
--     autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]])

-- figure out what this does
-- vim.cmd([[
--     set runtimepath^=~/.vim runtimepath+=~/.vim/after
--     let &packpath = &runtimepath
-- ]])
