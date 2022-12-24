-- Copy pasted from the template rc.lua {
pcall(require, "luarocks.loader")

local awful = require("awful")
local beautiful = require("beautiful")
local debian = require("debian.menu")
local gears = require("gears")
local has_fdo, freedesktop = pcall(require, "freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")
local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }
local naughty = require("naughty")
local wibox = require("wibox")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")
-- }

-- Put the error handler in another file
require("modules/error_handler")

-- Variable definitions
local config_path = gears.filesystem.get_configuration_dir()
local alt_key = "Mod1"
local modkey = "Mod4"
local terminal = "kitty"
local editor = os.getenv("EDITOR") or "editor"
local editor_cmd = terminal .. " -e " .. editor

-- Theme setup and widgets
beautiful.init(config_path .. "themes/theme.lua")
local battery_widget = require("modules/widgets/battery-widget/battery")
local cpu_widget = require("modules/widgets/cpu-widget/cpu-widget")
local net_speed_widget = require("modules/widgets/net-speed-widget/net-speed")
local ram_widget = require("modules/widgets/ram-widget/ram-widget")
local volume_widget = require("modules/widgets/volume-widget/volume")
local weather_widget = require("modules/widgets/weather-widget/weather")
local mykeyboardlayout = awful.widget.keyboardlayout()
local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
local mytextclock = wibox.widget.textclock()
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

myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

if has_fdo then
	mymainmenu = freedesktop.menu.build({
		before = { menu_awesome },
		after =  { menu_terminal }
	})
else
	mymainmenu = awful.menu({
		items = {
			menu_awesome,
			{ "Debian", debian.menu.Debian_menu.Debian },
			menu_terminal,
		}
	})
end

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
			-- mylauncher,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			mykeyboardlayout,
            net_speed_widget(),
            cpu_widget(),
            ram_widget(),
            battery_widget(),
            volume_widget(),
            weather_widget({
                api_key = "no api key 4u",
                both_units_widget = true,
                coordinates = {0, 0},
                units = 'imperial',
                show_hourly_forecast = true,
                show_daily_forecast = true
            }),
			wibox.widget.systray(),
			mytextclock,
			s.mylayoutbox,
		},
	}
end)

-- Mouse bindings
root.buttons(gears.table.join(
	awful.button({ }, 3, function () mymainmenu:toggle() end),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev)
))

-- Key Bindings
globalkeys = gears.table.join(
	awful.key({ modkey }, "s",      hotkeys_popup.show_help,
		{ description="show help", group="awesome"}),
	awful.key({ modkey }, "Left",   awful.tag.viewprev,
		{ description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right",  awful.tag.viewnext,
		{ description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore,
		{ description = "go back", group = "tag" }),

	awful.key({ modkey }, "k",
		function ()
			awful.client.focus.byidx(1)
		end,
		{ description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "j",
		function ()
			awful.client.focus.byidx(-1)
		end,
		{ description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, "w", function () mymainmenu:show() end,
		{description = "show main menu", group = "awesome"}),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "k", function () awful.client.swap.byidx(  1)    end,
		{description = "swap with next client by index", group = "client"}),
	awful.key({ modkey, "Shift" }, "j", function () awful.client.swap.byidx( -1)    end,
		{description = "swap with previous client by index", group = "client"}),
	awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
		{description = "focus the next screen", group = "screen"}),
	awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
		{description = "focus the previous screen", group = "screen"}),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto,
		{description = "jump to urgent client", group = "client"}),
	awful.key({ modkey }, "Tab",
		function ()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
	{description = "go back", group = "client"}),

	-- Standard program
	awful.key({ modkey }, "Return", function () awful.spawn(terminal) end,
		{description = "open a terminal", group = "launcher"}),
	awful.key({ modkey, "Control" }, "r", awesome.restart,
		{description = "reload awesome", group = "awesome"}),
	awful.key({ modkey, "Shift" }, "q", awesome.quit,
		{description = "quit awesome", group = "awesome"}),

	awful.key({ modkey }, "l", function () awful.tag.incmwfact(0.05) end,
		{description = "increase master width factor", group = "layout"}),
	awful.key({ modkey }, "h", function () awful.tag.incmwfact(-0.05) end,
		{description = "decrease master width factor", group = "layout"}),
	awful.key({ modkey, "Shift"   }, "h", function () awful.tag.incnmaster(1, nil, true) end,
		{description = "increase the number of master clients", group = "layout"}),
	awful.key({ modkey, "Shift"   }, "l", function () awful.tag.incnmaster(-1, nil, true) end,
		{description = "decrease the number of master clients", group = "layout"}),
	awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol(1, nil, true) end,
		{description = "increase the number of columns", group = "layout"}),
	awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1, nil, true) end,
		{description = "decrease the number of columns", group = "layout"}),
	awful.key({ modkey }, "space", function () awful.layout.inc(1) end,
		{description = "select next", group = "layout"}),
	awful.key({ modkey, "Shift" }, "space", function () awful.layout.inc(1) end,
		{description = "select previous", group = "layout"}),

	awful.key({ modkey, "Control" }, "n",
		function ()
			local c = awful.client.restore()
			if c then
				c:emit_signal(
					"request::activate", "key.unminimize", {raise = true}
				)
			end
		end,
		{description = "restore minimized", group = "client"}),

	awful.key({ modkey }, "x",
		function ()
			awful.prompt.run {
				prompt       = "Run Lua code: ",
				textbox      = awful.screen.focused().mypromptbox.widget,
				exe_callback = awful.util.eval,
				history_path = awful.util.get_cache_dir() .. "/history_eval"
			}
		end,
		{description = "lua execute prompt", group = "awesome"}),
	awful.key({ modkey }, "p", function() menubar.show() end,
		{description = "show the menubar", group = "launcher"}),

	-- Customized keybinds
	awful.key({ modkey }, "r",
		function () 
			awful.util.spawn('dmenu_run')
		end,
		{description = "run dmenu", group = "launcher"}),

	awful.key({ }, "XF86AudioRaiseVolume",
		function () 
			awful.util.spawn('amixer -D pulse sset Master 5%+', false)
		end,
		{description = "raise volume", group = "sound"}),

	awful.key({ }, "XF86AudioLowerVolume",
		function () 
			awful.util.spawn('amixer -D pulse sset Master 5%-', false)
		end,
		{description = "decrease volume", group = "sound"}),

	awful.key({ modkey }, "b",
		function () 
			awful.util.spawn('firefox', false)
		end,
		{description = "run firefox", group = "frequently used"}),

	awful.key({ modkey }, "e",
		function ()
			awful.util.spawn('thunar', false)
		end,
		{description = "run thunar file manager", group = "frequently used"}),

	awful.key ({}, "Print",
		function ()
			awful.util.spawn('xfce4-screenshooter', false)
		end,
		{description = "take a screenshot", group = "frequently used"}),

	awful.key ({ alt_key }, "m",
		function ()
			awful.util.spawn('rhythmbox', false)
		end,
		{description = "open rhythmbox", group = "frequently used"}),

	awful.key ({ alt_key }, "s",
		function ()
			awful.util.spawn('subl', false)
		end,
		{description = "open sublime text", group = "frequently used"}),

	awful.key ({ alt_key }, "b",
		function ()
			awful.util.spawn('blueman-manager',{
				floating = true,
				placement = awful.placement.centered,
			}, false)
		end,
		{description = "open bluetooth manager", group = "frequently used"}),

	awful.key ({ alt_key }, "c",
		function ()
			awful.util.spawn('gnome-calculator',{
				floating = true,
				placement = awful.placement.centered,
			}, false)
		end,
		{descrtiption = "open calculator", group = "frequently used"}),

	awful.key ({ alt_key }, "r",
		function ()
			awful.util.spawn('simplescreenrecorder',{
				floating = true,
				placement = awful.placement.centered,
			}, false)
		end,
		{descrtiption = "open a screen recorder", group = "frequently used"})
)

clientkeys = gears.table.join(
	awful.key({ modkey }, "f",
		function (c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{description = "toggle fullscreen", group = "client"}),
	awful.key({ modkey, "Shift" }, "c", function (c) c:kill() end,
		{description = "close", group = "client"}),
	awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
		{description = "toggle floating", group = "client"}),
	awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
		{description = "move to master", group = "client"}),
	awful.key({ modkey }, "o",      function (c) c:move_to_screen() end,
		{description = "move to screen", group = "client"}),
	awful.key({ modkey }, "t",      function (c) c.ontop = not c.ontop end,
		{description = "toggle keep on top", group = "client"}),
	awful.key({ modkey }, "n",
		function (c)
			c.minimized = true
		end ,
		{description = "minimize", group = "client"}),
	awful.key({ modkey }, "m",
		function (c)
			c.maximized = not c.maximized
			c:raise()
		end ,
		{description = "(un)maximize", group = "client"}),
	awful.key({ modkey, "Control" }, "m",
		function (c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end ,
		{description = "(un)maximize vertically", group = "client"}),
	awful.key({ modkey, "Shift" }, "m",
		function (c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end ,
		{description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
            function ()
                  local screen = awful.screen.focused()
                  local tag = screen.tags[i]
                  if tag then
                     tag:view_only()
                  end
            end,
            {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                   awful.tag.viewtoggle(tag)
                end
            end,
            {description = "toggle tag #" .. i, group = "tag"}),
    -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
               end
            end,
            {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)

-- {{{ Rules
awful.rules.rules = {
    { rule = { },
      properties = {
      	border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = clientkeys,
        buttons = clientbuttons,
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

-- Autostarts
awful.spawn "blueman-applet"
awful.spawn "compton"
awful.spawn "indicator-keylock"
awful.spawn "nm-applet"
-- awful.spawn "nitrogen --restore"
awful.spawn "xfce4-power-manager"
