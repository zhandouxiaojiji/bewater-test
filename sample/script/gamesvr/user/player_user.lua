local skynet    = require "skynet"
local util      = require "util"
local wx        = require "auth.wx"

local player
local M = {}
function M:ctor(ctx)
    player = ctx
end

function M:init_by_data(data)
    data = data or {}
    self.level = data.level or 1
    self.gold = data.gold or 0
end

function M:base_data()
    return {
        level = self.level,
        gold = self.gold,
    }
end

function M:set_user_storage()
    local ret = wx.set_user_storage(player.login.openid, player.login.session_key, {
        score = 100,
        gold = 300,
    }) 
    util.printdump(ret)
end

function M:sync_all()
    player:send("S2cPlayerProp", {List = {
        {Id = 1, Cnt = self.gold},
        {Id = 2, Cnt = self.level},
    }})
end

return M
