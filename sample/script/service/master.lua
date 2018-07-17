local skynet = require "skynet"

skynet.start(function()
    skynet.error("master start!")
    --skynet.newservice("webhttp_server", "test", 8001)
    skynet.newservice("websocket_server", "web_handler", "gamesvr.net_handler", 8001)
end)
