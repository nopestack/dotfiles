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

function M.create_augroup(autocmds, name)
    cmd("augroup " .. name)
    cmd("autocmd!")
    for _, autocmd in ipairs(autocmds) do
        cmd("autocmd " .. table.concat(autocmd, " "))
    end
    cmd("augroup END")
end

function M.smart_quit()
    local bufnr = vim.api.nvim_get_current_buf()
    local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
    if modified then
        vim.ui.input({
            prompt = "You have unsaved changes. Quit anyway? (y/n) ",
        }, function(input)
            if input == "y" then
                vim.cmd "q!"
            end
        end)
    else
        vim.cmd "q!"
    end
end

return M
