local awful = require("awful")
local beautiful = require("beautiful")

local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

-- {{{ Menu
-- Create a launcher widget and a main menu
Myawesomemenu = {
    { "Hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "Manual",      Terminal .. " -e man awesome" },
    { "Edit config", Editor_cmd .. " " .. awesome.conffile },
    { "Restart",     awesome.restart },
    { "Quit",        function() awesome.quit() end },
}

Mymainmenu = awful.menu({
    items = { { "awesome", Myawesomemenu, beautiful.awesome_icon },
        { "Open Terminal", Terminal }
    }
})

Mylauncher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = Mymainmenu
})

-- Menubar configuration
menubar.utils.Terminal = Terminal -- Set the Terminal for applications that require it
-- }}}
