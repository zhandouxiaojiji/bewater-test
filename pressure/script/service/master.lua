local skynet    = require "skynet"
local conf      = require "conf"

skynet.start(function()
    for i = 1, 16 do
        local robot = skynet.newservice("ws/robot", "player_t")
        --skynet.call(robot, "lua", "start", "ws://127.0.0.1:8002")
        skynet.call(robot, "lua", "start", "ws://127.0.0.1:8655")
        skynet.sleep(100)
    end

    --[[local player_t = require "player_t"
    local player = player_t.new()
    player:on_open()]]
end)
