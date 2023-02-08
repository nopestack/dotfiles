local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return end
-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

local actions = require("telescope.actions")
telescope.load_extension("media_files")

local action_layout = require("telescope.actions.layout")

local icons = require("user.icons")

telescope.setup {
    pickers = {
        live_grep = { theme = "dropdown" },
        find_files = { theme = "dropdown", previewer = false },
        commands = { theme = "dropdown" },
        keymaps = { theme = "dropdown" },
        lsp_dynamic_workspace_symbols = { theme = "dropdown" },
        lsp_document_symbols = { theme = "dropdown" },
        colorscheme = { theme = "dropdown" },
        command_history = { theme = "dropdown" },
        buffers = { theme = "dropdown", previewer = false },
        builtin = { theme = "dropdown", previewer = false },
    },

    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
                ["<M-p>"] = action_layout.toggle_preview,
                ["<C-u>"] = false,
            },
            n = {
                -- ["<esc>"] = actions.close,
                -- ["<M-p>"] = action_layout.toggle_preview
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
        },
    },
}
