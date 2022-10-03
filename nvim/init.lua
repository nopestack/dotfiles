-- " TODO: figure out how to refactor this autocommand to lua
-- " recompile plugins wehenever config/plugins.lua is udpated
-- vim.g.mapleader = ","
vim.g.mapleader = " "

-- load plugins
require("user.plugins")
require("user.options")
require("user.utils")
require("user.keymaps")
require("user.catpuccin")
require("user.ui")
require("user.autocommands")
require("user.lsp.lsp")
require("user.telescope")
require("user.cmp")
require("user.bufferline")
-- require("user.feline")
-- require("user.lualine")
require("user.statusline")
require("user.nvim_tree")
require("user.navic")
-- require("user.neo-tree")
require("user.autopairs")
require("user.lastplace")
require("user.toggleterm")
require("user.trouble")
-- require("user.shade")
-- require("user.which-key")
