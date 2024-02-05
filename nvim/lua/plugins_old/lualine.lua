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
            lualine_z = {},
        },
    },
    sections = {
        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                "filename",
                file_status = true, -- Displays file status (readonly status, modified status)
                newfile_status = false, -- Display new file status (new file means no write after created)
                path = 1,   -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
                -- 4: Filename and parent dir, with tilde as the home directory

                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = "[+]", -- Text to show when the file is modified.
                    readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
                    unnamed = "[No Name]", -- Text to show for unnamed buffers.
                    newfile = "[New]", -- Text to show for newly created file before first write
                },
            },
            "require'lsp-status'.status()",
        },
    },
})
