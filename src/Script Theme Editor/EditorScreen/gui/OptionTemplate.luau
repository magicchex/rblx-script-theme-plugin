local OptionTemplate = {}

local function createTemplateWithoutOptions(labelText: string?)
	local container = Instance.new('Frame')
	container.BackgroundColor3 = Color3.new(0, 0, 0)
	container.BorderSizePixel = 0
	container.Size = UDim2.new(1, 0, 0.2, 0)
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
	label.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
	label.TextColor3 = Color3.new(0, 0, 0)
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

function OptionTemplate.newTextInput(labelText: string?, optionalFunc: (TextBox) -> ())
	local container = createTemplateWithoutOptions(labelText)

	local input = Instance.new('TextBox')
	input.LayoutOrder = 1
	input.TextTruncate = Enum.TextTruncate.AtEnd
	input.BorderSizePixel = 0
	input.BackgroundTransparency = 0
	input.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
	input.TextColor3 = Color3.new(0, 0, 0)
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

	input.FocusLost:Connect(function(_, __)
		pcall(optionalFunc, input)
	end)
	return container
end
function OptionTemplate.newNumberInput(labelText: string?, optionalFunc: (TextBox, boolean, number?) -> ())
	local container = createTemplateWithoutOptions(labelText)
	local input = Instance.new('TextBox')
	input.LayoutOrder = 1
	input.TextTruncate = Enum.TextTruncate.AtEnd
	input.BorderSizePixel = 0
	input.BackgroundTransparency = 0
	input.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
	input.TextColor3 = Color3.new(0, 0, 0)
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

	input.FocusLost:Connect(function(_, __)
		local success, result = pcall(tonumber, input.Text)
		pcall(optionalFunc, input, success, result)
	end)
	return container
end
function OptionTemplate.newToggleInput(
	labelText: string?,
	optionalFunc: (ImageButton, boolean, string, string, string) -> ()
)
	local container = createTemplateWithoutOptions(labelText)
	local input = Instance.new('ImageButton')
	input:SetAttribute('toggle', false)
	-- local uncheck = Content.fromUri('rbxasset://textures/CollisonGroupsEditor/unchecked.png')
	-- local press = Content.fromUri('rbxasset://textures/CollisionGroupsEditor/checked-whitebg.png')
	-- local check = Content.fromUri('rbxasset://textures/CollisionGroupsEditor/checked-bluebg.png')
	local uncheck = 'rbxasset://textures/CollisionGroupsEditor/unchecked.png'
	local press = 'rbxasset://textures/CollisionGroupsEditor/checked-whitebg.png'
	local check = 'rbxasset://textures/CollisionGroupsEditor/checked-bluebg.png'
	input.Image = uncheck
	input.PressedImage = press
	input.Size = UDim2.new(0.5, 0, 1, 0)
	input.ResampleMode = Enum.ResamplerMode.Pixelated
	input.ScaleType = Enum.ScaleType.Fit
	input.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
	input.BorderSizePixel = 0
	input.Visible = true
	input.Parent = container

	input.MouseButton1Click:Connect(function()
		input:SetAttribute('toggle', not input:GetAttribute('toggle'))
		input.Image = uncheck
		if input:GetAttribute('toggle') then
			input.Image = check
		end
		pcall(optionalFunc, input, input:GetAttribute('toggle'), uncheck, press, check)
	end)

	return container
end
return OptionTemplate
