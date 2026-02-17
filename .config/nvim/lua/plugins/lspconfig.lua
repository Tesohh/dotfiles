return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.diagnostic.config({ virtual_text = true })
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

		vim.lsp.config("omniscience", {
			cmd = { "/Users/tesohh/dev/omniscience/target/debug/lsp" },
			filetypes = { "typst" },
			root_markers = { "omni.toml", ".git" },
			settings = {},
		})
		vim.lsp.enable("omniscience")

		vim.lsp.config("tinymist", {
			cmd = { "tinymist" },
			filetypes = { "typst" },
			root_markers = { "omni.toml", ".git" },
			settings = {
				formatterMode = "typstyle",
				-- exportPdf = "onType",
				-- semanticTokens = "disable",
			},
		})
	end,
}
