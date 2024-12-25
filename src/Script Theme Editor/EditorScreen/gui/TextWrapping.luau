local Studio = settings().Studio
local Config = require(script.Parent.Parent.Parent.Config).EditorScreen
local function setState(_, state: boolean, __, ___, ____)
	Studio['Text Wrapping'] = state
end
local function overrideUI(imageButton: ImageButton, toolTip: TextBox)
	imageButton.Image = Config.Images.toggleDisabled
	if Studio['Text Wrapping'] then
		imageButton.Image = Config.Images.toggleEnabled
	end
	imageButton:SetAttribute('toggle', Studio['Text Wrapping'])
	toolTip.Text = 'Makes text fit in one screen without any horizontal scrolling.'
end
local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newToggleInput('Text Wrapping', overrideUI, setState)
container.LayoutOrder = 5
return container
