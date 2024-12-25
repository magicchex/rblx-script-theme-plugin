local Studio = settings().Studio
local Config = require(script.Parent.Parent.Parent.Config).EditorScreen
local function setState(_, state: boolean, __, ___, ____)
	Studio['Format On Type'] = state
end
local function overrideUI(imageButton: ImageButton, toolTip: TextBox)
	imageButton.Image = Config.Images.toggleDisabled
	if Studio['Format On Type'] then
		imageButton.Image = Config.Images.toggleEnabled
	end
	imageButton:SetAttribute('toggle', Studio['Format On Type'])
	toolTip.Text = 'Auto formats after typing.'
end
local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newToggleInput('Format On Type', overrideUI, setState)
container.LayoutOrder = 9
return container
