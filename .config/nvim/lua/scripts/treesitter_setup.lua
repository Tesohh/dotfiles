require("nvim-treesitter").install(require("lsp-tools").treesitter_parsers)

vim.api.nvim_create_autocmd("FileType", {
	pattern = require("lsp-tools").treesitter_parsers,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
