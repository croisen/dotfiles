local awful = require("awful")
local beautiful = require("beautiful")

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            callback = awful.client.setslave,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            size_hints_honor = false,
            opacity = 1
        }
    },

    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA",   -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin",  -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer" },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester", -- xev.
            },
            role = {
                "AlarmWindow",   -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    },

    --Add titlebars to normal clients and dialogs
    --{
    --rule_any = { type = { "normal", "dialog" }
    --},
    --properties = { titlebars_enabled = true }
    --},

    {
        rule_any = {
            class = {
                "kitty",
            },
        },
        properties = {
            maximized = true,
            opacity = 0.90,
            screen = 1,
            tag = "1",
        },
    },

    {
        rule_any = {
            class = {
                "discord",

                "Electron", -- Why does the discord app not show up as discord in xwininfo?
                "thunderbird",
                "Thunderbird",

                "thunar",
                "Thunar",
            },
        },
        properties = {
            maximized = true,
            opacity = 1,
            screen = 1,
            tag = "2",
        },
    },

    {
        rule_any = {
            class = {
                "virt-manager", -- What are you, xwininfo is not giving any info about you
            },
        },
        properties = {
            maximized = true,
            opacity = 1,
            screen = 1,
            tag = "5",
        },
    },

    {
        rule_any = {
            class = {
                "ru-turikhay-tlauncher-bootstrap-Bootstrap", -- I can't afford
            },
        },
        properties = {
            maximized = true,
            opacity = 1,
            screen = 1,
            tag = "6",
        },
    },

    {
        rule_any = {
            class = {
                "steam",
                -- I'll save you some time looking up the ids
                "steam_app_1739530", -- EXCALIBURIAN!!
                "steam_app_1827180", -- Toram Online
            },
        },
        properties = {
            maximized = true,
            opacity = 1,
            screen = 1,
            tag = "7",
        },
    },

    {
        rule_any = {
            class = {
                "Audacious",
                "Spotify",
            },
        },
        properties = {
            maximized = true,
            opacity = 1,
            screen = 1,
            tag = "8",
        },
    },

    {
        rule_any = {
            class = {
                "firefox",
                "Firefox",
            },
        },
        properties = {
            maximized = true,
            opacity = 1,
            screen = 1,
            tag = "9",
        },
    },
}

-- }}}
