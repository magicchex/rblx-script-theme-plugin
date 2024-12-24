local Content = {}

function Content:Assign(window: DockWidgetPluginGui)
	local ScreenOne = Instance.new('ScreenGui')
	local ScreenOne_Frame = Instance.new('Frame')
	ScreenOne_Frame.Parent = ScreenOne
	ScreenOne_Frame.BackgroundColor3 = Color3.new(1, 1, 1)
	ScreenOne_Frame.Size = UDim2.new(1, 0, 1, 0)
	ScreenOne_Frame.Position = UDim2.new(0, 0, 0, 0)
	ScreenOne_Frame.BorderSizePixel = 0

	ScreenOne.Parent = window
	ScreenOne.Enabled = true
end

return Content
