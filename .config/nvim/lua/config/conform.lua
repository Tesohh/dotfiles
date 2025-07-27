require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		go = { "gofmt", "goimports" },
		rust = { "rustfmt", lsp_format = "fallback" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = { timeout_ms = 500 },
	formatters = {},
})
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
