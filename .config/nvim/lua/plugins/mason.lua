local lsp_list = {
	"clangd",
	"cssls",
	"emmet_language_server",
	"gopls",
	"html",
	"lua_ls",
	"jdtls",
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
	"ruff",
	"prettierd",
	"codelldb",
}

return {
	{ "mason-org/mason.nvim", opts = true },
	{ "mason-org/mason-lspconfig.nvim", opts = { ensure_installed = lsp_list } },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = tool_list } },
}
