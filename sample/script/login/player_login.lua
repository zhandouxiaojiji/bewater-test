local skynet    = require "skynet"
local db        = require "mongo_helper"
local wx        = require "auth.wx"
local aes       = require "auth.aes"
local base64    = require "auth.base64"
local json      = require "cjson"
local util      = require "util"
local def       = require "def"
local conf      = require "conf"

local player
local M = {}
function M:ctor(ctx)
    player = ctx

    self.openid = nil
    self.session_key = nil
end

function M:login(wx_data, login_type, account)
    local wx_code, encry_data, wx_iv = table.unpack(wx_data)
    local ret = nil
    if login_type == def.LoginType.NORMAL then
        account = "test"
    elseif login_type == def.LoginType.WX then
        local resp = wx.check_code(wx_code)
        if resp.errcode then
            ret = false
            print("check_code error", resp.errcode)
        else
            self.session_key = resp.session_key
            self.openid = resp.openid
            account = self.openid
            print("session_key", self.session_key, self.openid)
            local wx_info = aes.decrypt(base64.decode(encry_data), 
                base64.decode(resp.session_key), base64.decode(wx_iv))
            if wx_info then
                wx_info = json.decode(wx_info)
                util.printdump(wx_info)
                ret = true
            else
                ret = false
            end
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
