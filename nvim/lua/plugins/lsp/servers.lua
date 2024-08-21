return {
    rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    autoreload = true,
                },
                checkOnSave = {
                    command = "clippy",
                },
                inlayHints = {
                    lifetimeElisionHints = {
                        enable = true,
                    },
                },
            },
        },
    },
    jsonls = {
        settings = {
            json = {
                schema = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    },
    terraformls = {
        cmd = { "terraform-ls" },
        arg = { "server" },
        filetypes = { "terraform", "tf", "terraform-vars" },
    },
    lua_ls = {
        Lua = {
            telemetry = { enable = false },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
    bashls = {
        filetypes = { "sh", "zsh" },
    },
    vimls = {
        filetypes = { "vim" },
    },
    tsserver = {},
    gopls = {},
    pyright = {},
    solidity_ls_nomicfoundation = {},
    ["helm-ls"] = {
        yamlls = {
            path = "yaml-language-server",
        },
    },
    yamlls = {
        -- enabled = true,
        -- enabledForFilesGlob = "*.{yaml,yml}",
        -- diagnosticsLimit = 50,
        -- showDiagnosticsDirectly = false,
        -- path = "yaml-language-server",
        config = {
            format = false,
            schemas = require("schemastore").yaml.schemas(),
            -- schemas = {
            -- 	kubernetes = "templates/**",
            -- 	["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
            -- 	["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            -- 	["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
            -- 	["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
            -- 	["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
            -- 	["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
            -- 	["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
            -- },
            completion = true,
            hover = true,
            -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
        },
    },
    zls = {
        settings = {
            enable_build_on_save = true,
            build_on_save_step = "check",
        },
    },
}
