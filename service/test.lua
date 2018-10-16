local skynet    = require "skynet"
local gmcmd     = require "gmcmd"
local pressure  = require "pressure"

function test_timer()
    local timer_t = require "util.timer_t"
    local timer = timer_t.new()
    math.randomseed(os.time())
    for i = 1, 50000 do
        local expire = math.random(1, 100)
        local start_time = skynet.time()
        timer:delay(expire, function()
            print(string.format("test cd expire:%s use:%s", expire, skynet.time()-start_time))
        end)
        skynet.sleep(1)
    end
   
end

skynet.start(function()
    --gmcmd.test()
    pressure.test("animal", 10, 2000)
    --test_timer()
end)
