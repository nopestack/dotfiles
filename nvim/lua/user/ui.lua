local utils = require("user.utils")


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

local function apply_color_overrides()
    vim.cmd([[
    " hi SignColumn ctermbg=280 
    " hi LineNr guifg=#777777    ctermbg=NONE
    " hi CursorLineNr    guifg=#cccccc    ctermbg=NONE
    " hi Search guibg=peru guifg=peru 
    " hi Comment         guifg=#999999 gui=italic

    highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000
    highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 
    highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=LightGray
    highlight! DiagnosticLineNrHint guibg=#1E205D guifg=LightBlue

    sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
    sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
    sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
    sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]   )

    vim.api.nvim_set_hl(0, "Search", { fg = "peru" })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#999999" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#777777" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cccccc" })
end

local function set_transparent_bg()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.g.substrata_italic_functions = true
vim.g.substrata_variant = "brighter"

local function apply_colors(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    if color == "nordfox" then
        vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e1e" })

    elseif color == "sherbet" then
        vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e1e" })

    elseif color == "everforest" then
        vim.g.everforest_diagnostic_line_highlight = 1
        -- vim.g.everforest_background = 'hard'
        vim.g.everforest_ui_contrast = 'high'
        vim.g.everforest_diagnostic_text_highlight = 1
        vim.g.everforest_diagnostic_virtual_text = "colored"

        vim.fn.sign_define({
            {
                name = 'DiagnosticSignError',
                text = '',
                texthl = 'DiagnosticSignError',
                linehl = 'ErrorLine',
            },
            {
                name = 'DiagnosticSignWarn',
                text = '',
                texthl = 'DiagnosticSignWarn',
                linehl = 'WarningLine',
            },
            {
                name = 'DiagnosticSignInfo',
                text = '',
                texthl = 'DiagnosticSignInfo',
                linehl = 'InfoLine',
            },
            {
                name = 'DiagnosticSignHint',
                text = '',
                texthl = 'DiagnosticSignHint',
                linehl = 'HintLine',
            },
        })

        set_transparent_bg()

    elseif color == "rose-pine" then
        set_transparent_bg()
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e1e" })
    else
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#777777" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cccccc" })
    end

end

apply_colors("hybrid")
apply_color_overrides()

-- vim.cmd([[
--     autocmd ColorScheme * lua require("user.ui").apply_color_overrides()
-- ]])
--
-- autocmd TextYankPost * silent! lua vim.highlight.on_yank()

-- utils.create_augroup({
-- }, "ReApplyOverrides")
