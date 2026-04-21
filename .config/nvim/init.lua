vim.g.mapleader = " "

require("plugins-pack")
require("plugins-setup")

require("scripts.gitc")
require("scripts.oil_snack_rename") -- TODO maybe not needed: check lsp_file_methods of oil
require("scripts.treesitter_setup")

require("opts")
require("keymaps")
