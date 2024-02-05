
return {
    {
    "folke/which-key.nvim",
    config = function()
local utils = require("config.utils")

vim.o.timeout = true
vim.o.timeoutlen = 300
local which_key = utils.must_require("which-key")

which_key.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
    end
    }
}

