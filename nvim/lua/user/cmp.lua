local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end


local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not cmp_status_ok then
    return
end

-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
--   return
-- end
--
-- local tabnine_status_ok, tabnine = pcall(require, "user.tabnine")
-- if not tabnine_status_ok then
--   return
-- end

local compare = require "cmp.config.compare"

cmp.setup({
    -- Enable LSP snippets
    snippet = { expand = function(args) vim.fn["vsnip#anonymous"](args.body) end },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- Add tab support
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },

    -- Installed sources
    sources = {
        { name = "cmp_tabnine" },
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "path" },
        { name = "buffer" },
    },

    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            -- before = function(entry, vim_item) return vim_item end,
        }),
    },

})

cmp.setup.cmdline(":", { sources = cmp.config.sources({ { name = "path" } }) })
