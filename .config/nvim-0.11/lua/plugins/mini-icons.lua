return {
	"echasnovski/mini.icons",
	config = function()
		require("mini.icons").setup()
		MiniIcons.tweak_lsp_kind()
		MiniIcons.mock_nvim_web_devicons()
	end,
}
