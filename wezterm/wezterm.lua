-- Initialize Configuration
-- https://github.com/scottmckendry/Windots/blob/main/wezterm/wezterm.lua
local wezterm = require("wezterm")

local config_dir = wezterm.home_dir .. "\\wezterm\\"
package.path = package.path .. ";" .. config_dir .. "?.lua"
local config = wezterm.config_builder()

local opacity = 0.85
local transparent_bg = "rgba(22, 24, 26, " .. opacity .. ")"

--- Get the current operating system
--- @return "windows"| "linux" | "macos"
local function get_os()
	local bin_format = package.cpath:match("%p[\\|/]?%p(%a+)")
	if bin_format == "dll" then
		return "windows"
	elseif bin_format == "so" then
		return "linux"
	end

	return "macos"
end

local host_os = get_os()

-- Font Configuration
local emoji_font = "Segoe UI Emoji"
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrainsMono Nerd Font",
		weight = "Regular",
	},
	emoji_font,
})
config.font_size = 14
config.line_height = 1.4

-- Color Configuration
-- config.colors = require("cyberdream")
config.force_reverse_video_cursor = true

-- Window Configuration
config.initial_rows = 24
config.initial_cols = 120
config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = opacity
config.window_background_image = (os.getenv("WEZTERM_CONFIG_FILE") or ""):gsub("wezterm.lua", "bg-blurred.png")
config.window_close_confirmation = "NeverPrompt"
config.win32_system_backdrop = "Acrylic"

-- Performance Settings
config.max_fps = 144
config.animation_fps = 60
config.cursor_blink_rate = 700

config.enable_tab_bar = false

local act = wezterm.action

config.keys = {
	{ key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = false }),},
	{ key = '_', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
	{ key = '|', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },
}

-- Default Shell Configuration
-- config.default_prog = { "pwsh", "-NoLogo" }
config.default_prog = { 'wsl.exe', '--distribution', 'Ubuntu', '--exec', '/bin/bash', '-l' }

config.default_domain = "WSL:Ubuntu"
config.wsl_domains = { { name = "WSL:Ubuntu", distribution = "Ubuntu", default_cwd = "~" } }

-- OS-Specific Overrides
if host_os == "linux" then
	emoji_font = "Noto Color Emoji"
	config.default_prog = { "zsh" }
	config.front_end = "WebGpu"
	config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/bg-blurred.png"
	config.window_decorations = nil -- use system decorations
end

return config
