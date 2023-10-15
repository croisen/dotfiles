-- Copy pasted from the template rc.lua {
pcall(require, "luarocks.loader")

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local freedesktop = require("modules.freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local naughty = require("naughty")
local wibox = require("wibox")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")
-- }

-- Variable definitions
local config_path = gears.filesystem.get_configuration_dir()
local modkey = "Mod4"
local terminal = "kitty"
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor
local menu_terminal = { "open terminal", terminal }
local myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. os.getenv("HOME") .. "/.config/awesome/rc.lua" },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }

-- Put the error handler in another file
-- TODO: Test if other parts of rc lua can be slapped into a seperate file
require("modules/error_handler")
local executer = require("modules.executer")
local keybinds = require("modules.keybinds")
local widgets  = require("modules.init_widget")

-- Theme setup
beautiful.init(config_path .. "themes/theme.lua")
--local mykeyboardlayout = awful.widget.keyboardlayout()
--local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
menubar.utils.terminal = terminal

-- Copy pasted from the template rc.lua {
awful.layout.layouts = {
	-- awful.layout.suit.floating,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.spiral,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier,
	awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}


mymainmenu = freedesktop.menu.build({
    before = { menu_awesome },
    after =  { menu_terminal }
})

local taglist_buttons = gears.table.join(
	awful.button({ }, 1, function(t) t:view_only() end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({ }, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
	awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
	awful.button({ }, 1, function (c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal(
				"request::activate",
				"tasklist",
				{raise = true}
			)
		end
	end),
	awful.button({ }, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({ }, 4, function ()
		awful.client.focus.byidx(1)
	end),
	awful.button({ }, 5, function ()
		awful.client.focus.byidx(-1)
	end)
)

local function set_wallpaper(s)
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

screen.connect_signal("property::geometry", set_wallpaper)
awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)
	awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

	s.mypromptbox = awful.widget.prompt()
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
	   awful.button({ }, 1, function () awful.layout.inc( 1) end),
	   awful.button({ }, 3, function () awful.layout.inc(-1) end),
	   awful.button({ }, 4, function () awful.layout.inc( 1) end),
	   awful.button({ }, 5, function () awful.layout.inc(-1) end)))

	s.mytaglist = awful.widget.taglist {
		screen  = s,
		filter  = awful.widget.taglist.filter.all,
		buttons = taglist_buttons
	}

	s.mytasklist = awful.widget.tasklist {
		screen  = s,
		filter  = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons
	}

	s.mywibox = awful.wibar({ position = "top", screen = s })

	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			--mylauncher,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			-- mykeyboardlayout,
			wibox.widget.systray(),
            --widgets.alsa.widget,
            widgets.sound("wireplumber").widget,
            widgets.bat,
            widgets.mytextclock,
			s.mylayoutbox,
		},
	}

    s.mybottomwibox = awful.wibar({ position = "bottom", screen = s })
    s.mybottomwibox:setup({
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            widgets.net_turtle(),
            widgets.cpu_turtle(),
        },
        {
            layout = wibox.layout.fixed.horizontal,
        },
        {
            widgets.cpu.widget,
            widgets.temp,
            widgets.mem.widget,
            widgets.weather.widget,
            layout = wibox.layout.fixed.horizontal,
        }
    })
end)


-- {{{ Rules
awful.rules.rules = {
    { rule = { },
      properties = {
      	border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = keybinds.clientkeys,
        buttons = keybinds.clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen}
    },

    -- Floating clients.
    { rule_any = {
        instance = {
        	"DTA",  -- Firefox addon DownThemAll.
        	"copyq",  -- Includes session name in class.
        	"pinentry",
        },
        class = {
        	"Arandr",
        	"Blueman-manager",
        	"Gpick",
        	"Kruler",
        	"MessageWin",  -- kalarm.
        	"nitrogen",
        	"Sxiv",
        	"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
        	"Wpa_gui",
        	"veromix",
        	"xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
        	"Event Tester",  -- xev.
        },
        role = {
        	"AlarmWindow",  -- Thunderbird's calendar.
        	"ConfigManager",  -- Thunderbird's about:config.
        	"pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },
}

-- Signals
client.connect_signal("manage", function (c)
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- }

-- Autostarts
executer.run_once({
	"blueman-applet",
	"compton",
	"nm-applet",
})
executer.execute("xset", "s off -b -dpms") -- I don't want the screen to sleep
