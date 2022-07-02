
local efm = {
    -- filetypes = { "lua", "python" },
    filetypes = { "solidity" },
    -- TODO: setup TS/JS, Go and Python formatting
    init_options = { documentFormatting = true, codeAction = true },
    settings = {
        rootMarkers = { ".git/", "package.json", "yarn.lock" },
        log_level = 1,
        log_file = "~/.efm.log",
        languages = {
            lua = { { formatCommand = "lua-format -i", formatStdin = true } },
        },
    },
}

return efm
