local skynet    = require "skynet"
local conf      = require "conf"
local gm        = require "gm"

skynet.start(function()
    -- 后台服务
    local c = skynet.newservice("ws/watchdog", "webconsole.webconsole", "webconsole.player_t")
    skynet.call(c, "lua", "start", {
        port    = conf.webconsole.port,
        preload = 1,
    })

    gm.add_gmcmd("test", "gmcmd")
end)
