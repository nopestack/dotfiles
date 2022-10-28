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
else
    vim.o.background = "light"
end

-- require('rose-pine').setup({
--     --- @usage 'main' | 'moon'
--     dark_variant = 'main',
--     bold_vert_split = false,
--     dim_nc_background = false,
--     disable_background = false,
--     disable_float_background = false,
--     disable_italics = false,
--
--     --- @usage string hex value or named color from rosepinetheme.com/palette
--     groups = {
--         background = 'base',
--         panel = 'surface',
--         border = 'highlight_med',
--         comment = 'muted',
--         link = 'iris',
--         punctuation = 'subtle',
--
--         error = 'love',
--         hint = 'iris',
--         info = 'foam',
--         warn = 'gold',
--
--         headings = {
--             h1 = 'iris',
--             h2 = 'foam',
--             h3 = 'rose',
--             h4 = 'gold',
--             h5 = 'pine',
--             h6 = 'foam',
--         }
--         -- or set all headings at once
--         -- headings = 'subtle'
--     },
--
--     -- Change specific vim highlight groups
--     highlight_groups = {
--         ColorColumn = { bg = 'rose' }
--     }
-- })
--
-- set colorscheme after options
-- vim.cmd('colorscheme rose-pine')

-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_transparent_sidebar = false
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_dark_float = true
-- vim.g.tokyonight_dark_sidebar = true
-- Configure the appearance
-- vim.g.rasmus_italic_functions = true
-- vim.g.rasmus_bold_functions = true
-- Load the colorscheme
-- vim.cmd [[colorscheme rasmus]]

-- Set the colorscheme variant to monochrome
-- vim.g.rasmus_variant = "monochrome"
-- vim.g.minimal_italic_functions = true
-- vim.g.minimal_italic_comments = false
-- -- Load the colorscheme
-- vim.cmd [[colorscheme minimal]]
-- or
-- vim.cmd [[colorscheme minimal-base16]]

-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

-- require("catppuccin").setup()

-- require('quantum').setup()

-- vim.cmd [[colorscheme catppuccin]]
-- vim.cmd [[colorscheme plain]]

-- vim.g.sonokai_style = "andromeda"
-- vim.g.sonokai_style = "atlantis"
-- vim.g.sonokai_style = "shusia"
-- vim.g.sonokai_enable_italic = 1
-- vim.g.sonokai_disable_italic_comment = 1
-- vim.cmd [[colorscheme sonokai]]
-- vim.cmd [[colorscheme plain]]

-- vim.cmd("colorscheme hybrid")
-- vim.cmd("colorscheme nightfox")
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme jellybeans-nvim")
-- vim.cmd("colorscheme base16-gruvbox-dark-hard")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme github_dark")
-- vim.cmd("colorscheme github_dark_default")
-- vim.cmd("colorscheme minimal")
-- vim.cmd("colorscheme github_dimmed")
-- vim.cmd("colorscheme ayu-mirage")
-- vim.cmd("colorscheme ayu")
-- vim.cmd("colorscheme ayu")
-- vim.cmd("colorscheme onenord")
-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme carbonfox")
-- vim.cmd("colorscheme meh")
-- vim.cmd("colorscheme substrata")
-- vim.cmd("colorscheme monochrome")
-- vim.cmd("colorscheme doom-one")
-- vim.cmd("colorscheme everblush")
-- vim.cmd("colorscheme halcyon")
-- vim.cmd("colorscheme base16-gruvbox-dark-hard")
-- vim.cmd("colorscheme aurora")
-- vim.cmd("colorscheme iceberg")
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme aurora")
-- vim.cmd("colorscheme base16-tokyo-city-terminal-dark")
-- vim.cmd("colorscheme aquarium")
-- vim.cmd("colorscheme minimal")

-- vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme nightfox")
-- vim.cmd("colorscheme base16-classic-dark")
-- vim.cmd("colorscheme jellybeans-nvim")
-- vim.cmd("colorscheme catppuccin")

-- vim.cmd("colorscheme lunar")
-- vim.cmd("colorscheme deep-space")
-- :hi LineNr guibg=none guifg=#ffffff
-- vim.cmd(":hi LineNr guifg=#aaaaaa")

-- hi SignColumn ctermbg=280 guibg=#2c2c2c
-- hi LineNr guibg=#2c2c2c guifg=#777777    ctermbg=NONE
-- hi LineNr guifg=#777777    ctermbg=NONE

vim.cmd([[
    hi SignColumn ctermbg=280 
    hi LineNr guifg=#777777    ctermbg=NONE
    hi CursorLineNr    guifg=#cccccc    ctermbg=NONE
    hi Search guibg=peru guifg=white 
    hi Comment         guifg=#999999 gui=italic
]])

-- vim.cmd([[
--     hi SignColumn ctermbg=280
--     "guibg=#2c2c2c
--     hi LineNr guifg=#777777    ctermbg=NONE
--     "guibg=#2c2c2c
--     hi CursorLineNr    guifg=#cccccc    ctermbg=NONE
--     hi Search guibg=peru guifg=white
--     hi Comment         guifg=#999999 gui=italic
-- ]])

-- vim.cmd([[
--     hi SignColumn ctermbg=280 guibg=#2c2c2c
--     hi LineNr guibg=#2c2c2c guifg=#777777    ctermbg=NONE
--     hi CursorLineNr    guifg=#cccccc    ctermbg=NONE
--     hi Search guibg=peru guifg=white
--     hi Comment         guifg=#999999 gui=italic
-- ]])

-- hi Comment         guifg=#777777 gui=italic
-- hi SignColumn ctermbg=230 guibg=#1c1c1c

-- highlight Comment         guifg=#cccccc gui=italic
-- hi DiagnosticError guifg=#88088F
-- hi DiagnosticWarn guifg=DarkOrange
-- hi DiagnosticInfo guifg=Blue
--
-- vim.opt.hybrid_custom_term_colors = 1
-- vim.opt.hybrid_reduced_contrast = 1

-- Old config for hints && info
-- highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
-- highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

-- Current config with bold text
-- highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
-- highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
-- highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=LightGray gui=bold
-- highlight! DiagnosticLineNrHint guibg=#1E205D guifg=LightBlue gui=bold

vim.cmd([[
  highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000
  highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 
  highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=LightGray
  highlight! DiagnosticLineNrHint guibg=#1E205D guifg=LightBlue

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]])
