return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	opts = {
		filetypes = {
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
		},
	},
	keys = {
		{ "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
}
