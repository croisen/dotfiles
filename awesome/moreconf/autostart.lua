local awful = require("awful")

-- {{{ Autostart windowless processes

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(
            string.format(
                "pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd
            )
        )
    end
end

run_once({ "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" })
run_once({ "picom" })
run_once({ "xset -b -dpms s off" })

-- }}}
