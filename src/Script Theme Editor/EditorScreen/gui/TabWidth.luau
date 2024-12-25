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
local function overrideUI(textBox: TextBox)
	textBox.Text = Studio['Tab Width']
end
local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newNumberInput('Tab Width', overrideUI, correctNumber)

return container
