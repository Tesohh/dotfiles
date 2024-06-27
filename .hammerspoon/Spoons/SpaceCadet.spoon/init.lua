local SpaceCadet = {}
SpaceCadet.__index = SpaceCadet

SpaceCadet.name = "SpaceCadet"
SpaceCadet.version = "0.1"
SpaceCadet.author = "Simone Tesini"
SpaceCadet.homepage = "https://github.com/Tesohh/SpaceCadet.spoon"
SpaceCadet.license = "MIT - https://opensource.org/licenses/MIT"

local bars = {}

local function newBar(iconPath, clickCallback)
    local item = hs.menubar.new()
    iconPath:template(true)
    item:setIcon(iconPath)
    item:setClickCallback(clickCallback)
    return item
end

function SpaceCadet:start()
    -- initialize menubars
    for key, value in pairs(hs.image.systemImageNames) do
        print(value)
    end
    for key, value in pairs(hs.image.additionalImageNames) do
        print(value)
    end
    bars[2] = newBar(hs.image.imageFromName("NSTouchBarRemoveTemplate"))
    bars[1] = newBar(hs.image.imageFromName("pencil.tip.crop.circle.badge.plus"))

    self.watcher = hs.spaces.watcher.new(function(space)
        -- TODO: update...
    end)

    self.watcher:start()
end

function SpaceCadet:stop()
    if self.watcher then
        self.watcher:stop()
        self.watcher = nil
    end

    if self.menu then
        -- TODO: delete menubars
    end
end

return SpaceCadet
