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

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
    [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
    false
)

-- make it play nice with autosession
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = 'NvimTree*',
    callback = function()
        local view = require('nvim-tree.view')
        local is_visible = view.is_visible()

        local api = require('nvim-tree.api')
        if not is_visible then
            api.tree.open()
        end
    end,
})

-- avoid weird buffer clossing issues
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        local api = require('nvim-tree.api')

        -- Only 1 window with nvim-tree left: we probably closed a file buffer
        if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
            -- Required to let the close event complete. An error is thrown without this.
            vim.defer_fn(function()
                -- close nvim-tree: will go to the last hidden buffer used before closing
                api.tree.toggle({ find_file = true, focus = true })
                -- re-open nivm-tree
                api.tree.toggle({ find_file = true, focus = true })
                -- nvim-tree is still the active window. Go to the previous window.
                vim.cmd("wincmd p")
            end, 0)
        end
    end
})
