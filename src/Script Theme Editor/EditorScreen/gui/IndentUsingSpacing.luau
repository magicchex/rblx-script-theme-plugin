local Studio = settings().Studio
local Config = require(script.Parent.Parent.Parent.Config).EditorScreen
local function setState(_, state: boolean, __, ___, ____)
	Studio['Indent Using Spaces'] = state
end
local function overrideUI(imageButton: ImageButton, toolTip: TextBox)
	imageButton.Image = Config.Images.toggleDisabled
	if Studio['Indent Using Spaces'] then
		imageButton.Image = Config.Images.toggleEnabled
	end
	imageButton:SetAttribute('toggle', Studio['Indent Using Spaces'])
	toolTip.Text = 'Use spaces instead of tabs for indention.'
end
local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newToggleInput('Indent Using Spacing', overrideUI, setState)
container.LayoutOrder = 2
return container
