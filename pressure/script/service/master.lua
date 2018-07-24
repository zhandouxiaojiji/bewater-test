local skynet    = require "skynet"
local conf      = require "conf"

skynet.start(function()
    local robot = skynet.newservice("ws/robot", "player_t") 
    for i = 1, 1 do
        --skynet.call(robot, "lua", "new", "ws://127.0.0.1:8002")
        skynet.call(robot, "lua", "new", "ws://127.0.0.1:8655")
    end

    --[[local player_t = require "player_t"
    local player = player_t.new()
    player:on_open()]]
end)
