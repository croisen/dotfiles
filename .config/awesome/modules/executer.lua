-------------------------------------------------------------------------------
-- Executer: a module that executes programs                                 --
-------------------------------------------------------------------------------

local awful = require("awful")
local executer = {}

local function execute_commands(cmds)
	for _, cmd in ipairs(cmds) do
		-- An ugly way to do this but I use indicator-keylock, welp I also don't know why
		-- it has to be this way
		if cmd == "indicator-keylock" then
			awful.spawn.with_shell("pgrep -u $USER -x indicator-keylo > /dev/null || " .. cmd)
		else
			awful.spawn.with_shell("pgrep -u $USER -x " .. cmd .. " > /dev/null || " .. cmd)
		end
	end
end

executer.execute_commands = execute_commands
return executer