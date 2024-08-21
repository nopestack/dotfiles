local border = "solid"

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        {
            "j-hui/fidget.nvim",
            opts = {
                notification = {
                    window = {
                        border = border,
                        max_width = 70,
                    },
                },
                -- integration = {
                --     ["nvim-tree"] = {
                --         enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
                --     },
                -- },
            },
        },
        "folke/neodev.nvim",
        { "b0o/schemastore.nvim" },
        { "hrsh7th/cmp-nvim-lsp" },
        "RRethy/vim-illuminate",
        "b0o/schemastore.nvim",
    },
    config = function()
        local mason = require("mason")

        mason.setup({
            ui = {
                border = border,
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local lsp_servers = require("plugins.lsp.servers")

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(lsp_servers),
        })

        require("lspconfig.ui.windows").default_options.border = border

        -- to set border for floating windows on hover
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or border
            opts.max_width = 80
            opts.relative = "cursor"
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
            vim.lsp.inlay_hint.enable(true)

            utils.enable_format_on_save()
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = lsp_servers[server_name],
                    filetypes = (lsp_servers[server_name] or {}).filetypes,
                })
            end,
        })

        vim.diagnostic.config({
            title = false,
            underline = true,
            virtual_text = true,
            signs = true,
            severity_sort = true,
            float = {
                source = true,
                style = "minimal",
                border = border,
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
