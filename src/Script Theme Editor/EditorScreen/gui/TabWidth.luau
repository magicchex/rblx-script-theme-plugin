local Studio = settings().Studio
local function correctNumber(textBox, success, result)
	if success then
		if result < 1 then
			result = 1
		end
		Studio['Tab Width'] = result
	end
	textBox.Text = Studio['Tab Width']
end

local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newNumberInput('Tab Width', correctNumber)

return container
