return {
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- Adds LSP completion capabilities
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",

        -- Adds a number of user-friendly snippets
        "rafamadriz/friendly-snippets",

        -- Adds vscode-like pictograms
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
        }

        require("luasnip.loaders.from_vscode").lazy_load()
        luasnip.config.setup({})

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
                -- Add tab support
                -- ["<Tab>"] = cmp.mapping.select_next_item(),
                -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),

                -- Make cmp play nice with Copilot
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
                ["<Tab>"] = nil,
                ["<S-Tab>"] = nil,
            }),
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = "copilot" },
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = "calc" },
                { name = "emoji" },
                { name = "treesitter" },
                { name = "crates" },
                { name = "tmux" },
            },
            formatting = {
                format = function(entry, vim_item)
                    local lspkind_ok, lspkind = pcall(require, "lspkind")
                    if not lspkind_ok then
                        -- From kind_icons array
                        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                        -- Source
                        vim_item.menu = ({
                            copilot = "[Copilot]",
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[Lua]",
                            luasnip = "[LuaSnip]",
                            buffer = "[Buffer]",
                            latex_symbols = "[LaTeX]",
                        })[entry.source.name]
                        return vim_item
                    else
                        -- From lspkind
                        return lspkind.cmp_format()(entry, vim_item)
                    end
                end,
            },
        })
    end,
}
