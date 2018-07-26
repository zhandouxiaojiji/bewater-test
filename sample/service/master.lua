local skynet    = require "skynet"
local conf      = require "conf"
local wx        = require "auth.wx"
local sname     = require "sname"

skynet.start(function()
    skynet.error("gamed start!")
    sname.start(sname.WEB)

    wx.init(conf.appid, conf.appsecret)
    local game = skynet.newservice("ws/watchdog", "gamesvr", "player")
    skynet.call(game, "lua", "start", {port = 8002}, 1)
end)
