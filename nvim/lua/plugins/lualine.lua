return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"meuter/lualine-so-fancy.nvim",
	},
	enabled = true,
	lazy = false,
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = true,
				icons_enabled = true,
				always_divide_middle = true,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {
						"alfa-nvim",
						"help",
						"neo-tree",
						"Trouble",
						"spectre_panel",
						"toggleterm",
					},
					winbar = {},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "neo-tree", "lazy" },
			sections = {
				-- lualine_b = {
				-- 	"fancy_branch",
				-- },
				-- lualine_c = {
				-- 	{
				-- 		"filename",
				-- 		path = 1, -- 2 for full path
				-- 		newfile_status = true, -- Display new file status (new file means no write after created)
				-- 		symbols = {
				-- 			modified = "  ",
				-- 			readonly = "  ",
				-- 			unnamed = "  ",
				-- 		},
				-- 	},
				-- 	{
				-- 		"fancy_diagnostics",
				-- 		sources = { "nvim_lsp" },
				-- 		symbols = { error = " ", warn = " ", info = " " },
				-- 	},
				-- 	{ "fancy_searchcount" },
				-- },
				-- lualine_x = {
				-- 	-- "fancy_lsp_servers",
				-- 	-- "fancy_diff",
				-- 	-- "progress",
				-- 	{
				-- 		"fancy_diagnostics",
				-- 		sources = { "nvim_lsp" },
				-- 		symbols = { error = " ", warn = " ", info = " " },
				-- 	},
				-- 	{ "fancy_searchcount" },
				-- 	"require'lsp-status'.status()",
				-- },
				-- lualine_y = {},
				-- lualine_z = {},

				lualine_b = { "fancy_branch" },
				lualine_c = {
					{
						"filename",
						-- Displays file status (readonly status, modified status)
						file_status = true,
						-- Display new file status (new file means no write after created)
						newfile_status = false,
						path = 1,
						-- 0: Just the filename
						-- 1: Relative path
						-- 2: Absolute path
						-- 3: Absolute path, with tilde as the home directory
						-- 4: Filename and parent dir, with tilde as the home directory

						shorting_target = 40, -- Shortens path to leave 40 spaces in the window
						symbols = {
							modified = "  ",
							readonly = "  ",
							unnamed = "  ",
						},
					},
					"require'lsp-status'.status()",
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
