local skynet = require "skynet"

skynet.start(function()
    skynet.error("master start!")
    --skynet.newservice("webserver", "test", 8001)
    skynet.newservice("ws_server", "gamesvr.player", 8001)
end)
