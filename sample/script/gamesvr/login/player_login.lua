local skynet = require "skynet"
local db = require "mongo_helper"

local player
local M = {}
function M:ctor(ctx)
    player = ctx
end

function M:login(wx_data, login_type, account)
    player:load_data(account)
    return {
        OpenId 	= "123",
        Msg 	= "OK",
        Uid 	= "",
        Status 	= 0,
    }
end
return M
