local M = {}
local cmd = vim.cmd

-- " Remeber last cursor position
-- if has("autocmd")
--   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
-- endif

-- vim.cmd [[au BufNewFile,BufRead *.sol setfiletype solidity]]

local keymap = vim.api.nvim_set_keymap

M.keymap = keymap
M.buf_keymap = vim.api.nvim_buf_set_keymap

local inlay_hints = require("lsp_extensions.inlay_hints")

-- Global function, so you can just call it on the lua side
ShowInlineInlayHints = function()
    vim.lsp.buf_request(
        0,
        "rust-analyzer/inlayHints",
        inlay_hints.get_params(),
        inlay_hints.get_callback({
            only_current_line = false,
        })
    )
end

function M.create_augroup(autocmds, name)
    cmd("augroup " .. name)
    cmd("autocmd!")
    for _, autocmd in ipairs(autocmds) do
        cmd("autocmd " .. table.concat(autocmd, " "))
    end
    cmd("augroup END")
end

return M

-- local vim = vim

-- Update inlay hints when opening a new buffer and when writing a buffer to a
-- file
-- opts is a string representation of the table of options
-- function M.setup_autocmd()
--     local events = "BufEnter,BufWinEnter,TabEnter,BufWritePost"
--     vim.api.nvim_command("augroup InlayHints")
--     vim.api.nvim_command(
--         "autocmd "
--         .. events
--         .. ' *.rs silent! :lua require"rust-tools.inlay_hints".set_inlay_hints()'
--     )
--     vim.api.nvim_command("augroup END")
-- end
--
-- -- from mfussenegger/nvim-lsp-compl@29a81f3
-- function req(bufnr, method, params, handler)
--     return vim.lsp.buf_request(bufnr, method, params, M.mk_handler(handler))
-- end
--
-- -- Sends the request to rust-analyzer to get the inlay hints and handle them
-- function M.set_inlay_hints()
--     req(0, "textDocument/inlayHint", get_params(), handler)
-- end
--
-- vim.cmd([[
--     autocmd CursorHold,CursorHoldI *.rs :lua
-- ]])
--
