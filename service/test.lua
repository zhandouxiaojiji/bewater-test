local skynet    = require "skynet"
local gmcmd     = require "gmcmd"
local pressure  = require "pressure"

function test_timer()
    local timer = require "timer"
    local ti = timer.create()
    math.randomseed(os.time())
    for i = 1, 50000 do
        local expire = math.random(1, 100)
        local start_time = skynet.time()
        ti:delay(expire, function()
            print(string.format("test cd expire:%s use:%s", expire, skynet.time()-start_time))
        end)
        skynet.sleep(1)
    end
   
end

skynet.start(function()
    --gmcmd.test()
    --pressure.test("animal", 10, 2000)
    test_timer()
end)
