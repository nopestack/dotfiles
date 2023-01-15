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
    listchars = { space = "⋅", tab = "▸ ", trail = "·" },
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
    colorcolumn = "80",
    showtabline = 0,
    updatetime = 50,
    completeopt = "menuone,noinsert,noselect",
    termguicolors = true,
    filetype = "on",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.shortmess:append "c"

vim.g.transparency = true

vim.g.border_style = "rounded"
vim.g.markdown_fenced_languages = {
    "bash=sh",
    "javascript",
    "js=javascript",
    "json=javascript",
}

vim.cmd("filetype indent on")
