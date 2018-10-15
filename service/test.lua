local skynet = require "skynet"
local gmcmd = require "gmcmd"
local pressure = require "pressure"

skynet.start(function()
    --gmcmd.test()
    pressure.test("animal", 10, 20)
end)
