vim.g.nvcode_termcolors = 256

-- checks if your terminal has 24-bit color support
vim.cmd([[
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
]])

-- Set dark theme if macOS theme is dark, light otherwise.
local theme = vim.fn.system("defaults read -g AppleInterfaceStyle")
if (string.find(theme, "Dark")) then
    vim.o.background = "dark"
    -- vim.cmd [[colorscheme moonfly]]
else
    vim.o.background = "light"
    -- vim.cmd [[colorscheme morning]]
end

-- vim.cmd("colorscheme hybrid")
-- vim.g.sonokai_style = "andromeda"
-- vim.g.sonokai_enable_italic = 1
-- vim.g.sonokai_disable_italic_comment = 1
-- vim.cmd("colorscheme nightfox")
-- vim.cmd("colorscheme kanagawa")
vim.cmd("colorscheme jellybeans-nvim")
-- vim.cmd("colorscheme github_dark")
-- vim.cmd("colorscheme github_dark")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme aurora")
-- vim.cmd("colorscheme lunar")

-- :hi LineNr guibg=none guifg=#ffffff

-- vim.cmd(":hi LineNr guifg=#aaaaaa")
-- vim.cmd("colorscheme iceberg")

vim.cmd([[
    highlight CursorLineNr    guifg=#cccccc    ctermbg=NONE
    highlight LineNr          guifg=#777777    ctermbg=NONE
    highlight Search guibg=peru guifg=white 
]])


-- Neovide specific settings
vim.cmd([[
    set guifont=Iosevka\ Nerd\ Font:h17
    let g:neovide_remember_window_size=v:true
    let g:neovide_input_use_logo=v:true
]])

-- highlight Comment         guifg=#cccccc gui=italic
-- hi DiagnosticError guifg=#88088F
-- hi DiagnosticWarn guifg=DarkOrange
-- hi DiagnosticInfo guifg=Blue
--

-- vim.opt.hybrid_custom_term_colors = 1
-- vim.opt.hybrid_reduced_contrast = 1
--
vim.cmd [[
  highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]
