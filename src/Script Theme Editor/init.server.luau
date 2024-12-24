local Config = require(script.Config)
local ContentModule = require(script.Content)

assert(plugin, 'Must be run as an plugin!')
assert(Config, 'Missing Config File')

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
		ContentModule:Assign(dockWindow)
	end
	dockWindow.Enabled = not dockWindow.Enabled
end)
