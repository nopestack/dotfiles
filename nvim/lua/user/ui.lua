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

require('noirbuddy').setup {
    preset = 'kiwi',
}

require('rose-pine').setup({
    dark_variant = 'moon',
    bold_vert_split = false,
    -- dim_nc_background = true,
    -- disable_background = true,
    -- disable_background = true,
    -- disable_float_background = true,
    -- disable_italics = false,

    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
        background = 'base',
        panel = 'surface',
        border = 'highlight_med',
        comment = '#999999',
        link = 'iris',
        punctuation = 'subtle',
        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',
        headings = 'subtle'
    },
})

function AppyColorOverrides()
    vim.cmd([[
    hi SignColumn ctermbg=280 
    hi LineNr guifg=#777777    ctermbg=NONE
    hi CursorLineNr    guifg=#cccccc    ctermbg=NONE
    hi Search guibg=peru guifg=peru 
    hi Comment         guifg=#999999 gui=italic

    highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000
    highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 
    highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=LightGray
    highlight! DiagnosticLineNrHint guibg=#1E205D guifg=LightBlue

    sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
    sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
    sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
    sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]   )

end

-- vim.cmd [[let g:everforest_background = 'hard']]

function ColorMyPencils(color)
    color = color or "everforest"
    vim.cmd.colorscheme(color)

    if vim.cmd.colorscheme == "plain" then
        vim.api.nvim_set_hl(0, "Normal", { bg = "280" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "280" })
        vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#202020" })

    elseif vim.cmd.colorscheme == "rose-pine" then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    else
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#777777" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cccccc" })
    end
end

ColorMyPencils()
AppyColorOverrides()

-- function ColorOverrides()
--     vim.api.nvim_set_hl(0, "SignColumn", { fg = "280" })
--     vim.api.nvim_set_hl(0, "Search", { fg = "peru" })
--     vim.api.nvim_set_hl(0, "Comment", { fg = "#999999" })
--     vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#202020" })
-- end
