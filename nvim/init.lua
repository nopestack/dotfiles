-- " TODO: figure out how to refactor this autocommand to lua
-- " recompile plugins wehenever config/plugins.lua is udpated
-- vim.g.mapleader = ","
vim.g.mapleader = " "

-- load plugins
require("user.plugins")
require("user.options")
require("user.utils")
require("user.copilot")
require("user.keymaps")
require("user.ui")
require("user.lsp.lsp")
require("user.treesitter")
require("user.autocommands")
require("user.telescope")
require("user.bufferline")
require("user.statusline")
require("user.nvim_tree")
require("user.autopairs")
require("user.lastplace")
require("user.trouble")
require("user.modes")
require("user.symbols")
require("user.neovide")
