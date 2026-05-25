local wezterm = require("wezterm")

local config = wezterm.config_builder()

front_end = "Software" -- only for mac VM's

config.font = wezterm.font("CaskaydiaMono Nerd Font Mono", { weight = "Bold" })

-- config.font = wezterm.font("Dossier Nerd Font", { weight = "Regular" })

config.font_size = 20.0

config.color_scheme = "Black Metal"

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.keys = {
        {
                key = "s",
                mods = "CMD|SHIFT",
                action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        },
        {
                key = "a",
                mods = "CMD|SHIFT",
                action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
        },
        {
                key = "w",
                mods = "CMD",
                action = wezterm.action.CloseCurrentPane({ confirm = true }),
        },
	{
                key = "w",
                mods = "CMD",
                action = wezterm.action.Multiple {
                    wezterm.action.SendString("tmux kill-session\r"),
                    wezterm.action.CloseCurrentPane { confirm = false },
                },
        },
        {
	    key = 'b',
	    mods = 'CMD|SHIFT',
	    action = wezterm.action.SendKey({ key = 'b', mods = 'CTRL' }),
  	}
}

config.use_fancy_tab_bar = false

config.colors = {
        background = "black",
        tab_bar = {
                background = "black",
                active_tab = {
                        bg_color = "#000000",
                        fg_color = "#c0c0c0",
                        intensity = "Normal",
                        underline = "None",
                        italic = false,
                        strikethrough = false,
                },
                inactive_tab = {
                        bg_color = "#000000",
                        fg_color = "#808080",
                },
                new_tab = {
                        bg_color = "#000000",
                        fg_color = "#808080",
                },
        },
}

config.tab_bar_at_bottom = true

config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"

wezterm.on("format-window-title", function()
        return ":3"
end)

return config
