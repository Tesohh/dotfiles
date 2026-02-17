local wezterm = require("wezterm")

local config = wezterm.config_builder()

local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
config.colors = theme.colors()
config.window_frame = theme.window_frame()

local session_lookup_dirs = {
	as_is = {},
	recursive = {},
}

if wezterm.target_triple == "aarch64-apple-darwin" then
	-- MACOS CONFIG
	config.font = wezterm.font({
		family = "Iosevka Extended",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	})
	config.front_end = "WebGpu"
	config.freetype_load_target = "Normal"
	config.freetype_load_flags = "NO_BITMAP|MONOCHROME|NO_AUTOHINT"
	config.window_decorations = "RESIZE"

	config.font_size = 16
	config.cell_width = 0.9
	config.line_height = 1.1

	session_lookup_dirs = {
		as_is = { "/Users/tesohh/dev", "/Users/tesohh/docs", "/Users/tesohh/dotfiles" },
		recursive = {
			"/Users/tesohh/dev",
			"/Users/tesohh/docs",
			"/Users/tesohh/dev/scratchpad",
			"/Users/tesohh/dotfiles",
			"/Users/tesohh/dotfiles/.config",
		},
	}
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	-- LINUX CONFIG
	local session_type = os.getenv("XDG_SESSION_TYPE")
	config.enable_wayland = (session_type == "wayland")

	config.font = wezterm.font({
		family = "Iosevka Extended",
		weight = 500,
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	})

	config.font_size = 18
	config.cell_width = 0.9
	config.line_height = 1.1

	config.window_decorations = "NONE"

	session_lookup_dirs = {
		as_is = { "/home/tesohh/dev", "/home/tesohh/docs", "/home/tesohh/dotfiles" },
		recursive = {
			"/home/tesohh/dev",
			"/home/tesohh/docs",
			"/home/tesohh/dev/scratchpad",
			"/home/tesohh/dotfiles",
			"/home/tesohh/dotfiles/.config",
		},
	}
end

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

config.allow_win32_input_mode = false
-- config.enable_kitty_keyboard = true
config.enable_csi_u_key_encoding = true

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

	for _, dir in pairs(session_lookup_dirs.as_is) do
		table.insert(entries, path_to_switcher_entry(dir))
	end

	for _, dir in pairs(session_lookup_dirs.recursive) do
		for _, path in pairs(get_directories(dir)) do
			table.insert(entries, path_to_switcher_entry(path))
		end
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
wezterm.on("smart_workspace_switcher.workspace_switcher.start", update_statusline_gui)
wezterm.on("smart_workspace_switcher.workspace_switcher.canceled", update_statusline_gui)
wezterm.on("smart_workspace_switcher.workspace_switcher.selected", update_statusline_gui)

config.default_workspace = "~"

local act = wezterm.action

config.keys = {
	{ key = "s", mods = "LEADER", action = workspace_switcher.switch_workspace() },
	{ key = "s", mods = "CMD", action = workspace_switcher.switch_workspace() },
	{ key = "d", mods = "CMD", action = workspace_switcher.switch_to_prev_workspace() },
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ mods = "CMD", key = "Backspace", action = act.SendKey({ mods = "CTRL", key = "u" }) },
	{ mods = "CTRL", key = "Backspace", action = act.SendKey({ mods = "CTRL", key = "u" }) },
	{ key = "p", mods = "CMD", action = act.ActivateCommandPalette },

	{ key = "LeftArrow", mods = "OPT", action = act.SendKey({ mods = "ALT", key = "b" }) },
	{ key = "LeftArrow", mods = "CTRL", action = act.SendKey({ mods = "ALT", key = "b" }) },
	{ key = "RightArrow", mods = "OPT", action = act.SendKey({ mods = "ALT", key = "f" }) },
	{ key = "RightArrow", mods = "CTRL", action = act.SendKey({ mods = "ALT", key = "f" }) },
	{ key = "Backspace", mods = "SHIFT", action = act.SendKey({ key = "Backspace" }) },
}

return config
