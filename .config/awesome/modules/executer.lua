-------------------------------------------------------------------------------
-- Executer: a module that executes programs                                 --
-------------------------------------------------------------------------------

local awful = require("awful")
local executer = {}

local function execute_commands(cmds)
	for _, cmd in ipairs(cmds) do
		awful.util.spawn_with_shell("pgrep -u $USER -x " .. cmd .. " > /dev/null || " .. cmd)
	end
end

executer.execute_commands = execute_commands
return executer