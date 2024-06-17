local M = {}
local cmd = vim.cmd

-- " Remeber last cursor position
-- if has("autocmd")
--   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
-- endif

-- vim.cmd [[au BufNewFile,BufRead *.sol setfiletype solidity]]

local default_opts = { noremap = true, silent = true }

-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

M.keymap = keymap
M.buf_keymap = vim.api.nvim_buf_set_keymap

M.nmap = function(lhs, rhs, desc)
    local opts = default_opts
    opts["desc"] = desc
    keymap("n", lhs, rhs, opts)
end

M.meta_key = "M"
if vim.g.neovide then
    M.meta_key = "D"
end

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
        vim.ui.input({ prompt = "You have unsaved changes. Quit anyway? (y/n) " }, function(input)
            if input == "y" then
                vim.cmd("q!")
            end
        end)
    else
        vim.cmd("q!")
    end
end

function M.must_require(modname)
    local mod_ok, mod = pcall(require, modname)
    if not mod_ok then
        error("module " .. modname .. " not found")
    end

    return mod
end

function M.get_os()
    return vim.loop.os_uname().sysname
end

function M.is_macos()
    if vim.loop.os_uname().sysname == "Darwin" then
        return true
    end
end

-- check if value in table
function M.contains(t, value)
    for _, v in pairs(t) do
        if v == value then
            return true
        end
    end
    return false
end

function M.enable_format_on_save()
    local format_sync_group = vim.api.nvim_create_augroup("format_on_save", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
            -- vim.lsp.buf.format({ timeout_ms = 200 })
            vim.lsp.buf.format({ async = false, timeout_ms = 200 })
        end,
        group = format_sync_group,
    })

    vim.notify("Enabled format on save")
end

--
function M.disable_format_on_save()
    M.remove_augroup("format_on_save")
    vim.notify("Disabled format on save")
end

function M.toggle_format_on_save()
    if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
        M.enable_format_on_save()
    else
        M.disable_format_on_save()
    end
end

function M.remove_augroup(name)
    if vim.fn.exists("#" .. name) == 1 then
        vim.cmd("au! " .. name)
    end
end

return M

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
