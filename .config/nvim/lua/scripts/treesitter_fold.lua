vim.api.nvim_create_autocmd({ "FileType" }, {
	callback = function()
		-- check if treesitter has parser
		if require("nvim-treesitter.parsers").has_parser() then
			-- use treesitter folding
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		else
			-- use alternative foldmethod
			vim.opt.foldmethod = "syntax"
		end
	end,
})

-- -- disable folding on startup
-- vim.opt.foldenable = false
-- vim.opt.foldlevel = 20
