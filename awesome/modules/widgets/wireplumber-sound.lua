-- Lain style volume stuff with wireplumber


local helpers = require("modules.lain.helpers")
local shell   = require("awful.util").shell
local wibox   = require("wibox")
local string  = string
local type    = type

local function factory(args)
    args           = args or {}

    local wp    = { widget = args.widget or wibox.widget.textbox(), device = "N/A" }
    local timeout  = args.timeout or 5
    local settings = args.settings or function() end

    wp.devicetype = args.devicetype or "@DEFAULT_SINK@"
    wp.cmd = args.cmd or "wpctl get-volume " .. wp.devicetype

    function wp.update()
        helpers.async({ shell, "-c", type(wp.cmd) == "string" and wp.cmd or wp.cmd() },
            function(s)
                volume_now = string.match(s, "Volume: (%S+)") * 100 or "N/A"
                muted = string.match(s, "[MUTED]") or "N/A"
                widget = wp.widget
                settings()
            end)
    end

    helpers.newtimer("wp", timeout, wp.update)
    wp.soundup =   function() os.execute( "wpctl set-volume " .. wp.devicetype .. " 1%+" ) end
    wp.sounddown = function() os.execute( "wpctl set-volume " .. wp.devicetype .. " 1%-" ) end
    wp.mute =      function() os.execute( "wpctl set-mute " .. wp.devicetype .. " toggle" ) end

    return wp
end

return factory
