vim.pack.add({
	"https://github.com/rose-pine/neovim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/rachartier/tiny-inline-diagnostic.nvim"
})

-- OPTS AND SENSIBLE DEFAULTS
require("mini.basics").setup({options = { extra_ui = true }, mappings = { windows = true }})
-- vim.opt.listchars =""
vim.opt.scrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- KEYMAPS
vim.keymap.set({ "n", "x", "o" }, "H", "^") -- go to the first char
vim.keymap.set({ "n", "x", "o" }, "L", "g_") -- go to the last char
vim.keymap.set({ "n", "x" }, "<C-w>|", "<cmd>vsplit<cr>", { desc = "split vertical" })
vim.keymap.set({ "n", "x" }, "<C-w>_", "<cmd>split<cr>", { desc = "split horizontal" })

-- ICONS
require("mini.icons").setup()
MiniIcons.tweak_lsp_kind()
MiniIcons.mock_nvim_web_devicons()

-- OIL
require("oil").setup({ view_options = { show_hidden = true } })
vim.keymap.set({"n", "x", "o"}, "-", "<cmd>Oil<cr>", {desc="Oil parent dir"})

-- CLUE
local miniclue = require('mini.clue')
miniclue.setup({
	triggers = {
		{ mode = { 'n', 'x' }, keys = '<Leader>' },
		{ mode = 'n', keys = '[' },
		{ mode = 'n', keys = ']' },
		{ mode = 'i', keys = '<C-x>' },
		{ mode = { 'n', 'x' }, keys = 'g' },
		{ mode = { 'n', 'x' }, keys = "'" },
		{ mode = { 'n', 'x' }, keys = '`' },
		{ mode = { 'n', 'x' }, keys = '"' },
		{ mode = { 'i', 'c' }, keys = '<C-r>' },
		{ mode = 'n', keys = '<C-w>' },
		{ mode = { 'n', 'x' }, keys = 'z' },
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.square_brackets(),
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
})

-- HIPATTERNS
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    fix   = { pattern = '%f[%w]()FIX()%f[%W]', group = 'MiniHipatternsFixme' },
    temp  = { pattern = '%f[%w]()TEMP()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    warn  = { pattern = '%f[%w]()WARN()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
    test  = { pattern = '%f[%w]()TEST()%f[%W]',  group = 'MiniHipatternsNote'  },
    perf  = { pattern = '%f[%w]()PERF()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) #FF33AA using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

-- Git
require("mini.git").setup()
require("mini.diff").setup()

-- OTHER MINI
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.bracketed").setup()
require("mini.statusline").setup()
require("mini.jump").setup()
require("mini.jump2d").setup()

-- SNACKS (Picker)
require("snacks").setup({
	indent = { enabled = true, animate = { enabled = false }, scope = { enabled = false } },
	bigfile = { enabled = true },
	image = {
		enabled = false,
		doc = { inline = false, float = false },
		math = { enabled = false },
	},
	input = { enabled = true },
	notifier = { enabled = false, style = "minimal", top_down = false },
	picker = { enabled = true, main = { file = false } },
})
-- stylua: ignore start
vim.keymap.set("n","<leader>f",function() Snacks.picker.files({exclude={"*.png","*.jpg","*.mp3","*.o"}}) end,{desc="Jump to file"})
vim.keymap.set("n","<leader>sw",function() Snacks.picker.grep() end,{desc="Search Words (grep)"})
vim.keymap.set("n","<leader>sf",function() Snacks.picker.files() end,{desc="Search Files"})
vim.keymap.set("n","<leader>ss",function() Snacks.picker.lsp_symbols() end,{desc="LSP Symbols"})
vim.keymap.set("n","<leader>S",function() Snacks.picker.lsp_workspace_symbols() end,{desc="LSP Workspace Symbols"})
vim.keymap.set("n","<leader>sd",function() Snacks.picker.diagnostics() end,{desc="Diagnostics"})
vim.keymap.set("n","<leader>j",function() Snacks.picker.lines() end,{desc="Jump to Buffer Lines"})
vim.keymap.set("n","gd",function() Snacks.picker.lsp_definitions() end,{desc="Goto Definition"})
vim.keymap.set("n","gD",function() Snacks.picker.lsp_declarations() end,{desc="Goto Declaration"})
vim.keymap.set("n","grr",function() Snacks.picker.lsp_references() end,{desc="References",nowait=true})
vim.keymap.set("n","gri",function() Snacks.picker.lsp_implementations() end,{desc="Goto Implementation"})
vim.keymap.set("n","grt",function() Snacks.picker.lsp_type_definitions() end,{desc="Goto Type Definition"})
-- stylua: ignore end

-- tiny-inline-diagnostic.nvim
require("tiny-inline-diagnostic").setup({
    options = {
        show_source = {
            enabled = true,           -- Enable showing source names
            if_many = true,           -- Only show source if multiple sources exist for the same diagnostic
        },
        multilines = {
            enabled = true,           -- Enable support for multiline diagnostic messages
            always_show = true,       -- Always show messages on all lines of multiline diagnostics
        },
    },
})
vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics

-- THEME
require("rose-pine").setup({
	disable_italics = true,
	highlight_groups = {
		Comment = { italic = true },
		Folded = { fg = "muted" },
		["@org.keyword.todo"] = { fg = "love" },
		["@org.keyword.done"] = { fg = "muted" },
		["@org.bold"] = { fg = "love" },
		["@org.bold.delimiter"] = { fg = "love" },
		["@org.italic"] = { fg = "iris", italic = true },
		["@org.italic.delimiter"] = { fg = "iris", italic = true },
		["@org.headline.level3"] = { fg = "rose" },
		["@markup.strong"] = { fg = "love", bold = true },
		["@markup.italic"] = { fg = "iris", italic = true },
		["@markup.raw.markdown_inline"] = { bg = "overlay", fg = "gold" },
		["@markup.heading.1"] = { fg = "rose", bold = true },
		["@markup.heading.2"] = { fg = "iris", bold = true },
		["@markup.heading.3"] = { fg = "foam", bold = true },
		["@markup.heading.4"] = { fg = "pine", bold = true },
		["@markup.heading.5"] = { fg = "gold", bold = true },
		-- ["@markup.raw.typst"] = { bg = "overlay", fg = "gold" },
	},
})

vim.cmd [[colorscheme rose-pine]]
