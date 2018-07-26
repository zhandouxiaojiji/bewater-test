local skynet = require "skynet"
local json = require "cjson"
local ws_client = require "ws.client"

local player
local ws
local recv

function init(player_t, url, acc)
    player_t = require(player_t)
    ws = ws_client:new()
    ws:connect(string.format(url))
    player = player_t.new(ws, acc)
    player:on_open()
    skynet.fork(function()
        while true do
            while ws do
                local ret = ws:recv_frame()
                if ret then
                    print("recv", ret)
                    player:on_message(ret)
                else
                    break
                end
            end
            if ws then
                --player:ping()
            end
            skynet.sleep(100)
        end
    end)
end

function exit(...)
    print ("robot exit:", ...)
end

function accept.stop()
    ws:close()
end
