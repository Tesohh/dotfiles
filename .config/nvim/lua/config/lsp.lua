vim.diagnostic.config({ virtual_text = true })

vim.lsp.enable({
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
})
