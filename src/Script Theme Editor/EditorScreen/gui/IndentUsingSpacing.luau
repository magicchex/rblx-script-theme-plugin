local Studio = settings().Studio
local function correctNumber(_, state: boolean, __, ___, ____)
	Studio['Indent Using Spaces'] = state
end

local OptionTemplate = require(script.Parent.OptionTemplate)
local container = OptionTemplate.newToggleInput('Indent Using Spacing', optionalFunc)

return container
