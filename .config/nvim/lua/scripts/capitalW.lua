vim.api.nvim_create_user_command("W", function(cmd)
	vim.cmd("write")
end, { nargs = 0 })
