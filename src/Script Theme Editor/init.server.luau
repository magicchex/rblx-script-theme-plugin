local Config = require(script.Config)
local EditorScreen = require(script.EditorScreen)
local ColorPicker = require(script.ColorPicker)

assert(plugin, 'Must be run as an plugin!')
assert(Config, 'Missing Config File')
assert(EditorScreen, 'Missing Editor Gui')

local toolbar = plugin:CreateToolbar(Config.Toolbar.name)
local toggleWindowButton = toolbar:CreateButton(
	Config.Toolbar.buttons.toggleWindowButton.id,
	Config.Toolbar.buttons.toggleWindowButton.tooltip,
	Config.Toolbar.buttons.toggleWindowButton.image,
	Config.Toolbar.buttons.toggleWindowButton.label
)
toggleWindowButton.ClickableWhenViewportHidden = true
local dockWindow = nil
local colorPickerWindow = nil
local function dockClose()
	toggleWindowButton:SetActive(false)
	dockWindow.Enabled = false
	colorPickerWindow.Enabled = false
end
toggleWindowButton.Click:Connect(function()
	if not dockWindow then
		dockWindow = plugin:CreateDockWidgetPluginGui(Config.Window.windowId, Config.Window.windowInfo)
		dockWindow.Title = 'Script Theme Editor'
		dockWindow:BindToClose(dockClose)
		local editorScreen = EditorScreen:Assign(dockWindow)
	end
	if not colorPickerWindow then
		colorPickerWindow =
			plugin:CreateDockWidgetPluginGui(Config.Window.colorPickerWindow, Config.Window.colorPickerWindowInfo)
		colorPickerWindow.Title = 'Color Picker'
		colorPickerWindow:BindToClose(dockClose)
		local colorPickerScreen = ColorPicker:Assign(colorPickerWindow)
		colorPickerWindow.Enabled = true
	end
	dockWindow.Enabled = not dockWindow.Enabled
end)
