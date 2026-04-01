vim.api.nvim_create_user_command("GitC", function(cmd)
	local msg = ""
	if cmd.args then
		msg = cmd.args
	else
		msg = vim.fn.input("commit message > ")
	end

	msg = msg:gsub(" ", "\\ ")

	vim.cmd([[Git add .]])
	vim.cmd([[Git commit -m ]] .. msg)
	vim.cmd([[Git push]])
end, { nargs = 1 })
