return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    enable = false,
    opts = {
        disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
        restriction_mode = "hint",
    },
}
