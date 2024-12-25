local Studio = settings().Studio
local Config = require(script.Parent.Parent.Parent.Config).EditorScreen
local function setState(_, state: boolean, __, ___, ____)
	Studio['Show Whitespace'] = state
end
local function overrideUI(imageButton: ImageButton, toolTip: TextBox)
	imageButton.Image = Config.Images.toggleDisabled
	if Studio['Show Whitespace'] then
		imageButton.Image = Config.Images.toggleEnabled
	end
	imageButton:SetAttribute('toggle', Studio['Show Whitespace'])
	toolTip.Text = 'Reveals empty lines and spaces visually.'
end
local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newToggleInput('Show Whitespace', overrideUI, setState)
container.LayoutOrder = 35
return container
