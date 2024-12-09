function Oily_filename()
	local fname = vim.fn.expand("%:.")
	if vim.bo.filetype == "oil" then
		return fname
	elseif vim.bo.buftype == "nofile" then
		return ""
	else
		return fname -- Use the current file's name (relative to cwd)
	end
end

vim.opt.statusline = "%{v:lua.Oily_filename()}"
