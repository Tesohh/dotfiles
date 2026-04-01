vim.api.nvim_create_user_command("Backup", function(cmd)
	vim.fn.system("git add .")
	vim.fn.system("git commit -m 'backup: " .. os.date("%Y-%m-%d %H:%M:%S") .. "'")
	vim.fn.system("git push origin main")
end, {})

vim.api.nvim_create_user_command("BK", function(cmd)
	vim.cmd("Backup")
end, {})
