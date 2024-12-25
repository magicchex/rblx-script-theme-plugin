local Studio = settings().Studio
local function setFont(textBox)
	return
end
local function overrideUI(textBox: TextBox, toolTip: TextBox)
	textBox.Text = 'Editable in \n"File  > Studio Settings... > Script Editor"'
	textBox.TextEditable = false
	toolTip.Text = 'The font used in the script editor.'
end
local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newTextInput('Font', overrideUI, setFont)
container.LayoutOrder = 0
return container
