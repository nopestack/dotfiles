local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"

return {
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path),
    },
    tools = {
        reload_workspace_from_cargo_toml = true,
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = true,
            only_current_line = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
            show_parameter_hints = true,
            highlight = "Comment",
            lifetime_elision_hints = true,
        },
        hover_actions = {
            auto_focus = true,
        },
    },
}
