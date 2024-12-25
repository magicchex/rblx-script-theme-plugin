local gui = {}
for _, module: ModuleScript in pairs(script:GetChildren()) do
	if module.Name:lower():match('template') then
		continue
	end
	gui[module.Name] = require(module)
end
print(gui)
return gui
