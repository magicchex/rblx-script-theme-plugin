local Config = require(script.Config)
local EditorScreen = require(script.EditorScreen)

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
local function dockClose()
	toggleWindowButton:SetActive(false)
	dockWindow.Enabled = false
end
toggleWindowButton.Click:Connect(function()
	if not dockWindow then
		dockWindow = plugin:CreateDockWidgetPluginGui(Config.Window.windowId, Config.Window.windowInfo)
		dockWindow.Title = 'Script Theme Editor'
		dockWindow:BindToClose(dockClose)
		EditorScreen:Assign(dockWindow)
	end
	dockWindow.Enabled = not dockWindow.Enabled
end)
