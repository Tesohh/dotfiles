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
vim.pack.add { { src = "https://github.com/rose-pine/neovim", name = "rose-pine" } }
require "rose-pine".setup({ disable_italics = true, highlight_groups = { Comment = { italic = true } } })
vim.cmd [[colorscheme rose-pine]]

-- autopairs
vim.pack.add { "https://github.com/windwp/nvim-autopairs" }
require("nvim-autopairs").setup {}

-- mini.icons
vim.pack.add { "https://github.com/echasnovski/mini.icons" }
require('mini.icons').setup()
MiniIcons.tweak_lsp_kind()

-- mini.extras
vim.pack.add { "https://github.com/echasnovski/mini.extra" }
require('mini.extra').setup()

-- mini.diff
vim.pack.add { "https://github.com/echasnovski/mini.diff" }
require('mini.diff').setup()

-- mini.git
vim.pack.add { "https://github.com/echasnovski/mini-git" }
require('mini.git').setup()
vim.keymap.set({ "n", "x" }, "<leader>gs", MiniGit.show_at_cursor)

-- mini.notify
vim.pack.add { "https://github.com/echasnovski/mini.notify" }
require('mini.notify').setup()

-- mini.pick
vim.pack.add { "https://github.com/echasnovski/mini.pick" }
require('mini.pick').setup { window = { config = { width = 80, height = 20, } } }
vim.keymap.set({ "n", "x" }, "<leader>f", MiniPick.builtin.files)
vim.keymap.set({ "n", "x" }, "<leader>sw", MiniPick.builtin.grep_live)
vim.keymap.set({ "n", "x" }, "<leader>ss", function() MiniExtra.pickers.lsp({ scope = "document_symbol" }) end)
vim.keymap.set({ "n", "x" }, "<leader>S", function() MiniExtra.pickers.lsp({ scope = "workspace_symbol" }) end)

-- oil
vim.pack.add { "https://github.com/stevearc/oil.nvim" }
require("oil").setup { view_options = { show_hidden = true } }
vim.keymap.set("n", "-", "<CMD>Oil<CR>") -- open oil / go to parent dir

-- treesitter
require("treesitter_config")

-- lsp
vim.pack.add { "https://github.com/neovim/nvim-lspconfig" }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.diagnostic.config({
    float = {
        border = "rounded",
    },
})
vim.lsp.enable({ "lua_ls" })

-- blink
vim.pack.add { { src = "https://github.com/saghen/blink.cmp", version = vim.version.range('1.0') } }
require("blink.cmp").setup {
    enabled = function()
        return not vim.list_contains({ "DressingInput" }, vim.bo.filetype)
            and vim.bo.buftype ~= "prompt"
            and vim.b.completion ~= false
    end,
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = { preset = "enter" },

    appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, via `opts_extend`
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },

    completion = {
        -- experimental auto-brackets support
        accept = { auto_brackets = { enabled = false } },

        -- experimental signature help support
        trigger = {},
    },

    signature = { enabled = true },
}

-- niceties
require("gitc")
require("highlightyank")
require("ignore_ra_errors")

-- # KEYMAPS
-- generic keymaps
vim.keymap.set({ "n", "x", "o" }, "H", "^")                      -- go to the first char
vim.keymap.set({ "n", "x", "o" }, "L", "g_")                     -- go to the last char
vim.keymap.set({ "n", "x", "o" }, "<leader><leader>", "<C-S-6>") -- alternate file
