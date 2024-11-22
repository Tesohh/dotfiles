return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls",
			"gopls",
			"rust_analyzer",
			"html",
			"cssls",
			"templ",
			"htmx",
			"pyright",
			"jdtls",
			"clangd",
		},
	},
	config = function(_, opts)
		require("mason-lspconfig").setup(opts)
		require("mason-lspconfig").setup_handlers({
			function(server_name) -- default handler (optional)
				local capabilities = require("blink.cmp").get_lsp_capabilities()
				require("lspconfig")[server_name].setup({ capabilities = capabilities })
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
				require("lspconfig").gopls.setup({
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
			--
			-- 	-- Next, you can provide a dedicated handler for specific servers.
			-- 	-- For example, a handler override for the `rust_analyzer`:
			-- 	["rust_analyzer"] = function()
			-- 		local rt = require("rust-tools")
			-- 		rt.setup({
			-- 			server = {
			-- 				settings = {
			-- 					["rust_analyzer"] = {
			-- 						cargo = {
			-- 							allFeatures = true,
			-- 						},
			-- 					},
			-- 				},
			-- 				on_attach = function(_, bufnr)
			-- 					local o = { buffer = bufnr }
			-- 					vim.keymap.set("n", "K", rt.hover_actions.hover_actions, o)
			-- 					vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, o)
			-- 				end,
			-- 			},
			-- 		})
			-- 	end,
			-- })
		})
	end,
}
