vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<cr>", { desc = "Go if err" })
vim.cmd([[autocmd FileType go setlocal iskeyword-=.]])
