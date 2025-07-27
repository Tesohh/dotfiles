vim.api.nvim_create_user_command("GitC", function(cmd)
	local msg = ""
	if cmd.args then
		msg = cmd.args
	else
		msg = vim.fn.input("commit message > ")
	end

	vim.cmd('!git add .; git commit -m "' .. msg .. '"; git push')
end, { nargs = 1 })
