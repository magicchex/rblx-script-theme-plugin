local Config = {}
local _shared = {
	author = 'Not_Chex',
	title = 'Script Theme Editor',
}

Config.Toolbar = {
	name = _shared.title,
	buttons = {
		toggleWindowButton = {
			id = 'Not_Chex.ScriptThemeEditor.ToggleWindow',
			tooltip = 'Opens an window',
			image = 'rbxasset://textures/MenuBar/icon_menu.png',
			label = 'Toggle Window',
		},
	},
}

Config.Window = {
	windowId = string.format('%s.%s', _shared.author, _shared.title),
	windowInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, true, 480, 360, 2, 2),
}
return Config
