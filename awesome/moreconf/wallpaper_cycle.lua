local awful = require("awful")
local gears = require("gears")

local home  = os.getenv("HOME")
local wFile = home .. "/.local/share/wallpapers.txt"
local w     = {}
WIndex      = 0

local function table_size(T)
    local wTableSize = 0
    for _ in pairs(T) do wTableSize = wTableSize + 1 end
    return wTableSize
end

local function lines_from(file)
    local lines = {}

    -- Muhahahahahahahaha!!!
    lines[0] = home .. "/.config/awesome/powerarrow-dark/wall.png"
    if not gears.filesystem.file_readable(file) then return lines end

    for line in io.lines(file) do
        if gears.filesystem.file_readable(line) then
            lines[#lines + 1] = line
        end
    end
    return lines
end

function w.cycle_wallpaper_forward()
    local wallpapers = lines_from(wFile)
    local s = awful.screen.focused()
    local wTableSize = table_size(wallpapers)

    -- Thanks to indexing by 0 this is easier to understand
    -- than (WIndex % wTableSize) + 1 as to why it rolls forward correctly
    -- for me at least
    WIndex = (WIndex + 1) % wTableSize
    gears.wallpaper.maximized(wallpapers[WIndex], s, true)
end

function w.cycle_wallpaper_backward()
    local wallpapers = lines_from(wFile)
    local s = awful.screen.focused()
    local wTableSize = table_size(wallpapers)

    -- Couldn't figure out a way on how to make this index 1 based
    -- But this is a nice way to roll backwards without going negative
    -- Stumbled upon this accidentally while messing around with dwm
    WIndex = (WIndex + (wTableSize - 1)) % wTableSize
    gears.wallpaper.maximized(wallpapers[WIndex], s, true)
end

function w.set_wallpaper()
    local wallpapers = lines_from(wFile)
    local s = awful.screen.focused()
    gears.wallpaper.maximized(wallpapers[WIndex], s, true)
end

return w
