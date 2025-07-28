require("opts")
require("keymaps")

vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/olexsmir/gopher.nvim" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/echasnovski/mini.icons" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/echasnovski/mini.extra" },
	{ src = "https://github.com/echasnovski/mini.diff" },
	{ src = "https://github.com/echasnovski/mini-git" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/shortcuts/no-neck-pain.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "nvim-treesitter/nvim-treesitter", branch = "main" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp", version = "v1.6.0" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/NeogitOrg/neogit" },
	{ src = "https://github.com/igorlfs/nvim-dap-view" },
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/mfussenegger/nvim-dap-python" },
	{ src = "https://github.com/leoluz/nvim-dap-go" },
})

require("config.rose-pine")
require("config.lualine")
require("config.no-neck-pain")
require("todo-comments").setup({ keywords = { TEMP = { icon = " ", color = "error", alt = { "DELETEME" } } } })
require("nvim-autopairs").setup({})
require("ibl").setup({ scope = { enabled = false } })
require("mini.icons").setup()
MiniIcons.tweak_lsp_kind()
require("mini.extra").setup()
require("mini.diff").setup()
require("mini.git").setup()
require("mini.pick").setup({ window = { config = { width = 80, height = 20 } } })
vim.ui.select = MiniPick.ui_select
require("fidget").setup()
require("oil").setup({ view_options = { show_hidden = true } })
require("neogit").setup()

require("config.treesitter")
require("config.lsp-tools")
require("config.blink")
require("config.conform")
require("config.dap")

require("niceties.gitc")
require("niceties.highlightyank")
