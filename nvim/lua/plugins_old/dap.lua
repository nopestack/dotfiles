local utils = require("user.utils")
local dap = utils.must_require("dap")
local dapui = utils.must_require("dapui")
local dapgo = utils.must_require("dap-go")

dapgo.setup()

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb",
    name = "lldb",
    cwd = "${workspaceFolder}",
}

-- local lldb = {
--     name = "Launch lldb",
--     type = "lldb",      -- matches the adapter
--     request = "launch", -- could also attach to a currently running process
--     program = function()
--         return vim.fn.input(
--             "Path to executable: ",
--             vim.fn.getcwd() .. "/",
--             "file"
--         )
--     end,
--     cwd = "${workspaceFolder}",
--     stopOnEntry = false,
--     runInTerminal = false,
-- }
--
-- local lldb_rust = {
--     name = "Launch lldb",
--     type = "lldb",      -- matches the adapter
--     request = "launch", -- could also attach to a currently running process
--     program = function()
--         return vim.fn.input(
--             "Path to executable: ",
--             vim.fn.getcwd() .. "/target/debug/",
--             "file"
--         )
--     end,
--     cwd = "${workspaceFolder}",
--     stopOnEntry = false,
--     runInTerminal = false,
-- }
--
-- dap.configurations.cpp = { lldb }
-- dap.configurations.c = { lldb }
-- dap.configurations.rust = { lldb_rust }

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
