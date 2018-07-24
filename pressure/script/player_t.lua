local skynet = require "skynet"
local class = require "class"
local json = require "cjson"
local coroutine = require "skynet.coroutine"
local util = require "util"

local player_t = class("player_t")
function player_t:ctor(ws)
    self.ws = ws
    self.wait_op = ""
end

function player_t:send(op, msg)
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
    print("on_open", self.ws)
    self.co = coroutine.create(function()
        self:test_flow()
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
    print("testing", i)
    local ret = self:call("C2sLogin", {
        WechatData = {"", "", ""},
        LoginType = 2,
        OpenId = "11459",
    })
    print("done &&&&&&&&&&&&&&&&", ret.Status)
end

function player_t:S2cLogin(data)
    print("S2cLogin&&&&&&", data.Status)
end


return player_t
