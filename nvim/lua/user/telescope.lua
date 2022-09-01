local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
telescope.load_extension("media_files")
local icons = require("user.icons")

telescope.setup {
    pickers = {
        live_grep = { theme = "dropdown" },
        find_files = { theme = "dropdown", previewer = false },
        commands = { theme = "dropdown" },
        keymaps = { theme = "dropdown" },
        colorscheme = { theme = "dropdown" },
        buffers = { theme = "dropdown", previewer = false },
    },

    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
            },
        },

        -- prompt_prefix = icons.ui.Telescope .. " ",
        -- selection_caret = " ",
        -- path_display = { "smart" },
        file_ignore_patterns = {
            ".git/",
            "target/",
            "docs/",
            "vendor/*",
            "%.lock",
            "__pycache__/*",
            "%.sqlite3",
            "%.ipynb",
            "node_modules/*",
            -- "%.jpg",
            -- "%.jpeg",
            -- "%.png",
            "%.svg",
            "%.otf",
            "%.ttf",
            "%.webp",
            ".dart_tool/",
            ".github/",
            ".gradle/",
            ".idea/",
            ".settings/",
            ".vscode/",
            "__pycache__/",
            "build/",
            "env/",
            "gradle/",
            "node_modules/",
            "%.pdb",
            "%.dll",
            "%.class",
            "%.exe",
            "%.cache",
            "%.ico",
            "%.pdf",
            "%.dylib",
            "%.jar",
            "%.docx",
            "%.met",
            "smalljre_*/*",
            ".vale/",
            "%.burp",
            "%.mp4",
            "%.mkv",
            "%.rar",
            "%.zip",
            "%.7z",
            "%.tar",
            "%.bz2",
            "%.epub",
            "%.flac",
            "%.tar.gz",
        }
    }
}
