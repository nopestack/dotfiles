-- " TODO: figure out how to refactor this autocommand to lua
-- " recompile plugins wehenever config/plugins.lua is udpated
-- vim.g.mapleader = ","
vim.g.mapleader = " "

-- load plugins
require("user.plugins")
require("user.options")
require("user.utils")
require("user.keymaps")
require("user.ui")
require("user.autocommands")
require("user.lsp.lsp")
require("user.telescope")
require("user.cmp")
require("user.bufferline")
require("user.statusline")
require("user.chadtree")
require("user.autopairs")
require("user.lastplace")