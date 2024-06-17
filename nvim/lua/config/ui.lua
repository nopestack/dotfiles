local utils = require("config.utils")
local tint = utils.must_require("tint")

tint.setup()

local M = {}

-- checks if your terminal has 24-bit color support
vim.cmd([[
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
]])

-- Set dark theme if macOS theme is dark, light otherwise.
local theme = vim.fn.system("defaults read -g AppleInterfaceStyle")
if string.find(theme, "Dark") then
    vim.o.background = "dark"
else
    vim.o.background = "light"
end

local function apply_color_overrides()
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

    vim.api.nvim_set_hl(0, "Search", { fg = "peru" })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#999999" })
end

local function set_transparent_bg()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local function set_readable_line_nr()
    -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#777777" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#777777" })
    -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cccccc" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cccccc" })
end

function M.apply_colors(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    if color == "nordfox" then
        vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e1e" })
        set_readable_line_nr()
    elseif color == "onedark" then
        vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e1e" })
        set_readable_line_nr()
    elseif color == "rose-pine" then
        set_transparent_bg()
        set_readable_line_nr()
    elseif color == "no-clown-fiesta" then
        -- set_transparent_bg()
        set_readable_line_nr()
    elseif color == "tokyonight-moon" then
        set_transparent_bg()
        set_readable_line_nr()
    elseif color == "sherbet" then
        set_transparent_bg()
        set_readable_line_nr()
    elseif color == "kanagawa" then
        set_readable_line_nr()
        return
    elseif color == "rosebones" then
        set_transparent_bg()
        set_readable_line_nr()
        return
    elseif color == "nordbones" then
        set_transparent_bg()
        set_readable_line_nr()
        return
    elseif color == "neobones" then
        set_transparent_bg()
        set_readable_line_nr()
        return
    elseif color == "zenbones" then
        set_transparent_bg()
        set_readable_line_nr()
        return
    elseif color == "tokyobones" then
        set_transparent_bg()
        set_readable_line_nr()
        return
    elseif color == "tokyonight" then
        set_transparent_bg()
        set_readable_line_nr()
        return
    elseif color == "zenburned" then
        set_transparent_bg()
        set_readable_line_nr()
        return
    elseif color == "monochrome" then
        set_transparent_bg()
        set_readable_line_nr()
        return
    elseif color == "tokyonight" then
        set_transparent_bg()
        set_readable_line_nr()
        return
    elseif color == "rasmus" then
        set_transparent_bg()
        set_readable_line_nr()
        return
    elseif color == "github_dark_colorblind" then
        set_transparent_bg()
        set_readable_line_nr()
        -- elseif color == "monet" then
        -- set_transparent_bg()
        -- set_readable_line_nr()
        -- elseif color == "kanagawa" then
        -- set_transparent_bg()
    else
        set_readable_line_nr()
    end
end

return M
--
-- -- apply_colors("no-clown-fiesta")
-- -- apply_colors("rasmus")
-- -- apply_colors("catppuccin-macchiato")
-- -- apply_colors("neobones")
-- -- apply_colors("kanagawa")
-- -- apply_colors("nebulous")
-- apply_colors("kanagawa-dragon")
-- -- apply_colors("monet")
-- -- apply_colors("poimandres")
-- -- apply_colors("monet")
-- -- apply_colors("habamax")
-- -- apply_colors("nordic")
-- -- apply_colors("nordic")
-- -- apply_colors("github_dark_colorblind")
-- -- apply_colors("tokyonight")
-- -- apply_colors("tokyobones")
-- -- apply_colors("nordic")
-- -- apply_colors("tundra")
-- -- apply_colors("rasmus")
-- -- apply_colors("nordbones")
-- -- apply_colors("substrata")
-- -- apply_colors("rosebones")
-- -- apply_colors("zenbones")
-- -- apply_colors("substrata")
-- -- apply_colors("rose-pine")
-- -- apply_colors("kyotonight")
-- -- apply_colors("tundra")
-- apply_color_overrides()
