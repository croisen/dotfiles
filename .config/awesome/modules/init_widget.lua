-- I am a lazy guy
-------------------------------------------------------------------

local wibox = require("wibox")

local theme = require("themes.theme")
local lain = require("modules.lain")
local markup = lain.util.markup
local net_widget = require("modules.widgets.net-speed-widget.net-speed")

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

stuff.net = net_widget
stuff.volume = lain.widget.alsa({
    cmd = "amixer -D pulse",
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, "🔊 " .. volume_now.level .. "% "))
    end
})

stuff.weather = lain.widget.weather({
    APPID = "no",
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

return stuff
