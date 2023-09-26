local prettier = {
    formatCommand = 'prettierd "${INPUT}"',
    formatStdin = true,
    env = {
        string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
    },
}

local efm = {
    -- filetypes = { "lua", "python" },
    filetypes = { "lua" },
    -- TODO: setup TS/JS, Go and Python formatting
    init_options = { documentFormatting = true, codeAction = true },
    settings = {
        rootMarkers = {
            ".git/",
            "package.json",
            "yarn.lock",
            "requirements.txt",
            ".gitignore",
        },
        log_level = 1,
        log_file = "~/.efm.log",
        languages = {
            lua = { { formatCommand = "lua-format -i", formatStdin = true } },
            python = { { formatCommand = "black --quiet -", formatStdin = true } },
            prettier = { prettier },
        },
    },
}

return efm
