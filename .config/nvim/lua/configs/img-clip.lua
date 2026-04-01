require("img-clip").setup({
	typst = {
		template = [[
#figure(
  image("/$FILE_PATH", width: 80%),
  caption: [$CURSOR],
) <fig-$LABEL>
    ]],
		relative_template_path = false,
		copy_images = true,
	},
})

vim.keymap.set({ "n", "x" }, "<leader>pi", "<cmd>PasteImage<cr>", { desc = "Paste image from system clipboard" })
