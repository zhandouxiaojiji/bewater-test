local skynet    = require "skynet"
local conf      = require "conf"
local wx        = require "auth.wx"
local ws        = require "websocketclient"

skynet.start(function()
    print("what?")
    local fd = ws.connect("127.0.0.1", 8002)
    ws.send(fd, "hello")
    print("ws connect", fd)
end)
