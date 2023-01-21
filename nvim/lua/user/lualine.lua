M = {}
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    print("Lualine not installed")
    return
end


lualine.setup({
    options = {
        globalstatus = true,
        icons_enabled = false,
        component_separators = "|",
        section_separators = "",
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = true,
    },
})
