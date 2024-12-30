local ColorsModule = script.Parent.Colors
ColorsModule.Archivable = true
local ImagesModule = script.Parent.Images
ImagesModule.Archivable = true

local colorClone = ColorsModule:Clone()
colorClone.Parent = script
local imageClone = ImagesModule:Clone()
imageClone.Parent = script

local Colors = require(colorClone)
local Images = require(imageClone)

local function setGuiObject(guiObject: GuiObject)
	guiObject.LayoutOrder = 0
	guiObject.ZIndex = 0
	guiObject.BorderSizePixel = 0
	guiObject.BorderMode = Enum.BorderMode.Outline
	guiObject.BorderColor3 = Colors.highlight
	guiObject.BackgroundTransparency = 0
	guiObject.BackgroundColor3 = Colors.secondary
	guiObject.AnchorPoint = Vector2.zero
	guiObject.Position = UDim2.fromScale(0, 0)
	guiObject.SizeConstraint = Enum.SizeConstraint.RelativeXY
	guiObject.Size = UDim2.fromScale(1, 1)
	guiObject.ClipsDescendants = true
	guiObject.Visible = true
end
local function setGuiButton(guiButton: GuiButton)
	guiButton.Style = Enum.ButtonStyle.Custom
	setGuiObject(guiButton)
	guiButton.AutoButtonColor = true
	guiButton.Modal = true
	guiButton.Interactable = true
end

local uiListLayout = Instance.new('UIListLayout')
uiListLayout.FillDirection = Enum.FillDirection.Vertical
uiListLayout.Padding = UDim.new(0, 0)
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Wraps = true

local scrollingFrame = Instance.new('ScrollingFrame')
setGuiObject(scrollingFrame)
scrollingFrame.Size = UDim2.fromScale(1, 1)
scrollingFrame.AnchorPoint = Vector2.new(0, 0)
scrollingFrame.Position = UDim2.fromScale(0, 0)
scrollingFrame.BackgroundColor3 = Colors.primary
scrollingFrame.BorderSizePixel = 0
scrollingFrame.Visible = true
scrollingFrame.TopImage = Content.fromUri(Images.topScroll)
scrollingFrame.MidImage = Content.fromUri(Images.midScroll)
scrollingFrame.BottomImage = Content.fromUri(Images.botScroll)
scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
scrollingFrame.ScrollBarThickness = 0
scrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.None
scrollingFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.None
scrollingFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

return {
	UIListLayout = uiListLayout,
	ScrollingFrame = scrollingFrame,
	SetGuiObject = setGuiObject,
	SetGuiButton = setGuiButton,
}
