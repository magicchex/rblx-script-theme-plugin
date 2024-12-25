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

Config.EditorScreen = {
	Colors = {
		primary = Color3.fromHex('1C2321'),
		secondary = Color3.fromHex('5E6572'),
		highlight = Color3.fromHex('A9B4C2'),
		important = Color3.fromHex('FFEE93'),
	},
	Images = {
		toggleEnabled = 'rbxasset://textures/CollisionGroupsEditor/checked-bluebg.png',
		toggleDown = 'rbxasset://textures/CollisionGroupsEditor/checked-whitebg.png',
		toggleDisabled = 'rbxasset://textures/CollisionGroupsEditor/unchecked.png',
	},
	OptionUIOverride = {
		textInput = function(textBox: TextBox)
			return
		end,
		numberInput = function(textBox: TextBox)
			return
		end,
		toggleInput = function(imageButton: ImageButton)
			return
		end,
		toolTip = function(textBox: TextBox)
			return
		end,
	},
	defaultSize = UDim2.new(1, 0, 0.02, 0),
}
return Config
