require("lualine").setup({
    options = {
        lower = true,
        theme = "nightfly",
        globalstatus = true,
        -- theme = 'nord'
        --        section_separators = '',
        --        component_separators = ''
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = {
            {
                "mode",
                lower = false,
                sources = { "nvim_lsp" },
                buffers_color = {
                    active = nil, -- color for active buffer
                    inactive = nil, -- color for inactive buffer
                },
            },
        },

        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "diagnostics" },
        lualine_z = { "location" },

    },
})
