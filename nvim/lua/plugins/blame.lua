return {
    "f-person/git-blame.nvim",
    config = function()
        require("gitblame").setup({
            virt_text = true,
            virt_text_pos = "eol",
            virt_text_format = true,
            virt_text_hide = false,
            window = 0,
        })
    end,
}
