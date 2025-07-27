-- # OPTIONS
-- text && indentation
vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.wo.wrap = false

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- movement
vim.opt.scrolloff = 8

-- UI
vim.opt.showmode = false
vim.opt.signcolumn = "yes:1"
vim.opt.cmdheight = 0
vim.opt.pumheight = 10
vim.opt.cursorline = true
vim.opt.number = true

vim.opt.clipboard = "unnamedplus"

-- # PLUGINS
-- Rose pine
vim.pack.add {"https://github.com/rose-pine/neovim"}
require "rose-pine".setup({disable_italics=true, highlight_groups = {Comment={italic=true}}})
vim.cmd [[colorscheme rose-pine]]

-- autopairs
vim.pack.add {"https://github.com/windwp/nvim-autopairs"}
require("nvim-autopairs").setup {}

-- mini.icons
vim.pack.add {"https://github.com/echasnovski/mini.icons"}
require('mini.icons').setup()
MiniIcons.tweak_lsp_kind()

-- mini.extras
vim.pack.add {"https://github.com/echasnovski/mini.extra"}
require('mini.extra').setup()

-- mini.diff
vim.pack.add {"https://github.com/echasnovski/mini.diff"}
require('mini.diff').setup()

-- mini.git
vim.pack.add {"https://github.com/echasnovski/mini-git"}
require('mini.git').setup()
vim.keymap.set({"n","x"}, "<leader>gs", MiniGit.show_at_cursor)

-- mini.notify
vim.pack.add {"https://github.com/echasnovski/mini.notify"}
require('mini.notify').setup()

-- mini.pick
vim.pack.add {"https://github.com/echasnovski/mini.pick"}
require('mini.pick').setup { window = { config = { width = 40, height = 20, } } }
vim.keymap.set({"n","x"}, "<leader>f", MiniPick.builtin.files)

-- oil
vim.pack.add {"https://github.com/stevearc/oil.nvim"}
require("oil").setup{ view_options = { show_hidden = true } }
vim.keymap.set("n", "-", "<CMD>Oil<CR>") -- open oil / go to parent dir

-- treesitter
require("treesitter_config")

-- niceties
require("gitc")
require("highlightyank")
require("ignore_ra_errors")

-- # KEYMAPS
-- generic keymaps
vim.keymap.set({ "n", "x", "o" }, "H", "^") -- go to the first char
vim.keymap.set({ "n", "x", "o" }, "L", "g_") -- go to the last char
vim.keymap.set({ "n", "x", "o" }, "<leader><leader>", "<C-S-6>") -- alternate file
