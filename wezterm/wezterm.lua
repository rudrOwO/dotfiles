local wezterm = require("wezterm")
local scrollback_in_vim_keybinds = require("scrollback_in_vim")
local pane_split_keybinds = require("pane_split")

local function appendTable(t1, t2)
	for _, value in ipairs(t2) do
		table.insert(t1, value)
	end
end

local config = wezterm.config_builder()

config.color_scheme = "carbonfox"
config.font = wezterm.font({ family = "Berkeley Mono" })
config.font_size = 14

-- keybinds
config.keys = {}
config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }
appendTable(config.keys, scrollback_in_vim_keybinds)
appendTable(config.keys, pane_split_keybinds)

return config
