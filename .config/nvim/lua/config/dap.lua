vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "⛔️", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "💬", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⚪️", texthl = "", linehl = "", numhl = "" })

require("dap-python").setup("python3")
require("dap-go").setup()

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
