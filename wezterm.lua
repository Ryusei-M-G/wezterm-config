-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.automatically_reload_config = true
config.use_ime = true
config.window_background_opacity = 0.85
-- config.win32_system_backdrop = "Acrylic"
config.default_prog = { "powershell.exe" }

-- Add user fonts directory
config.font_dirs = { "C:\\Users\\kiran\\AppData\\Local\\Microsoft\\Windows\\Fonts" }

config.font = wezterm.font("FantasqueSansM Nerd Font Mono")
config.font_size = 15.0
config.color_scheme = "rose-pine"

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
	{
		key = "N",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnWindow,
	},
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
