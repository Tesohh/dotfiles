local spaces = require("hs.spaces")
local screens = require("hs.screen")
local hotkey = require("hs.hotkey")

-- Function to switch to the next space
function switchSpace(target)
	local allScreens = screens.allScreens()
	local allSpaces = {}
	for _, s in pairs(allScreens) do
		for _, sp in pairs(spaces.spacesForScreen(s:id())) do
			table.insert(allSpaces, sp)
		end
	end

	print(sp)
	spaces.gotoSpace(allSpaces[target])
end
