local M = {}
local cmd = vim.cmd

-- " Remeber last cursor position
-- if has("autocmd")
--   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
-- endif

-- vim.cmd [[au BufNewFile,BufRead *.sol setfiletype solidity]]

-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

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
        vim.ui.input(
            { prompt = "You have unsaved changes. Quit anyway? (y/n) " },
            function(input) if input == "y" then vim.cmd "q!" end end)
    else
        vim.cmd "q!"
    end
end

function M.must_require(modname)
    local mod_ok, mod = pcall(require, modname)
    if not mod_ok then error("module " .. modname .. " not found") end

    return mod
end

function M.get_os() return vim.loop.os_uname().sysname end

function M.is_macos()
    if vim.loop.os_uname().sysname == "Darwin" then return true end
end

-- check if value in table
function M.contains(t, value)
    for _, v in pairs(t) do if v == value then return true end end
    return false
end

return M

-- local left_pad = {
--     function()
--         return " "
--     end,
--     padding = 0,
--     color = function()
--         return { fg = gray }
--     end,
-- }
--
-- local right_pad = {
--     function()
--         return " "
--     end,
--     padding = 0,
--     color = function()
--         return { fg = dark_gray }
--     end,
-- }
--
-- local left_pad_alt = {
--     function()
--         return " "
--     end,
--     padding = 0,
--     color = function()
--         return { fg = gray }
--     end,
-- }
--
-- local right_pad_alt = {
--     function()
--         return " "
--     end,
--     padding = 0,
--     color = function()
--         return { fg = gray }
--     end,
-- }
--
-- local mode = {
--     -- mode component
--     function()
--         -- return "▊"
--         return " "
--         -- return "  "
--     end,
--     color = function()
--         -- auto change color according to neovims mode
--         return { fg = mode_color[vim.fn.mode()], bg = gray }
--     end,
--     padding = 0,
-- }
--
-- local hide_in_width_60 = function()
--     return vim.o.columns > 60
-- end
--
-- local hide_in_width = function()
--     return vim.o.columns > 80
-- end
--
-- local hide_in_width_100 = function()
--     return vim.o.columns > 100
-- end
