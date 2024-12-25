return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls",
			"gopls",
			"rust_analyzer",
			"html",
			"cssls",
			"emmet_language_server",
			"tailwindcss",
			"ts_ls",
			"pyright",
			"clangd",
		},
	},
	config = function(_, opts)
		require("mason-lspconfig").setup(opts)
		require("mason-lspconfig").setup_handlers({
			function(server_name) -- default handler (optional)
				local capabilities = require("blink.cmp").get_lsp_capabilities(nil)
				require("lspconfig")[server_name].setup({ capabilities = capabilities })
			end,
			["lua_ls"] = function()
				require("lspconfig")["lua_ls"].setup({
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = {
								enable = false,
							},
						},
					},
				})
			end,
			-- 	["lua_ls"] = function()
			-- 		local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- 		require("lspconfig").lua_ls.setup({
			-- 			capabilities = capabilities,
			-- 			settings = {
			-- 				Lua = {
			-- 					diagnostics = {
			-- 						globals = { "vim", "hs" },
			-- 					},
			-- 					workspace = {
			-- 						library = {
			-- 							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
			-- 							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
			-- 							["/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/"] = true,
			-- 						},
			-- 					},
			-- 				},
			-- 			},
			-- 		})
			-- 	end,
			--
			-- 	["html"] = function()
			-- 		local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- 		require("lspconfig").html.setup({
			-- 			capabilities = capabilities,
			-- 			filetypes = { "html", "templ" },
			-- 		})
			-- 	end,
			--
			-- 	["htmx"] = function()
			-- 		local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- 		require("lspconfig").html.setup({
			-- 			capabilities = capabilities,
			-- 			filetypes = { "html", "templ" },
			-- 		})
			-- 	end,
			--
			-- 	["tailwindcss"] = function()
			-- 		local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- 		require("lspconfig").tailwindcss.setup({
			-- 			capabilities = capabilities,
			-- 			filetypes = { "templ", "astro", "javascript", "typescript", "react", "svelte" },
			-- 			settings = {
			-- 				tailwindCSS = {
			-- 					includeLanguages = { templ = "html" },
			-- 				},
			-- 			},
			-- 		})
			-- 	end,
			--
			["gopls"] = function()
				local capabilities = require("blink.cmp").get_lsp_capabilities(nil)
				require("lspconfig").gopls.setup({
					capabilities = capabilities,
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
			end,

			["rust_analyzer"] = function()
				local capabilities = require("blink.cmp").get_lsp_capabilities(nil)
				require("lspconfig").rust_analyzer.setup({
					capabilities = capabilities,
					settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								enable = true, -- Enable "check on save"
								command = "clippy", -- Use clippy instead of cargo check
							},
						},
					},
				})
			end,
		})
	end,
}
