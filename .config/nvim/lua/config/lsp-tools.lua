vim.diagnostic.config({ virtual_text = true })

local lsp_list = {
	"clangd",
	"cssls",
	"emmet_language_server",
	"gopls",
	"html",
	"lua_ls",
	"pyright",
	"svelte",
	"rust_analyzer",
	"tailwindcss",
	"ts_ls",
}

local tool_list = {
	"clang-format",
	"debugpy",
	"stylua",
	"isort",
	"black",
	"prettierd",
	"codelldb",
}

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			completeUnimported = true,
			analyses = {
				unusedparams = true,
				nilness = true,
				shadow = true,
			},
		},
	},
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				enable = true, -- Enable "check on save"
				command = "clippy", -- Use clippy instead of cargo check
			},
		},
	},
})

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = lsp_list })
require("mason-tool-installer").setup({ ensure_installed = tool_list })
