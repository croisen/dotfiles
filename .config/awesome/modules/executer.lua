-------------------------------------------------------------------------------
-- Executer: a module that executes programs                                 --
-------------------------------------------------------------------------------

local awful = require("awful")
local executer = {}

local function run_once(cmds)
	for _, cmd in ipairs(cmds) do
        awful.spawn.with_shell("pgrep -u $USER -x " .. cmd .. " > /dev/null || " .. cmd)
	end
end

local function execute(cmd, args)
    -- Welp this ain't good but eh it still fits the style of my config?
    awful.spawn.with_shell("command -v " .. cmd .. " >> /dev/null && " .. cmd .. " " .. args)
end

executer.run_once = run_once
executer.execute  = execute
return executer
