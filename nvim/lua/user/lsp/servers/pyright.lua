local util = require("lspconfig/util")

local function find_root(fname)
    return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml",
        "requirements.txt")(fname) or
        util.path.dirname(fname)
end

return {
    root_dir = find_root,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                typeCheckingMode = "strict",
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                inlayHints = { variableTypes = true, functionReturnTypes = true },
            },
        },
    },
}
