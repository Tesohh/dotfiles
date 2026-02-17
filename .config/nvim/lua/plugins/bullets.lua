return {
	"bullets-vim/bullets.vim",
	ft = { "markdown", "typst" },
	enabled = false,
	config = function()
		vim.g.bullets_enabled_file_types = {
			"markdown",
			"typst",
			"text",
			"gitcommit",
			"scratch",
		}
	end,
}
