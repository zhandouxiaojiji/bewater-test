local skynet    = require "skynet"
local conf      = require "conf"
local wx        = require "auth.wx"
local ws        = require "websocketclient"

skynet.start(function()
    print("what?")
    local fd = ws.connect("127.0.0.1", 8002)
    skynet.timeout(100, function ()
        ws.send(fd, "hello")
    end)

    while true do
        dispatch_package()
        local cmd = socket.readstdin()
        if cmd then
            if cmd == "quit" then
                send_request("quit")
            else
                send_request("get", { what = cmd })
            end
        else
            socket.usleep(100)
        end
    end
    print("ws connect", fd)
end)
