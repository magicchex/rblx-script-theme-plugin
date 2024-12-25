local Config = require(script.Parent.Parent.Parent.Config).EditorScreen
local background = Instance.new('ScrollingFrame')
background.Size = UDim2.new(1, 0, 1, 0)
background.AnchorPoint = Vector2.new(0, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Config.Colors.primary
background.BorderSizePixel = 0
background.Visible = true
background.ScrollBarThickness = 0
return background
