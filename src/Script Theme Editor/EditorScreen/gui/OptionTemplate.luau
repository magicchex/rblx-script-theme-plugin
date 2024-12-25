local Config = require(script.Parent.Parent.Parent.Config).EditorScreen
local OptionTemplate = {}
local function createTemplateWithoutOptions(labelText: string?)
	local container = Instance.new('Frame')
	container.BackgroundColor3 = Config.Colors.primary
	container.BorderSizePixel = 0
	container.Size = Config.defaultSize
	container.Visible = true

	local uiListLayout = Instance.new('UIListLayout')
	uiListLayout.FillDirection = Enum.FillDirection.Horizontal
	uiListLayout.Padding = UDim.new(0, 0)
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.Wraps = false

	local label = Instance.new('TextLabel')
	label.LayoutOrder = 0
	label.TextTruncate = Enum.TextTruncate.AtEnd
	label.BorderSizePixel = 0
	label.BackgroundTransparency = 0
	label.BackgroundColor3 = Config.Colors.secondary
	label.TextColor3 = Config.Colors.primary
	label.TextTransparency = 0
	label.TextStrokeTransparency = 1
	label.TextXAlignment = Enum.TextXAlignment.Center
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.TextScaled = true
	if type(labelText) ~= 'string' then
		labelText = 'Unnamed Label'
	end
	label.Text = labelText
	label.Size = UDim2.new(0.5, 0, 1, 0)
	label.Visible = true

	uiListLayout.Parent = container
	label.Parent = container
	return container
end

local function insertToolTip(guiObject: GuiObject, toolTipText: string?)
	--tooltip not showing
	local toolTip = Instance.new('TextBox')
	toolTip.Size = UDim2.fromScale(0.08, 0.08)
	toolTip.AnchorPoint = Vector2.zero
	toolTip.TextScaled = true
	toolTip.TextEditable = false
	toolTip.BackgroundColor3 = Config.Colors.highlight
	toolTip.TextColor3 = Config.Colors.primary
	toolTip.TextStrokeTransparency = 1
	if type(toolTipText) ~= 'string' then
		toolTipText = 'Placeholder Text'
	end
	toolTip.Text = toolTipText
	toolTip.Parent = guiObject
	toolTip.Visible = false
	toolTip.TextWrapped = true
	pcall(Config.OptionUIOverride.toolTip, toolTip)
	guiObject.MouseMoved:Connect(function(mx, my)
		toolTip.Visible = true
		toolTip.Position = UDim2.fromOffset(mx, my)
	end)
	guiObject.MouseLeave:Connect(function(_, __)
		toolTip.Visible = false
	end)
	return toolTip
end

function OptionTemplate.newTextInput(
	labelText: string?,
	uiOverrideFunc: (TextBox, TextBox) -> (),
	focusLostEvent: (TextBox) -> ()
)
	local container = createTemplateWithoutOptions(labelText)

	local input = Instance.new('TextBox')
	input.LayoutOrder = 1
	input.TextTruncate = Enum.TextTruncate.AtEnd
	input.BorderSizePixel = 0
	input.BackgroundTransparency = 0
	input.BackgroundColor3 = Config.Colors.secondary
	input.TextColor3 = Config.Colors.primary
	input.TextTransparency = 0
	input.TextStrokeTransparency = 1
	input.PlaceholderText = 'Type an number...'
	input.ClearTextOnFocus = false
	input.TextEditable = true
	input.TextXAlignment = Enum.TextXAlignment.Center
	input.TextYAlignment = Enum.TextYAlignment.Center
	input.TextScaled = true
	input.Text = ''
	input.PlaceholderText = ''
	input.Size = UDim2.new(0.5, 0, 1, 0)
	input.Visible = true
	input.Parent = container
	pcall(Config.OptionUIOverride.textInput, input)
	local toolTip = insertToolTip(input)
	pcall(uiOverrideFunc, input, toolTip)

	input.FocusLost:Connect(function(_, __)
		pcall(focusLostEvent, input)
	end)
	return container
end
function OptionTemplate.newNumberInput(
	labelText: string?,
	uiOverrideFunc: (TextBox, TextBox) -> (),
	focusLostEvent: (TextBox, boolean, number?) -> ()
)
	local container = createTemplateWithoutOptions(labelText)
	local input = Instance.new('TextBox')
	input.LayoutOrder = 1
	input.TextTruncate = Enum.TextTruncate.AtEnd
	input.BorderSizePixel = 0
	input.BackgroundTransparency = 0
	input.BackgroundColor3 = Config.Colors.secondary
	input.TextColor3 = Config.Colors.primary
	input.TextTransparency = 0
	input.TextStrokeTransparency = 1
	input.PlaceholderText = 'Type an number...'
	input.ClearTextOnFocus = false
	input.TextEditable = true
	input.TextXAlignment = Enum.TextXAlignment.Center
	input.TextYAlignment = Enum.TextYAlignment.Center
	input.TextScaled = true
	input.Text = 0
	input.Size = UDim2.new(0.5, 0, 1, 0)
	input.Visible = true
	input.Parent = container
	pcall(Config.OptionUIOverride.numberInput, input)
	local toolTip = insertToolTip(input)
	pcall(uiOverrideFunc, input, toolTip)

	input.FocusLost:Connect(function(_, __)
		local success, result = pcall(tonumber, input.Text)
		pcall(focusLostEvent, input, success, result)
	end)
	return container
end
function OptionTemplate.newToggleInput(
	labelText: string?,
	uiOverrideFunc: (ImageButton, TextBox) -> (),
	clickEvent: (ImageButton, boolean, string, string, string) -> ()
)
	local container = createTemplateWithoutOptions(labelText)
	local input = Instance.new('ImageButton')
	input:SetAttribute('toggle', false)
	-- local disabledImage = Content.fromUri(Config.Images.toggleDisabled)
	-- local heldDownImage = Content.fromUri(Config.Images.toggleDown)
	-- local enabledImage = Content.fromUri(Config.Images.toggleEnabled)
	local disabledImage = Config.Images.toggleDisabled
	local heldDownImage = Config.Images.toggleDown
	local enabledImage = Config.Images.toggleEnabled
	input.Image = disabledImage
	input.PressedImage = heldDownImage
	input.Size = UDim2.new(0.5, 0, 1, 0)
	input.ResampleMode = Enum.ResamplerMode.Pixelated
	input.ScaleType = Enum.ScaleType.Fit
	input.BackgroundColor3 = Config.Colors.secondary
	input.BorderSizePixel = 0
	input.Visible = true
	input.Parent = container
	pcall(Config.OptionUIOverride.toggleInput, input)
	local toolTip = insertToolTip(input)
	pcall(uiOverrideFunc, input, toolTip)

	input.MouseButton1Click:Connect(function()
		input:SetAttribute('toggle', not input:GetAttribute('toggle'))
		input.Image = disabledImage
		if input:GetAttribute('toggle') then
			input.Image = enabledImage
		end
		pcall(clickEvent, input, input:GetAttribute('toggle'), disabledImage, heldDownImage, enabledImage)
	end)

	return container
end
return OptionTemplate
