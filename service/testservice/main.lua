local Skynet = require "skynet"
local Lock = require "lock"

Skynet.start(function()
    local lock = Lock.new()
    Skynet.dispatch("lua", function(_, _, cmd)
        lock:lock() 
        print "step1"
        Skynet.sleep(100)
        print "step2"
        lock:unlock()
    end)
end)
