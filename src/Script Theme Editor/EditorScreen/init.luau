local StarterGui = game:GetService('StarterGui') -- Testing Purposes
local gui = require(script.Gui)
local EditorScreen = {}

function EditorScreen:Assign(window: DockWidgetPluginGui)
	if not window:IsA('DockWidgetPluginGui') then
		warn(string.format('Invalid DockWidgetPluginGui. Got "%s"', window.ClassName))
		return
	end
	local uiListLayout = Instance.new('UIListLayout')
	uiListLayout.FillDirection = Enum.FillDirection.Vertical
	uiListLayout.Padding = UDim.new(0, 0)
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.Wraps = false
	uiListLayout.Parent = gui.Background

	-- gui.Background.Parent = StarterGui
	gui.Background.Parent = window
	for _, childGui in pairs(gui) do
		if childGui == gui.Background then
			continue
		end
		childGui.Parent = gui.Background
	end
end

return EditorScreen
