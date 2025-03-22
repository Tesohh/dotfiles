function Statusline_Oily_filename()
	local fname = vim.fn.expand("%:.") -- Get the current file's name (relative to cwd)

	-- Check for Oil filetype
	if vim.bo.filetype == "oil" then
		-- Add custom icon for Oil
		local oil_icon = " " -- File explorer icon
		return oil_icon .. " " .. fname
	elseif vim.bo.buftype == "nofile" then
		return ""
	else
		-- Load nvim-web-devicons and fetch the icon
		local devicons = require("nvim-web-devicons")
		local extension = vim.fn.fnamemodify(fname, ":e") -- Get file extension
		local icon = devicons.get_icon(fname, extension, { default = true }) -- Use default if no icon is found

		-- If no icon is found, return only the filename
		if icon then
			return icon .. " " .. fname
		else
			return fname
		end
	end
end

function Statusline_get_git_branch()
	if vim.bo.filetype ~= "no-neck-pain" then
		local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
		if handle then
			local branch = handle:read("*a"):gsub("\n", "")
			handle:close()
			return branch ~= "" and "  " .. branch or ""
		else
			return ""
		end
	else
		return ""
	end
end

-- vim.opt.statusline = "%{v:lua.Statusline_Oily_filename()} %m %{v:lua.Statusline_get_git_branch()}"
