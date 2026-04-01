return {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				enable = true, -- Enable "check on save"
				command = "clippy", -- Use clippy instead of cargo check
			},
		},
	},
}
