local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = { "lua" },
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true, disable = { "html" } },
})
