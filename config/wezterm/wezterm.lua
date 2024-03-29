local wezterm = require "wezterm"

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback {
    -- "Hurmit Nerd Font",
    -- "AnonymicePro Nerd Font Mono",
    -- "JetBrainsMono Nerd Font",
    "Agave Nerd Font Mono",
    "D2Coding", -- Korean font
    "Cica", -- Japanese font
    "Symbols Nerd Font Mono",
}
config.font_size = 18 -- only Agave
-- config.font_size = 16
-- config.line_height = 0.95
config.color_scheme = 'Rosé Pine Dawn (Gogh)'

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.scrollback_lines = 100000

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

local act = wezterm.action
config.keys = {
    -- Opt+Shift+f
    -- Toggle screen
    {
        key = "f",
        mods = "SHIFT|META",
        action = wezterm.action.ToggleFullScreen,
    },
}

return config
