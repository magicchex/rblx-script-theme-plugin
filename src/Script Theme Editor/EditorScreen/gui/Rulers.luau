local Studio = settings().Studio
local function validate(textBox)
	return
end
local function overrideUI(textBox: TextBox, toolTip: TextBox)
	textBox.Text = 'Editable in\n File > Studio Settings... > Script Editor'
	textBox.TextEditable = false
	toolTip.Text = 'Vertical lines drawn at each specified column.'
end
local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newTextInput('Rulers', overrideUI, validate)
container.LayoutOrder = 8
return container
