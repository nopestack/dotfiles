
local M = {}

local utils = require("config.utils")

local lsp_status_ok, lsp = pcall(require, "lsp-zero")
if not lsp_status_ok then
    vim.notify("cannot load lsp-zero", vim.log.levels.ERROR)
    return
end

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify("cannot load cmp", vim.log.levels.ERROR)
    return
end

-- Turn on lsp status information
local fidget_status_ok, fidget = pcall(require, "fidget")
if not fidget_status_ok then
    vim.notify("cannot load fidget", vim.log.levels.ERROR)
    return
end

local lsp_keymaps = require("user.keymaps").lsp_keymaps

fidget.setup()
