----------------------------------------------------------------------------------------------------------
-- Tried making my own weather widget as I couldn't get streetturtle's                                  --
-- to work (not that I've succeeded in making a widget before)                                          --
-- This uses wttr.in as a source                                                                        --
-- Icons are from this download link                                                                    --
-- https://www.mediafire.com/download/kyika35za49ete3/dripicons-weather-by-amit-jakhu-07-29-2014.zip    --
----------------------------------------------------------------------------------------------------------


local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local watch = require("awful.widget.watch")
local wibox = require("wibox")

local command = [[bash -c \"curl -sLA 'Mozilla/5.0 (X11; Linux x86_64; rv:108.0) Gecko/20100101 Firefox/108.0' wttr.in"]]
local weather_condition = ""
local weather_widget = {}
local widget_dir = gears.filesystem.get_configuration_dir() .. "modules/widgets/weather-widget/"
local temperature = ""

-- I'mma just try to imitate streetturle
local function worker(user_args)
    local args = user_args or {}

    local font = args.font or 'Play 8'
    local path_to_icons = widget_dir .. "icons/"

    local display_notification = args.display_notification or false
    local display_notification_onClick = args.display_notification_onClick or true
    local display_notification_position = "top_right"
    local notification
    local timeout = args.timeout or 1800

    if not gears.filesystem.dir_readable(path_to_icons) then
        naughty.notify({
            title = "Weather Widget",
            text = "The icons folder for this widget cannot be found: " .. path_to_icons,
            preset = naughty.config.presets.critical
        })
    end

    weather_widget = wibox.widget({
        font = font,
        layout = wibox.layout.fixed.horizontal,
        widget = wibox.widget.textbox,
    })

    local function show_weather_condition(weather_condition, temperature)
        naughty.destroy(notification)
        notification = naughty.notify({
            text = weather_condition .. "at " .. temperature,
            title = "Current weather condition:",
            position = display_notification_position,
            timeout = 5,
            hover_timeout = 0.5,
            width = 200,
            screen = mouse.screen
        })
    end

    function set_image_based_on_weather_condition(weather_condition)
        if weather_condition == "Cloudy" then
            return "☁️ "
        elseif weather_condition == "Fog" then
            return "🌫 "
        elseif weather_condition == "Heavy Rain" then
            return "🌧 "
        elseif weather_condition == "Heavy Showers" then
            return "🌧 "
        elseif weather_condition == "Heavy Snow" then
            return "❄️ "
        elseif weather_condition == "Heavy Snow Showers" then
            return "❄️ "
        elseif weather_condition == "Light Rain" then
            return "🌦 "
        elseif weather_condition == "Light Showers" then
            return "🌦 "
        elseif weather_condition == "Light Sleet" then
            return "🌧 "
        elseif weather_condition == "Light Sleet Showers" then
            return "🌧 "
        elseif weather_condition == "Light Snow" then
            return "🌧 "
        elseif weather_condition == "Light Snow Showers" then
            return "🌧 "
        elseif weather_condition == "Partly Cloudy" then
            return "⛅️ "
        elseif weather_condition == "Sunny" then
            return "☀️ "
        elseif weather_condition == "Thunder Heavy Rain" then
            return "⛈ "
        elseif weather_condition == "Thundery Showers" then
            return "⛈ "
        elseif weather_condition == "Thundery Snow Showers" then
            return "⛈ "
        elseif weather_condition == "Very Cloudy" then
            return "☁️ "
        else
            return "✨ "
        end
    end

    watch(command, timeout,
        function(widget, stdout)
            local output_table = {}
            local span_regex = "%s*<span%sclass=\"%x+\">"

            for line in stdout:gmatch("[\r\n]+") do
                table.insert(output_table, line)
            end

            weather_condition = output_table[301]:gsub(span_regex, ""):gsub("[/]*</span>", "")
            weather_condition = weather_condition:gsub("^%s*%g*%s*", "")
            temperature = output_table[302]:gsub(span_regex, ""):gsub("[/]*</span>", "")
            temperature = temperature:gsub("^%s*%g*%s*", ""):gsub("^[%p)]*%s+", "")

            weather_widget.text = set_image_based_on_weather_condition(weather_condition)
            weather_widget.text = weather_widget.text .. temperature
        end)

    if display_notification then
        weather_widget:connect_signal("mouse::enter", function() show_weather_condition(weather_condition, temperature) end)
        weather_widget:connect_signal("mouse::leave", function() naughty.destroy(notification) end)
    elseif display_notification_onClick then
        weather_widget:connect_signal("button::press", function(_,_,_, button)
            if button == 3 then
                show_weather_condition(weather_condition, temperature)
            elseif button == 1 then
                show_weather_condition(weather_condition, temperature)
            end
        end)
        weather_widget:connect_signal("mouse::leave", function() naughty.destroy(notification) end)
    end

    return wibox.container.margin(weather_widget, 0, 0)
end

-- return setmetatable(weather_widget, { __call = function() return worker() end})
-- return worker