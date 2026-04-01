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
