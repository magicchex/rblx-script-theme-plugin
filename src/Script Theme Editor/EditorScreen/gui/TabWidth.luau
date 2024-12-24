--TODO: Make an option template so I can clone for every setting!
local Studio = settings().Studio

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
label.Text = 'Tab Width'
label.Size = UDim2.new(0.5, 0, 1, 0)
label.Visible = true

local numInput = Instance.new('TextBox')
numInput.LayoutOrder = 1
numInput.TextTruncate = Enum.TextTruncate.AtEnd
numInput.BorderSizePixel = 0
numInput.BackgroundTransparency = 0
numInput.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
numInput.TextColor3 = Color3.new(0, 0, 0)
numInput.TextTransparency = 0
numInput.TextStrokeTransparency = 1
numInput.PlaceholderText = 'Type an number...'
numInput.ClearTextOnFocus = false
numInput.TextEditable = true
numInput.TextXAlignment = Enum.TextXAlignment.Center
numInput.TextYAlignment = Enum.TextYAlignment.Center
numInput.TextScaled = true
numInput.Text = Studio['Tab Width']
numInput.Size = UDim2.new(0.5, 0, 1, 0)
numInput.Visible = true

numInput.FocusLost:Connect(function(_, __)
	local success, result = pcall(tonumber, numInput.Text)
	if success then
		if result < 1 then
			result = 1
		end
		Studio['Tab Width'] = result
	end
	numInput.Text = Studio['Tab Width']
end)

uiListLayout.Parent = container
label.Parent = container
numInput.Parent = container
return container
