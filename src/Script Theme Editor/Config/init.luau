local DefaultInstance = require(script.DefaultInstances)
local Toolbar = require(script.Toolbar)
local Window = require(script.Window)
local Colors = require(script.Colors)
local Images = require(script.Images)
local EditorScreen = require(script.EditorScreen)

return {
	defaultInstance = DefaultInstance,
	toolbar = Toolbar,
	window = Window,
	color = Colors,
	image = Images,
	editorScreen = EditorScreen,
}
