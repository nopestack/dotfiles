M = {}
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    print("Lualine not installed")
    return
end


lualine.setup({
    options = {
        globalstatus = true,
        icons_enabled = true,
        component_separators = "|",
        section_separators = "",
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = true,
        inactive_sections = {
            lualine_a = {},
            lualine_b = { "diff" },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
    },
})
