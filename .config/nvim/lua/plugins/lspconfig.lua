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

		local omni_lsp_command = ""
		if vim.loop.os_uname().sysname == "Darwin" then
			omni_lsp_command = "/Users/tesohh/dev/omniscience/target/debug/lsp"
		elseif vim.loop.os_uname().sysname == "Linux" then
			omni_lsp_command = "/home/tesohh/dev/omniscience/target/debug/lsp"
		end

		vim.lsp.config("omniscience", {
			cmd = { omni_lsp_command },
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

		vim.lsp.enable("hls")
	end,
}
