return {
    "mfussenegger/nvim-dap",
    event = "BufRead",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "folke/neodev.nvim",
        "leoluz/nvim-dap-go",
    },
    config = function()
        local utils = require("config.utils")
        local dap = require("dap")
        local virtual_text = require("nvim-dap-virtual-text")
        local dapui = utils.must_require("dapui")
        local dapgo = utils.must_require("dap-go")

        dap.adapters.lldb = {
            type = "executable",
            command = "/usr/bin/lldb",
            name = "lldb",
        }

        local lldb = {
            name = "Launch lldb",
            type = "lldb",      -- matches the adapter
            request = "launch", -- could also attach to a currently running process
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
        }

        dap.configurations.rust = {
            lldb,
        }

        dapgo.setup()
        virtual_text.setup({})
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
    end,
}
