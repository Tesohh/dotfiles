-- Layer1 = { "shift", "alt" }
-- Layer2 = { "ctrl", "alt" }
-- Yabai = { "rightalt" }
--
-- SA = { "shift", "alt" }
-- CA = { "ctrl", "alt" }
-- MA = { "cmd", "alt" }
-- SCA = { "shift", "ctrl", "alt" }
--
-- require("switcher")
-- require("yabai")

-- hs.loadSpoon("SpaceCadet"):start()
--
hs.loadSpoon("Vifari")
spoon.Vifari:start() -- this will add hooks. `:stop()` to remove hooks

-- or if you want to customize it
spoon.Vifari:start({
	-- example your local config here
	scrollStep = 150, -- Change scroll step
	mapping = {},
})
