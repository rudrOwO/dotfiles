local wezterm = require("wezterm")
local scrollback_in_vim_keybinds = require("scrollback_in_vim")
local pane_split_keybinds = require("pane_split")
local config = wezterm.config_builder()

local function appendTable(t1, t2)
	for _, value in ipairs(t2) do
		table.insert(t1, value)
	end
end

config.font = wezterm.font({ family = "Berkeley Mono" })
config.font_size = 15

config.color_scheme = "carbonfox"
config.colors = {
	-- background = "black",
	cursor_bg = "#52ad70",
}

-- keybinds
config.keys = {}
config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }
appendTable(config.keys, scrollback_in_vim_keybinds)
appendTable(config.keys, pane_split_keybinds)
appendTable(config.keys, {
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
})
appendTable(config.keys, {
	{
		key = "q",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
})

return config
