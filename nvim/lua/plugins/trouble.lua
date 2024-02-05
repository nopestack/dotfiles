return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                auto_preview = false,
                auto_jump = {},
                auto_close = true,
            })
        end,
    },
}
