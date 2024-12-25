local Studio = settings().Studio
local function correctNumber(textBox, success, result)
	return
end
local function overrideUI(textBox: TextBox, toolTip: TextBox)
	textBox.Text = 'Editable in\n File > Studio Settings... > Script Editor'
	textBox.TextEditable = false
	toolTip.Text =
		'It will disable features in the script editor when the current script contains the specified threshold'
end
local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newNumberInput('Large File Line Count Threshold', overrideUI, correctNumber)
container.LayoutOrder = 3
return container
