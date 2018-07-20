local skynet    = require "skynet"
local conf      = require "conf"
local wx        = require "auth.wx"

skynet.start(function()
    skynet.error("master start!")
    --skynet.newservice("webserver", "test", 8001)

    wx.init(conf.appid, conf.appsecret)
    skynet.newservice("gate/ws_gate", "gamesvr.player", 8001)
end)
