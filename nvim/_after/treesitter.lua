local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end


local ctx_status_ok, ts_ctx = pcall(require, "nvim-treesitter-context")
if not ctx_status_ok then
    return
end

configs.setup({
    ensure_installed = "maintained",
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
        -- use_languagetree = true,
        enable = true, -- false will disable the whole extension
        -- disable = { "css", "html" }, -- list of language that will be disabled
        -- disable = { "css", "markdown" }, -- list of language that will be disabled
        -- disable = { "markdown" }, -- list of language that will be disabled
        -- additional_vim_regex_highlighting = true,
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true, disable = { "python", "css", "rust" } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    autotag = {
        enable = true,
        disable = { "xml", "markdown" },
    },
    rainbow = {
        enable = false,
        colors = {
            "Gold",
            "Orchid",
            "DodgerBlue",
            -- "Cornsilk",
            -- "Salmon",
            -- "LawnGreen",
        },
        disable = { "html" },
    },
    playground = {
        enable = true,
    },
    additional_vim_regex_highlighting = false,
})

ts_ctx.setup({})
