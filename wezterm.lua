-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.automatically_reload_config = true
config.use_ime = true
config.window_background_opacity = 0.8
config.win32_system_backdrop = "Acrylic"
config.default_prog = { "powershell.exe" }

-- Add user fonts directory
config.font_dirs = { "C:\\Users\\kiran\\AppData\\Local\\Microsoft\\Windows\\Fonts" }

config.font_size = 13.0
config.color_scheme = "Ayu Dark (Gogh)"

-- 黒→ピンクの斜めグラデーション背景
config.background = {
	{
		source = {
			Gradient = {
				colors = { "#0a0a0a80", "#2a1a2590", "#552a45aa" },
				orientation = { Linear = { angle = -45.0 } },
			},
		},
		width = "100%",
		height = "100%",
	},
}

-- タブが1つのときはタブバー非表示
config.hide_tab_bar_if_only_one_tab = true

-- ペイン分割線の色（控えめなグレー）
config.colors = {
	split = "#414868",
}

-- 非アクティブペインを少し暗く
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.6,
}

config.keys = {
	-- タブ操作 (Alt)
	{ key = "t", mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "p", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
	{ key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
	{ key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
	{ key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
	{ key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },

	{
		key = "N",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnWindow,
	},
	{ key = "q", mods = "ALT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	{
		key = "w",
		mods = "ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "~",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Paneサイズ変更 (Shift+Alt+Arrow)
	{
		key = "LeftArrow",
		mods = "SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "RightArrow",
		mods = "SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "UpArrow",
		mods = "SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "DownArrow",
		mods = "SHIFT|ALT",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
}
-- and finally, return the configuration to wezterm
return config
