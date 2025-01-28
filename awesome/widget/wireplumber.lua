local helpers = require("lain.helpers")
local shell   = require("awful.util").shell
local wibox   = require("wibox")
local string  = string
local type    = type

-- PulseAudio volume
-- lain.widget.pulse

local function factory(args)
    args           = args or {}

    local wp       = { widget = args.widget or wibox.widget.textbox() }
    local timeout  = args.timeout or 5
    local settings = args.settings or function() end

    wp.devicetype  = args.devicetype or "@DEFAULT_SINK@"
    wp.cmd         = args.cmd or
        "wpctl get-volume " ..
        wp.devicetype ..
        [[ sed "s/Volume: \([\d\.]*.*\)/\1/" ]]

    function wp.update()
        helpers.async({ shell, "-c", type(wp.cmd) == "string" and wp.cmd or wp.cmd() },
            function(s)
                volume_now = {
                    level = string.match(s, "(%d.%d+)") or "N/A",
                    muted = string.match(s, ".*[MUTED]") or "N/A"
                }

                wp.device = volume_now.index
                if volume_now.level ~= "N/A" then
                    volume_now.level = 100 * volume_now.level
                    volume_now.level = math.floor(volume_now.level + 0.5)
                end

                if volume_now.muted ~= "N/A" then
                    volume_now.muted = "muted"
                end

                widget = wp.widget
                settings()
            end)
    end

    function wp.incvol(percent)
        if percent ~= nil then
            os.execute("wpctl set-volume " .. wp.devicetype .. " " .. percent .. "%+")
            wp.update()
        end
    end

    function wp.decvol(percent)
        if percent ~= nil then
            os.execute("wpctl set-volume " .. wp.devicetype .. " " .. percent .. "%-")
            wp.update()
        end
    end

    function wp.setvol(percent)
        if percent ~= nil then
            os.execute("wpctl set-volume " .. wp.devicetype .. " " .. percent .. "%")
            wp.update()
        end
    end

    function wp.togglemute()
        os.execute("wpctl set-mute " .. wp.devicetype .. " toggle")
        wp.update()
    end

    helpers.newtimer("wireplumber", timeout, wp.update)

    return wp
end

return factory
