local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
    {
        "nvimtools/none-ls.nvim",
        commit = "bb680d7",
        config = function()
            local null_ls = require("null-ls")

            local sources = {
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.rustfmt,
                -- null_ls.builtins.formatting.gdformat,
            }

            null_ls.setup({
                sources = sources,
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format()
                            end,
                        })
                    end
                end,
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        opts = {
            handlers = {},
            ensure_installed = require("nv.masonlist").formatters_linters,
        },
    },
}
