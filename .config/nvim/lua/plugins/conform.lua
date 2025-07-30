return {
	"stevearc/conform.nvim",
	event = "BufWrite",
	opts = {
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
	},
	config = function(_, opts)
		require("conform").setup(opts)
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
