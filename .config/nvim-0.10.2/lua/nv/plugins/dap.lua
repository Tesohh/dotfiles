return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "williamboman/mason.nvim",
    },
    config = function()
        local dap = require("dap")
        require("dap.ext.vscode").load_launchjs()
        local ui = require("dapui")
        ui.setup()
        require("dap-go").setup()
        require("nvim-dap-virtual-text").setup()

        vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointCondition", { text = "⛔️", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapLogPoint", { text = "💬", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "⚪️", texthl = "", linehl = "", numhl = "" })

        vim.keymap.set({ "n", "x" }, "<leader>b", dap.toggle_breakpoint)
        vim.keymap.set({ "n", "x" }, "<leader>?", function()
            ui.eval(nil, { enter = true })
        end)
        vim.keymap.set({ "n", "x" }, "<leader>dr", dap.restart)
        vim.keymap.set({ "n", "x" }, "<leader>ds", dap.terminate)
        vim.keymap.set({ "n", "x" }, "<leader>dtc", dap.run_to_cursor)
        vim.keymap.set({ "n", "x" }, "<leader>dc", dap.continue)
        vim.keymap.set({ "n", "x" }, "<leader>di", dap.step_into)
        vim.keymap.set({ "n", "x" }, "<leader>do", dap.step_over)
        vim.keymap.set({ "n", "x" }, "<leader>dO", dap.step_out)
        vim.keymap.set({ "n", "x" }, "<leader>db", dap.step_back)
        vim.keymap.set({ "n", "x" }, "<leader>du", ui.toggle)

        dap.listeners.before.event_terminated.dapui_config = function()
            vim.cmd([[DapVirtualTextForceRefresh]])
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            vim.cmd([[DapVirtualTextForceRefresh]])
            ui.close()
        end
    end,
}
