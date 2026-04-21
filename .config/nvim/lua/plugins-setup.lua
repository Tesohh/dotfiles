require("oil").setup({ view_options = { show_hidden = true } })
require("oil-git").setup()
require("oil-lsp-diagnostics").setup()
require("configs.snacks")
require("configs.tiny-inline-diagnostic")
require("configs.rose-pine")
require("configs.ufo")

-- LSP
require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = require("lsp-tools").lsp_list })
require("mason-tool-installer").setup({ ensure_installed = require("lsp-tools").tool_list })
require("lsp-adhoc")
require("configs.blink")
require("configs.conform")

-- mini
require("configs.icons")
require("configs.clue")
require("configs.hipatterns")
require("mini.basics").setup({ options = { extra_ui = true }, mappings = { windows = true } })
require("mini.git").setup()
require("mini.diff").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.bracketed").setup()
require("mini.statusline").setup()
require("mini.jump").setup()
require("mini.jump2d").setup({ view = { dim = true } })
require("mini.notify").setup()
-- require("mini.snippets").setup()

-- typst
require("configs.typst-preview")
require("configs.img-clip")

-- other
require("configs.noneckpain")
