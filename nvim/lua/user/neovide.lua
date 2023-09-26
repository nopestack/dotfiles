if vim.g.neovide then
    print("Neovide is running")
    --
    -- Helper function for transparency formatting
    local alpha = function()
        return string.format("%x", math.floor(255 * vim.g.transparency or 0.85))
    end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    vim.g.neovide_transparency = 0.0
    vim.g.transparency = 0.85
    vim.g.neovide_background_color = "#0f1117" .. alpha()
    vim.g.neovide_remember_window_size = true

    -- Enable toggleterm only in Neovide
    require("user.toggleterm")
end
