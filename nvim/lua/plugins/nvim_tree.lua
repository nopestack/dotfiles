return {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			local status_ok, nvim_tree = pcall(require, "nvim-tree")
			if not status_ok then
				vim.notify("nvim-tree not installed", vim.log.levels.ERROR)
				return
			end

			local icons = require("config.icons")

			local HEIGHT_RATIO = 0.8 -- You can change this
			local WIDTH_RATIO = 0.5 -- You can change this too
			local WIDTH_RATIO_SMALL = 0.4 -- You can change this too
			local WIDTH_RATIO_BIG = 0.6 -- You can change this too

			local opts = {
				diagnostics = {
					enable = true,
					icons = {
						hint = icons.diagnostics.Hint,
						info = icons.diagnostics.Information,
						warning = icons.diagnostics.Warning,
						error = icons.diagnostics.Error,
					},
				},
				renderer = {
					add_trailing = true,
					-- group_empty = false,
					-- highlight_git = false,
					-- highlight_opened_files = "none",
					-- root_folder_modifier = ":t",
					indent_markers = {
						enable = true,
						icons = { corner = "└ ", edge = "│ ", none = "  " },
					},
					icons = {
						webdev_colors = true,
						git_placement = "before",
						padding = " ",
						symlink_arrow = " ➛ ",
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
						glyphs = {
							default = "",
							symlink = "",
							folder = {
								arrow_open = icons.ui.ArrowOpen,
								arrow_closed = icons.ui.ArrowClosed,
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},
							git = {
								unstaged = "",
								staged = "S",
								unmerged = "",
								renamed = "➜",
								untracked = "U",
								deleted = "",
								ignored = "◌",
							},
						},
					},
				},
				update_focused_file = { enable = true, ignore_list = {} },
				git = { enable = true, ignore = true, timeout = 500 },
				view = {
					-- number = true,
					-- relativenumber = true,
					float = {
						enable = true,
						open_win_config = function()
							local screen_w = vim.opt.columns:get()
							local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
							local window_w = screen_w * WIDTH_RATIO
							local window_h = screen_h * HEIGHT_RATIO
							local window_w_int = math.floor(window_w)
							local window_h_int = math.floor(window_h)
							local center_x = (screen_w - window_w) / 2
							local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

							return {
								border = "single",
								relative = "editor",
								row = center_y,
								col = center_x,
								width = window_w_int,
								height = window_h_int,
							}
						end,
					},
					width = function()
						-- NOTE: replace with WIDTH_RATIO when enabling floating window
						return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
					end,
				},
			}
			nvim_tree.setup(opts)

			vim.cmd([[nnoremap \ :NvimTreeToggle<cr>]])

			-- dynamically resize nvim-tree when resizing the window
			local tree_api = require("nvim-tree")
			local tree_view = require("nvim-tree.view")

			vim.api.nvim_create_augroup("NvimTreeResize", {
				clear = true,
			})

			vim.api.nvim_create_autocmd({ "VimResized" }, {
				group = "NvimTreeResize",
				callback = function()
					if tree_view.is_visible() then
						tree_view.close()
						tree_api.open()
					end
				end,
			})

			-- make it play nice with autosession
			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				pattern = "NvimTree*",
				callback = function()
					local view = require("nvim-tree.view")
					local is_visible = view.is_visible()

					local api = require("nvim-tree.api")
					if not is_visible then
						api.tree.open()
					end
				end,
			})

			-- avoid weird buffer clossing issues
			vim.api.nvim_create_autocmd("BufEnter", {
				nested = true,
				callback = function()
					local api = require("nvim-tree.api")

					-- Only 1 window with nvim-tree left: we probably closed a file buffer
					if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
						-- Required to let the close event complete. An error is thrown without this.
						vim.defer_fn(function()
							-- close nvim-tree: will go to the last hidden buffer used before closing
							api.tree.toggle({ find_file = true, focus = true })
							-- re-open nivm-tree
							api.tree.toggle({ find_file = true, focus = true })
							-- nvim-tree is still the active window. Go to the previous window.
							vim.cmd("wincmd p")
						end, 0)
					end
				end,
			})
		end,
	},
}
