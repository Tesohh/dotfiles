local function yabind(layer, key, commands)
    hs.hotkey.bind(layer, key, function()
        hs.execute("/opt/homebrew/bin/yabai -m " .. commands)
    end)
end

local function yabindmulti(layer, key, commands)
    hs.hotkey.bind(layer, key, function()
        for _, value in pairs(commands) do
            hs.execute("/opt/homebrew/bin/yabai -m " .. value)
        end
    end)
end

-- focus
yabind(SA, "h", "window --focus west")
yabind(SA, "j", "window --focus south")
yabind(SA, "k", "window --focus north")
yabind(SA, "l", "window --focus east")

-- resizing
yabindmulti(CA, "h", { "window --resize left:-50:0", "window --resize right:-50:0" })
yabindmulti(CA, "j", { "window --resize bottom:0:50", "window --resize top:50:0" })
yabindmulti(CA, "k", { "window --resize top:0:-50", "window --resize bottom:0:-50" })
yabindmulti(CA, "l", { "window --resize right:50:0", "window --resize left:50:0" })

-- swap
yabind(MA, "h", "window --swap west")
yabind(MA, "j", "window --swap south")
yabind(MA, "k", "window --swap north")
yabind(MA, "l", "window --swap east")
yabind(MA, "i", "window --swap mouse")

-- send to space
yabind(SA, "1", "window --space 1")
yabind(SA, "2", "window --space 2")
yabind(SA, "3", "window --space 3")
yabind(SA, "4", "window --space 4")
yabind(SA, "5", "window --space 5")

yabind(CA, "1", "window --space 1 --focus")
yabind(CA, "2", "window --space 2 --focus")
yabind(CA, "3", "window --space 3 --focus")
yabind(CA, "4", "window --space 4 --focus")
yabind(CA, "5", "window --space 5 --focus")

-- misc
yabind(CA, "z", "window --toggle zoom-fullscreen")
yabind(CA, "f", "window --toggle float")
yabind(CA, "b", "space --balance")

-- change layouts
yabind(SCA, "s", "space --layout stack")
yabind(SCA, "t", "space --layout bsp")

-- restart
hs.hotkey.bind(SCA, "r", function()
    hs.execute("/opt/homebrew/bin/yabai --restart-service")
end)
