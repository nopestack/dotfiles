--

return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"tom-anders/telescope-vim-bookmarks.nvim",
		-- "telescope-dap.nvim",
	},
	lazy = true,
	cmd = "Telescope",

	config = function()
		local status_ok, telescope = pcall(require, "telescope")
		if not status_ok then
			vim.notify("could not require telescope")
			return
		end
		-- Enable telescope fzf native, if installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "possession")
		-- pcall(require("telescope").load_extension, "persisted")

		local actions = require("telescope.actions")
		telescope.load_extension("media_files")
		--telescope.load_extension('projects')

		local action_layout = require("telescope.actions.layout")

		local icons = require("config.icons")

		telescope.setup({
			pickers = {
				-- find_files = { hidden = true },
				-- live_grep = { theme = "dropdown" },
				--live_grep = { previewer = false },
				find_files = { previewer = false, hidden = true },
				-- find_files = find_file_opts,
				-- find_files = { theme = "ivy", hidden = true },
				-- find_files = { theme = "dropdown", hidden = true },
				-- commands = { theme = "dropdown" },
				-- keymaps = { theme = "dropdown" },
				-- lsp_dynamic_workspace_symbols = { theme = "dropdown" },
				-- lsp_document_symbols = { theme = "dropdown" },
				-- colorscheme = { theme = "dropdown" },
				-- command_history = { theme = "dropdown" },
				-- buffers = { theme = "dropdown", previewer = false },
				-- buffers = { theme = "ivy", previewer = false },
				-- buffers = { theme = "dropdown" },
				-- builtin = { theme = "dropdown", previewer = false },
				builtin = { previewer = false },
			},

			defaults = {
				mappings = {
					i = {
						["<esc><esc>"] = actions.close,
						-- ["<Tab>"] = actions.move_selection_next,
						-- ["<S-Tab>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<M-p>"] = action_layout.toggle_preview,
						["<C-u>"] = false,
					},
					n = {
						-- ["<esc>"] = actions.close,
						-- ["<M-p>"] = action_layout.toggle_preview
					},
				},
				prompt_prefix = icons.ui.ChevronRight .. " ",
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
		})
	end,
}
