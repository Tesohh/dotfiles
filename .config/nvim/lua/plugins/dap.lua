return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "leoluz/nvim-dap-go" },
		{ "mfussenegger/nvim-dap-python" },
		{ "igorlfs/nvim-dap-view", opts = {} },
		"williamboman/mason.nvim",
	},
	config = function()
		local dap = require("dap")
		require("dap-python").setup("python3")
		require("dap-go").setup()

		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "⛔️", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapLogPoint", { text = "💬", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "⚪️", texthl = "", linehl = "", numhl = "" })

		vim.keymap.set({ "n", "x" }, "<leader>b", dap.toggle_breakpoint)
		vim.keymap.set({ "n", "x" }, "<leader>dr", dap.restart)
		vim.keymap.set({ "n", "x" }, "<leader>ds", dap.terminate)
		vim.keymap.set({ "n", "x" }, "<leader>dtc", dap.run_to_cursor)
		vim.keymap.set({ "n", "x" }, "<leader>dc", dap.continue)
		vim.keymap.set({ "n", "x" }, "<leader>di", dap.step_into)
		vim.keymap.set({ "n", "x" }, "<leader>do", dap.step_over)
		vim.keymap.set({ "n", "x" }, "<leader>dO", dap.step_out)
		vim.keymap.set({ "n", "x" }, "<leader>db", dap.step_back)
		vim.keymap.set({ "n", "x" }, "<leader>du", "<cmd>DapViewToggle<cr>")

		require("dap").adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "codelldb",
				args = { "--port", "${port}" },
			},
		}

		require("dap").configurations.rust = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
		require("dap").configurations.c = require("dap").configurations.rust
		require("dap").configurations.cpp = require("dap").configurations.rust

		require("dap.ext.vscode").load_launchjs(nil, { codelldb = { "c", "cpp", "rust" } })
	end,
}
