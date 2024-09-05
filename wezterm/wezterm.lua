local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- styling
config.color_scheme = "rose-pine"
config.font_size = 16.0
config.font = wezterm.font("Iosevka")
config.enable_tab_bar = true
-- config.window_background_opacity = 0.85

-- tab bar
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"

-- keybinds
local act = wezterm.action
config.keys = {
	{
		key = "n",
		mods = "CTRL|SHIFT",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "CTRL|SHIFT",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "t",
		mods = "SHIFT|CTRL",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "w",
		mods = "SHIFT|CTRL",
		action = act.CloseCurrentTab({
			confirm = true,
		}),
	},
}

return config
