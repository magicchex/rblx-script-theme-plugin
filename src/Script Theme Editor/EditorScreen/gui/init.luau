local gui = {}
for _, module: ModuleScript in ipairs(script:GetChildren()) do
	if module.Name:lower():match('template') then
		continue
	end
	gui[module.Name] = require(module)
end
return gui
