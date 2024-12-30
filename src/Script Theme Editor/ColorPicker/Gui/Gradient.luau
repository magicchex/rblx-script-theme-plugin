local AssetService = game:GetService('AssetService')
local UserInputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')

local function retrieveHue(hueProperty: number)
	return (hueProperty % 360) / 360
end
local hue = retrieveHue(0)

local function updateColor()
	return
end

local function updateGradient(editableImage: EditableImage)
	local imgBuffer = editableImage:ReadPixelsBuffer(Vector2.zero, editableImage.Size)
	for pixel = 1, editableImage.Size.X * editableImage.Size.Y do
		local offsetPixel = pixel - 1
		local x = offsetPixel % editableImage.Size.X
		local y = math.floor(offsetPixel / editableImage.Size.X) * editableImage.Size.X
		local color = Color3.fromHSV(hue, x / editableImage.Size.X, y / editableImage.Size.X)

		local byteIdx = offsetPixel * 4
		buffer.writeu8(imgBuffer, byteIdx, math.floor(color.R))
		buffer.writeu8(imgBuffer, byteIdx + 1, math.floor(color.G))
		buffer.writeu8(imgBuffer, byteIdx + 2, math.floor(color.B))
		buffer.writeu8(imgBuffer, byteIdx + 3, 255)
	end
	editableImage:WritePixelsBuffer(Vector2.zero, editableImage.Size, imgBuffer)
	return
end

local editableImage = AssetService:CreateEditableImage({
	Size = Vector2.one * 256,
})
if not editableImage then
	error('Could not load color picker image!', 1)
end
updateGradient(editableImage)

local container = Instance.new('Frame')
container.BackgroundTransparency = 1
container.BorderSizePixel = 0
container.Size = UDim2.fromScale(1, 1)
container.AnchorPoint = Vector2.new(0, 0)
container.Position = UDim2.fromOffset(0, 0)

local UIListLayout = Instance.new('UIListLayout')

local gradient = Instance.new('ImageButton')
gradient.BackgroundColor3 = Color3.new(1, 0, 1)
gradient.BackgroundTransparency = 0
gradient.ResampleMode = Enum.ResamplerMode.Pixelated
gradient.BorderSizePixel = 0
gradient.AutoButtonColor = false
gradient.ScaleType = Enum.ScaleType.Fit
gradient.ImageContent = Content.fromObject(editableImage)
gradient.Size = UDim2.fromScale(1, 1)
gradient.ZIndex = 0
gradient.AnchorPoint = Vector2.zero
gradient.Parent = container

local crosshair = Instance.new('ImageLabel')
crosshair.Interactable = false
crosshair.BackgroundTransparency = 1
crosshair.ResampleMode = Enum.ResamplerMode.Pixelated
crosshair.BorderSizePixel = 0
crosshair.ScaleType = Enum.ScaleType.Fit
crosshair.ImageContent = Content.fromUri('rbxasset://textures/AnimationEditor/icon_add.png')
crosshair.AnchorPoint = Vector2.one * 0.5
crosshair.Size = UDim2.new(0.05, 0, 0.05, 0)
crosshair.Visible = true
crosshair.Parent = gradient
crosshair.ZIndex = 100

return container
