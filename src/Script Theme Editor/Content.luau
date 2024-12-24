local Content = {}

function Content:Assign(window: DockWidgetPluginGui)
	if not window:IsA('DockWidgetPluginGui') then
		warn(string.format('Invalid DockWidgetPluginGui. Got "%s"', window.ClassName))
		return
	end
	local editorBackground = Instance.new('Frame')
	editorBackground.Size = UDim2.new(1, 0, 1, 0)
	editorBackground.AnchorPoint = Vector2.new(0, 0)
	editorBackground.Position = UDim2.new(0, 0, 0, 0)
	editorBackground.BackgroundColor3 = Color3.new(1, 0, 0)
	editorBackground.BorderSizePixel = 0
	editorBackground.Visible = true
	editorBackground.Parent = window
end

return Content
