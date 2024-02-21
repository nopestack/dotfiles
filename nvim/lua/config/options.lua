local options = {
	exrc = true,
	backup = false,
	showmatch = true,
	-- Set highlight on search,
	hlsearch = false,
	-- incremental search,
	incsearch = true,
	-- number of columns occupied by a tab,
	tabstop = 4,
	-- see multiple spaces as tabstops so <BS> does the right thing,
	softtabstop = 4,
	-- converts tabs to white space,
	expandtab = true,
	-- width for autoindents,
	shiftwidth = 4,
	fileencoding = "utf-8",
	-- indent a new line the same amount as the line just typed,
	showbreak = "+++",
	errorbells = true,
	number = true,
	showmode = false,
	-- " get bash-like tab completions,
	wildmode = { "longest", "list" },
	--  " syntax highlighting,
	syntax = "on",
	-- " enable mouse click,
	mouse = "a",
	-- " using system clipboard,
	clipboard = "unnamedplus",
	-- " highlight current cursorline,
	cursorline = true,
	-- " Speed up scrolling in Vim,
	ttyfast = true,
	-- " Sets relative line number,
	nu = true,
	rnu = true,
	list = true,
	-- vim.opt.listchars = { space = "⋅", eol = "↲", tab = "▸ ", trail = "·" }
	-- listchars = { space = "⋅", tab = "▸ ", trail = "·" },
	listchars = { tab = "▸ ", trail = "·" },
	hidden = true,
	inccommand = "nosplit",
	wrap = true,
	laststatus = 3,
	linebreak = true,
	smarttab = true,
	autoindent = true,
	smartindent = true,
	signcolumn = "yes:1",
	scrolloff = 8,
	conceallevel = 0,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	titlestring = "%<%F - nvim",
	title = true,
	cmdheight = 2,
	pumheight = 10,
	showcmd = false,
	-- colorcolumn = "80",
	showtabline = 0,
	updatetime = 50,
	completeopt = "menuone,noinsert,noselect",
	termguicolors = true,
	filetype = "on",
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,
	fdc = "1",
	-- make rmagatti/auto-session play nice with other configs
	sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
	gcr = "n-c-sm:block,i-ci:ver25-Cursor,r-v-cr-o:hor40",
	splitkeep = "screen",
}

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c")
vim.g.transparency = true
vim.g.border_style = "single"
vim.g.markdown_fenced_languages = {
	"bash=sh",
	"javascript",
	"js=javascript",
	"json=javascript",
}

vim.cmd("filetype plugin indent on")
