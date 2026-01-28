-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- 設定ディレクトリをモジュールパスに追加
package.path = package.path .. ";" .. wezterm.config_dir .. "/?.lua"
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

-- Leader キー設定 (Ctrl+q)
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

-- キーマップを別ファイルから読み込み
local keymaps = require("keymaps")
config.keys = keymaps.keys
config.key_tables = keymaps.key_tables
-- and finally, return the configuration to wezterm
return config
