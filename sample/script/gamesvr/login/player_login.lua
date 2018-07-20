local skynet    = require "skynet"
local db        = require "mongo_helper"
local wechat    = require "auth.wechat"
local json      = require "cjson"
local aes       = require "aes"
local base64    = require "base64"
local util      = require "util"
local def       = require "def"
local conf      = require "conf"

local player
local M = {}
function M:ctor(ctx)
    player = ctx
end

function M:login(wx_data, login_type, account)
    local wx_code, encry_data, wx_iv = table.unpack(wx_data)
    local ret = nil
    if login_type == def.LoginType.NORMAL then
        account = "test"
    elseif login_type == def.LoginType.WX then
        local ret, resp = wechat.check_code(wx_code, conf.appid, conf.appsecret)
        resp = json.decode(resp)
        if resp.errcode then
            ret = false
        end
        local err, wx_info = aes.decrypt(base64.decode(encry_data), 
            base64.decode(resp.session_key), base64.decode(wx_iv))
        if err == 0 then
            wx_info = json.decode(wx_info)
            util.printdump(wx_info)
        end
    elseif login_type == def.LoginType.WX_RECONNECT then
        -- todo
    else
        error("login type error")
    end

    if not ret then
        return {
            OpenId 	= "",
            Msg 	= "NO",
            Uid 	= "",
            Status 	= 0,
        }
    end

    player:load_data(account)
    return {
        OpenId 	= account,
        Msg 	= "OK",
        Uid 	= "",
        Status 	= 0,
    }
end
return M
