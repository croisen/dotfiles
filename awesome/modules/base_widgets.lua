local awful = require("awful")
local wibox = require("wibox")

-- Keyboard map indicator and switcher
Mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
Mytextclock = wibox.widget.textclock()
