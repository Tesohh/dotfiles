return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "lua" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true, disable = { "html" } },
			textobjects = {
				select = {
					enable = true,
					keymaps = {
						["aw"] = nil, -- disable Treesitter override
						["iw"] = nil, -- disable Treesitter override
					},
				},
			},
			-- autotag = { enable = true },
		})
	end,
	event = "BufRead",
}
