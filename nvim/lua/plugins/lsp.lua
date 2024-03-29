return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"folke/neodev.nvim",
		{ "b0o/schemastore.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		"RRethy/vim-illuminate",
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "single",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(require("plugins.lsp.servers")),
		})

		require("lspconfig.ui.windows").default_options.border = "single"

		local border = "single"

		-- to set border for floating windows on hover
		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

		require("neodev").setup()

		local utils = require("config.utils")
		local lsp_keymaps = require("config.keymaps").lsp_keymaps

		local function lsp_highlight_document(client)
			local status_ok, illuminate = pcall(require, "illuminate")
			if not status_ok then
				return
			end

			illuminate.on_attach(client)
		end

		local function on_attach(client, bufnr)
			lsp_keymaps(bufnr)
			lsp_highlight_document(client)
			-- vim.g.rustaceanvim.server.on_attach(client, bufnr)

			utils.enable_format_on_save()
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = require("plugins.lsp.servers")[server_name],
					filetypes = (require("plugins.lsp.servers")[server_name] or {}).filetypes,
				})
			end,
		})

		vim.diagnostic.config({
			title = false,
			underline = true,
			virtual_text = true,
			signs = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				source = "always",
				style = "minimal",
				border = "single",
				header = "",
				prefix = "",
			},
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}
