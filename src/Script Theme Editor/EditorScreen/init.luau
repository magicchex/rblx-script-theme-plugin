local StarterGui = game:GetService('StarterGui') -- Testing Purposes
local gui = require(script.gui)
local EditorScreen = {}

function EditorScreen:Assign(window: DockWidgetPluginGui)
	if not window:IsA('DockWidgetPluginGui') then
		warn(string.format('Invalid DockWidgetPluginGui. Got "%s"', window.ClassName))
		return
	end
	-- gui.background.Parent = StarterGui
	gui.background.Parent = window
	gui.tabWidth.Parent = gui.background
end

return EditorScreen
