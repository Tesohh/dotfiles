-- # OPTIONS
-- text && indentation
vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.winborder = "rounded"
vim.wo.wrap = false

-- -- folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- movement
vim.opt.scrolloff = 8

-- UI
vim.opt.showmode = false
vim.opt.signcolumn = "yes:1"
vim.opt.cmdheight = 1
vim.opt.pumheight = 10
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = "eob: ,vert: "
