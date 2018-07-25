local skynet    = require "skynet"
local snax      = require "skynet.snax"
local conf      = require "conf"

skynet.start(function()
    --[[for i = 1, 1 do
        local robot = skynet.newservice("ws/robot", "player_t")
        --skynet.call(robot, "lua", "start", "ws://127.0.0.1:8002")
        skynet.call(robot, "lua", "start", "ws://127.0.0.1:8655")
        skynet.sleep(100)
    end]]
    --snax.newservice("robot", "player_t", "ws://127.0.0.1:8566")
    --snax.newservice("robot", "player_t", "ws://127.0.0.1:8002")
    local robot = skynet.newservice("ws/robot", "player_t")
    skynet.call(robot, "lua", "start", "ws://127.0.0.1:8566")
end)
