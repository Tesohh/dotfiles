return {
    "windwp/nvim-ts-autotag",
    config = function(opts)
        require("nvim-ts-autotag").setup({
            aliases = {
                ["templ"] = "html",
            },
        })
    end,
}
