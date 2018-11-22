local Skynet    = require "skynet"
local Conf      = require "conf"
local Gm        = require "gm"

Skynet.start(function()
    -- 后台服务
    local c = Skynet.newservice("ws/watchdog", "webconsole.webconsole", "webconsole.player_t")
    Skynet.call(c, "lua", "start", {
        port    = Conf.webconsole.port,
        preload = 1,
    })

    Gm.add_gmcmd("test", "gmcmd")
end)
