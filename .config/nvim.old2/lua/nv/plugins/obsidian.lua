return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "bigvault",
                path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/bigvault",
            },
        },
    },
}
