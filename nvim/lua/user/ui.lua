local utils = require("user.utils")
local tint = utils.must_require("tint")

tint.setup()

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
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#777777" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cccccc" })
end

-- Configure the appearance

utils.must_require('rose-pine').setup({
    disable_background = true
})


vim.g.substrata_italic_comments = true
vim.g.substrata_italic_keywords = true
vim.g.substrata_italic_booleans = false
vim.g.substrata_italic_functions = true
vim.g.substrata_italic_variables = false
vim.g.substrata_transparent = true
-- vim.g.substrata_variant=default	Colorscheme variant

-- vim.g.rasmus_variant = "monochrome"
vim.g.rasmus_italic_comments = true
vim.g.rasmus_italic_keywords = true
vim.g.rasmus_italic_booleans = false
vim.g.rasmus_italic_functions = true
vim.g.rasmus_italic_variables = false
vim.g.rasmus_bold_comments = false
vim.g.rasmus_bold_keywords = true
vim.g.rasmus_bold_booleans = false
vim.g.rasmus_bold_functions = true
vim.g.rasmus_bold_variables = false
vim.g.rasmus_transparent = true

require("no-clown-fiesta").setup({
    transparent = true,
    styles = {
        comments = { italic = true },
        keywords = {},
        functions = { italic = true, bold = true },
        variables = {},
        type = { bold = true, italic = true },
        lsp = { underline = true }
    },
})

require('kanagawa').setup({
    -- compile = false,  -- enable compiling the colorscheme
    -- undercurl = true, -- enable undercurls
    -- commentStyle = { italic = true },
    -- functionStyle = {},
    keywordStyle = { italic = true },
    -- statementStyle = { bold = true },
    -- typeStyle = {},
    transparent  = true, -- do not set background color
    dimInactive  = true, -- dim inactive window `:h hl-NormalNC`
    -- terminalColors = true, -- define vim.g.terminal_color_{0,17}
    -- colors = {
    --     -- add/modify theme and palette colors
    --     palette = {}
    --     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    -- },
    theme        = "dragon", -- Load "wave" theme when 'background' option is not set
    -- background   = {
    --     --     -- map the value of 'background' option to a theme
    --     --     -- dark = "wave", -- try "dragon" !
    --     -- dark = "dragon", -- try "dragon" !
    --     --     light = "lotus"
    -- },
})

require('nvim-tundra').setup({
    transparent_background = true,
    dim_inactive_windows = {
        enabled = false,
        color = nil,
    },
    sidebars = {
        enabled = true,
        color = nil,
    },
    editor = {
        search = {},
        substitute = {},
    },
    syntax = {
        booleans = { bold = true, italic = true },
        comments = { bold = true, italic = true },
        conditionals = {},
        constants = { bold = true },
        fields = {},
        functions = {},
        keywords = {},
        loops = {},
        numbers = { bold = true },
        operators = { bold = true },
        punctuation = {},
        strings = {},
        types = { italic = true },
    },
    diagnostics = {
        errors = {},
        warnings = {},
        information = {},
        hints = {},
    },
    plugins = {
        lsp = true,
        treesitter = true,
        telescope = true,
        nvimtree = true,
        cmp = true,
        context = true,
        dbui = true,
        gitsigns = true,
        neogit = true,
    },
    overwrite = {
        colors = {},
        highlights = {},
    },
})

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    -- background = {
    --     dark = "macchiato",
    -- },
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.25,
    },
    no_italic = false, -- Force no italic
    no_bold = false,   -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "italic" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    -- color_overrides = {},
    -- custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

require("nightly").setup({
    transparent = true,
    styles = {
        comments = { italic = true },
        functions = { italic = false },
        variables = { italic = false },
        keywords = { italic = true },
    },
    highlights = {},
})

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"

require 'nordic'.setup {
    -- This callback can be used to override the colors used in the palette.
    bold_keywords = false,
    -- Enable italic comments.
    italic_comments = true,
    -- Enable general editor background transparency.
    transparent_bg = true,
    -- Enable brighter float border.
    bright_border = true,
    -- Reduce the overall amount of blue in the theme (diverges from base Nord).
    reduced_blue = true,
    -- Swap the dark background with the normal one.
    swap_backgrounds = false,
    -- Cursorline options.  Also includes visual/selection.
    cursorline = {
        -- Bold font in cursorline.
        bold = false,
        -- Bold cursorline number.
        bold_number = true,
        -- Avialable styles: 'dark', 'light'.
        theme = 'dark',
        -- Blending the cursorline bg with the buffer bg.
        blend = 0.7,
    },
    noice = {
        -- Available styles: `classic`, `flat`.
        style = 'flat',
    },
    telescope = {
        -- Available styles: `classic`, `flat`.
        style = 'flat',
    },
    leap = {
        -- Dims the backdrop when using leap.
        dim_backdrop = false,
    },
    ts_context = {
        -- Enables dark background for treesitter-context window
        dark_background = true,
    }
}

require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day",    -- The theme is used when the background is set to light
    transparent = true,     -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        -- sidebars = "normal",          -- style for sidebars, see below
        -- floats = "normal",            -- style for floating windows
    },
    sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    -- dim_inactive = false,             -- dims inactive windows
    -- lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
    --
    -- --- You can override specific color groups to use other groups or a hex color
    -- --- function will be called with a ColorScheme table
    -- ---@param colors ColorScheme
    -- on_colors = function(colors) end,
    --
    -- --- You can override specific highlights to use other groups or a hex color
    -- --- function will be called with a Highlights and ColorScheme table
    -- ---@param highlights Highlights
    -- ---@param colors ColorScheme
    -- on_highlights = function(highlights, colors) end,
})

local function apply_colors(color)
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
    elseif color == "forestbones" then
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
        -- elseif color == "kanagawa" then
        -- set_transparent_bg()
    else
        set_readable_line_nr()
    end
end

-- apply_colors("no-clown-fiesta")
-- apply_colors("rasmus")
-- apply_colors("catppuccin-macchiato")
-- apply_colors("neobones")
-- apply_colors("kanagawa")
-- apply_colors("nebulous")
apply_colors("kanagawa-dragon")
-- apply_colors("github_dark_colorblind")
-- apply_colors("tokyonight")
-- apply_colors("tokyobones")
-- apply_colors("nordic")
-- apply_colors("tundra")
-- apply_colors("rasmus")
-- apply_colors("nordbones")
-- apply_colors("substrata")
-- apply_colors("rosebones")
-- apply_colors("zenbones")
-- apply_colors("substrata")
-- apply_colors("rose-pine")
-- apply_colors("kyotonight")
-- apply_colors("tundra")
-- apply_colors("kanagawa-dragon")
apply_color_overrides()
