Hyper = hs.hotkey.modal.new({}, nil)

Hyper.pressed = function()
	Hyper:enter()
end

Hyper.released = function()
	Hyper:exit()
end

hs.hotkey.bind({}, "F18", Hyper.pressed, Hyper.released)
