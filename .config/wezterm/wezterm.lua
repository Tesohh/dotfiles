local wezterm = require("wezterm")

local config = wezterm.config_builder()

local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
config.colors = theme.colors()
config.window_frame = theme.window_frame()

config.window_decorations = "RESIZE|MACOS_FORCE_SQUARE_CORNERS"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.native_macos_fullscreen_mode = false
config.macos_fullscreen_extend_behind_notch = true
config.term = "wezterm"

config.font = wezterm.font({
	family = "Iosevka Extended",
	-- family = "Fira Mono",
	-- family = "Source Code Pro",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

config.front_end = "WebGpu"
config.freetype_load_target = "Normal"
config.freetype_load_flags = "NO_BITMAP|MONOCHROME|NO_AUTOHINT"
config.font_size = 16
config.cell_width = 0.9
config.line_height = 1.1

config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 2000 }

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
workspace_switcher.apply_to_config(config)

local function get_directories(path)
	local cmd = 'find "' .. path .. '" -maxdepth 1 -type d' -- Linux/macOS command
	local _, stdout = wezterm.run_child_process({ "/bin/sh", "-c", cmd }) -- Run command
	local directories = {}

	for dir in stdout:gmatch("[^\r\n]+") do
		if dir ~= path then
			table.insert(directories, dir)
		end
	end

	return directories
end

local function replace_home_path(path)
	local home = wezterm.home_dir
	return string.gsub(path, home, "~")
end

local function path_to_switcher_entry(path)
	return {
		id = path,
		label = replace_home_path(path),
	}
end

workspace_switcher.get_choices = function(_)
	local entries = workspace_switcher.choices.get_workspace_elements({})
	table.insert(entries, path_to_switcher_entry("/Users/tesohh/Developer"))
	table.insert(entries, path_to_switcher_entry("/Users/tesohh/dotfiles"))

	for _, path in pairs(get_directories("/Users/tesohh/Developer")) do
		table.insert(entries, path_to_switcher_entry(path))
	end
	for _, path in pairs(get_directories("/Users/tesohh/Developer/scratchpad")) do
		table.insert(entries, path_to_switcher_entry(path))
	end
	for _, path in pairs(get_directories("/Users/tesohh/dotfiles")) do
		table.insert(entries, path_to_switcher_entry(path))
	end
	for _, path in pairs(get_directories("/Users/tesohh/dotfiles/.config")) do
		table.insert(entries, path_to_switcher_entry(path))
	end
	for _, path in pairs(get_directories("/Users/tesohh/Nextcloud/")) do
		table.insert(entries, path_to_switcher_entry(path))
	end

	return entries
end

local function base_name(str)
	return string.gsub(str, "(.*[/\\])(.*)", "%2")
end

local update_statusline_mux = function(window, workspace)
	local gui_win = window:gui_window()
	local base_path = base_name(workspace)
	gui_win:set_left_status(wezterm.format({
		{ Foreground = { Color = "gray" } },
		{ Text = base_path .. "  " },
	}))
end

local update_statusline_gui = function(window, pane, previous_workspace)
	local base_path = base_name(window:active_workspace())
	window:set_left_status(wezterm.format({
		{ Foreground = { Color = "gray" } },
		{ Text = base_path .. "  " },
	}))
end

wezterm.on("smart_workspace_switcher.workspace_switcher.chosen", update_statusline_mux)
wezterm.on("smart_workspace_switcher.workspace_switcher.created", update_statusline_mux)
wezterm.on("smart_workspace_switcher.workspace_switcher.switched_to_prev", update_statusline_gui)

config.default_workspace = "~"

local act = wezterm.action

config.keys = {
	{ key = "s", mods = "LEADER", action = workspace_switcher.switch_workspace() },
	{ key = "s", mods = "CMD", action = workspace_switcher.switch_workspace() },
	{ key = "d", mods = "CMD", action = workspace_switcher.switch_to_prev_workspace() },
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ mods = "CMD", key = "Backspace", action = act.SendKey({ mods = "CTRL", key = "u" }) },
	{ key = "p", mods = "CMD", action = act.ActivateCommandPalette },

	{ key = "LeftArrow", mods = "OPT", action = act({ SendString = "\x1bb" }) },
	{ key = "RightArrow", mods = "OPT", action = act({ SendString = "\x1bf" }) },
}

return config
