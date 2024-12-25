local Studio = settings().Studio
local function dropDown(textBox)
	return
end
local function overrideUI(textBox: TextBox, toolTip: TextBox)
	textBox.Text = 'Custom'
	textBox.TextEditable = false
	toolTip.Text = 'The current color scheme being used in editor.'
end
local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newTextInput('Script Theme Color Preset', overrideUI, dropDown)
container.LayoutOrder = 34

return container
