-- I am a lazy guy
-------------------------------------------------------------------

local wibox = require("wibox")

local theme = require("themes.theme")
local lain = require("modules.lain")
local helpers = require("modules.lain.helpers")
local markup = lain.util.markup

local stuff = {}

stuff.bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc
        if bat_now.ac_status == 1 then
            perc = perc .. "+"
        end
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "🔋 " .. perc .. " "))
    end
})

stuff.mytextclock = wibox.widget.textclock(markup.fontfg(theme.font, theme.fg_normal, "🗓️ %A %d %B > %H:%M"))

stuff.cal = lain.widget.cal({
    attach_to = { stuff.mytextclock },
    notification_preset = {
        font = theme.font,
        fg = theme.fg_normal,
        bg = theme.bg_normal
    }
})

stuff.cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "🔳 " .. cpu_now.usage .. "% "))
    end
})

stuff.mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "📼 " .. mem_now.used .. "MB "))
    end
})

stuff.temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "🌡️ " .. coretemp_now .. "°C "))
    end
})

stuff.alsa = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "🔊 " .. volume_now.level .. "% "))
    end
})

stuff.pulse = lain.widget.pulse {
    settings   = function()
        vlevel = volume_now.left .. "-" .. volume_now.right .. "% | " .. volume_now.device
        if volume_now.muted == "yes" then
            vlevel = vlevel .. " M"
        end
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "🔊 " .. vlevel .. " "))
    end
}

local wireplumber = require("modules.widgets.wireplumber-sound")
stuff.wireplumber = wireplumber({
    settings   = function()
        if muted ~= "N/A" then
            volume_now = volume_now .. "M"
        end
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "🔊 " .. volume_now .. " "))
    end
})

stuff.weather = lain.widget.weather({
    APPID = "nononooo",
    city_id = 1709007, -- placeholder
    notification_preset = { font = theme.font, fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#eca4c4", "N/A "),
    timeout = 1800,
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "🌤️ " .. descr .. " @ " .. units .. "°C "))
    end
})

stuff.cpu_turtle = require("modules.widgets.cpu-widget.cpu-widget")
stuff.net_turtle = require("modules.widgets.net-speed-widget.net-speed")

stuff.sound = function(sound_backend)
    if sound_backend == "alsa" then
        return stuff.alsa
    elseif sound_backend == "pulseaudio" then
        return stuff.pulse
    elseif sound_backend == "wireplumber" then
        return stuff.wireplumber
    end
end

return stuff
