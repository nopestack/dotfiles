vim.opt.exrc = true

vim.opt.showmatch = true

-- Set highlight on search
vim.o.hlsearch = false

-- incremental search
vim.opt.incsearch = true

-- number of columns occupied by a tab
vim.opt.tabstop = 4

-- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.softtabstop = 4

-- converts tabs to white space
vim.opt.expandtab = true

-- width for autoindents
vim.opt.shiftwidth = 4

vim.opt.fileencoding = "utf-8" -- the encoding written to a file
--
-- indent a new line the same amount as the line just typed
vim.opt.autoindent = true
vim.opt.showbreak = "+++"
vim.opt.errorbells = true
-- --        " add line numbers
vim.opt.number = true
vim.opt.showmode = false

-- " get bash-like tab completions
vim.opt.wildmode = { "longest", "list" }

--  " syntax highlighting
vim.opt.syntax = "on"

-- " enable mouse click
vim.opt.mouse = "a"

-- " using system clipboard
vim.opt.clipboard = "unnamedplus"

-- " highlight current cursorline
vim.opt.cursorline = true

-- " Speed up scrolling in Vim
vim.opt.ttyfast = true

-- " Sets relative line number
vim.opt.rnu = true
vim.opt.nu = true

-- -- set clipboard='unnamedplus' --   " using system clipboard
-- -- " set spell                 " enable spell check (may need to download language package)
-- -- " set noswapfile            " disable creating swap file
-- -- " set backupdir=~/.cache/vim " Directory to store backup files.

vim.opt.list = true
vim.opt.listchars = { space = "⋅", eol = "↲", tab = "▸ ", trail = "·" }
vim.opt.hidden = true
vim.opt.inccommand = "nosplit"
vim.opt.wrap = true
vim.opt.laststatus = 2
vim.opt.linebreak = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.shortmess = "c"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.conceallevel = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.titlestring = "%<%F - nvim"
vim.opt.cmdheight = 2

-- " set an 80 column border for good coding style
vim.opt.colorcolumn = "80"
vim.opt.showtabline = 2
vim.opt.updatetime = 50
vim.opt.completeopt = "menuone,noinsert,noselect"

-- "allow auto-indenting depending on file type
-- vim.cmd("plugin indent on")
vim.opt.filetype = "on"
-- vim.cmd([[
--    plugin indent on
-- ]])

-- vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

-- vim.g.border_style = "rounded"
vim.g.markdown_fenced_languages = {
    "bash=sh",
    "javascript",
    "js=javascript",
    "json=javascript",
}

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
