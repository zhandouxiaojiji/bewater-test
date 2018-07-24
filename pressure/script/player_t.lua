local skynet = require "skynet"
local class = require "class"
local json = require "cjson"
local coroutine = require "skynet.coroutine"
local util = require "util"

local player_t = class("player_t")
function player_t:ctor(ws, account)
    self.ws = ws
    self.wait_op = ""
    self.account = account or ""
end

function player_t:send(op, msg)
    print("send", op)
    self.ws:send_text(json.encode({
        id = op,
        msg = msg,
    }))
end

function player_t:call(op, msg)
    self:send(op, msg)
    self.wait_op = op == "HearBeatPing" and op or "S2c"..string.sub(op, 4, -1)
    return coroutine.yield()
end

function player_t:on_open()
    self.co = coroutine.create(function()
        xpcall(function()
            self:test_flow()
        end, function() 
            print(debug.traceback()) 
        end)
    end)
    coroutine.resume(self.co)
end

function player_t:on_message(data)
    data = json.decode(data)
    local op = data.id
    local msg = data.msg
    if self[op] then
        self[op](self, msg)
    end
    if op == self.wait_op then
        coroutine.resume(self.co, msg)
    end
end

function player_t:on_close()

end

function player_t:test_flow()
    print("test_flow start")
    -- 登陆
    local ret = self:call("C2sLogin", {
        WechatData = {"", "", ""},
        LoginType = 2,
        OpenId = self.account,
    })
    self.account = ret.OpenId
    if ret.Status == 0 then
        print("login success!")
    else
        return
    end

    local ret = self:call("C2sRoomCreate", {
        RoomType = "RankMatch",
        RoomCap = 2
    })
    local room_id = ret.RoomId
    print("created room:", room_id)
    
    self:send("C2sFightReady", {RoomId = room_id})
end

function player_t:S2cLogin(data)
end

function player_t:S2cFightStart(data)
    self:send("C2sFightGiveUp", {
        FightId = data.FightId,
    })
end

return player_t
