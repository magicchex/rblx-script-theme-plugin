local Studio = settings().Studio
local Config = require(script.Parent.Parent.Parent.Config).EditorScreen
local function setState(_, state: boolean, __, ___, ____)
	Studio['Scroll Past Last Line'] = state
end
local function overrideUI(imageButton: ImageButton, toolTip: TextBox)
	imageButton.Image = Config.Images.toggleDisabled
	if Studio['Scroll Past Last Line'] then
		imageButton.Image = Config.Images.toggleEnabled
	end
	imageButton:SetAttribute('toggle', Studio['Scroll Past Last Line'])
	toolTip.Text = 'Allows the editor to scroll past the last line.'
end
local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newToggleInput('Scroll Past Last Line', overrideUI, setState)
container.LayoutOrder = 7
return container
