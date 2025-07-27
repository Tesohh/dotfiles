return {
	"theprimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("harpoon"):setup()
	end,
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():append()
				print("added to harpoon")
			end,
			desc = "add file to harpoon",
		},
		{
			"<leader>e",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "show harpoon ui",
		},
		{
			"<leader>h",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "harpoon file 1",
		},
		{
			"<leader>j",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "harpoon file 2",
		},
		{
			"<leader>k",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "harpoon file 3",
		},
		{
			"<leader>l",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "harpoon file 4",
		},
	},
}
