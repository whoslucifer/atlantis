local wezterm = require("wezterm")
local config = {
	["audible_bell"] = "Disabled",
	["cell_width"] = 0.900000,
	["color_scheme"] = "Charmful Dark",
	["color_schemes"] = {
		["Charmful Dark"] = {
			["ansi"] = { "#373839", "#e55f86", "#00D787", "#EBFF71", "#51a4e7", "#9077e7", "#51e6e6", "#e7e7e7" },
			["background"] = "#171717",
			["brights"] = { "#313234", "#d15577", "#43c383", "#d8e77b", "#4886c8", "#8861dd", "#43c3c3", "#b2b5b3" },
			["cursor_bg"] = "#b2b5b3",
			["cursor_border"] = "#b2b5b3",
			["cursor_fg"] = "#313234",
			["foreground"] = "#b2b5b3",
			["scrollbar_thumb"] = "#b2b5b3",
			["selection_bg"] = "#b2b5b3",
			["selection_fg"] = "#313234",
			["split"] = "#313234",
		},
	},
	["default_cursor_style"] = "BlinkingBar",
	["default_prog"] = { "/run/current-system/sw/bin/tmux" },
	["enable_wayland"] = true,
	["hide_tab_bar_if_only_one_tab"] = true,
	["inactive_pane_hsb"] = { ["brightness"] = 0.800000, ["saturation"] = 0.900000 },
	["max_fps"] = 120,
	["scroll_to_bottom_on_input"] = true,
	["text_background_opacity"] = 1.000000,
	["window_background_opacity"] = 0.700000,
	["window_close_confirmation"] = "NeverPrompt",
	["window_padding"] = { ["bottom"] = "0.4cell", ["left"] = "1cell", ["right"] = "1cell", ["top"] = "0cell" },
}
local wa = wezterm.action

wezterm.on("padding-off", function(window)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_padding then
		overrides.window_padding = {
			top = "0",
			right = "0",
			bottom = "0",
			left = "0",
		}
	else
		overrides.window_padding = nil
	end
	window:set_config_overrides(overrides)
end)

wezterm.on("toggle-opacity", function(window)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.7
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

config.keys = {
	{ key = "p", mods = "CTRL", action = wa.EmitEvent("padding-off") },
	{ key = "o", mods = "CTRL", action = wa.EmitEvent("toggle-opacity") },

	{ key = "Tab", mods = "CTRL", action = wezterm.action.SendKey({ key = "`", mods = "CTRL" }) },
}

config.font = wezterm.font("SpaceMono Nerd Font")

local themes = { ["Dark"] = "Charmful Dark" }

function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	return themes.Dark or ""
end

config.color_scheme = scheme_for_appearance(get_appearance())

return config
