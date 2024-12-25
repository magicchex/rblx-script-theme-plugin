local Studio = settings().Studio
local function correctNumber(textBox, success, result)
	if success then
		if result < 1 then
			result = 1
		end
		if result > 8 then
			result = 8
		end
		Studio['Tab Width'] = result
	end
	textBox.Text = Studio['Tab Width']
end
local function overrideUI(textBox: TextBox, toolTip: TextBox)
	textBox.Text = Studio['Tab Width']
	toolTip.Text = 'The width of the tab, measured in number of spaces. Value must be 1 to 8.'
end
local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newNumberInput('Tab Width', overrideUI, correctNumber)
container.LayoutOrder = 1
return container
