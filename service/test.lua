local skynet    = require "skynet"
local gmcmd     = require "gmcmd"
local pressure  = require "pressure"

function test_timer()
    local timer_t = require "util.timer_t"
    local timer = timer_t.new()
    math.randomseed(os.time())
    for i = 1, 1000 do
        local expire = math.random(100, 1000)
        local start_time = skynet.time()
        --print(string.format("create cd expire:%d use:%d", expire, os.time()-start_time))
        timer:timeout(expire, function()
            print(string.format("test cd expire:%s use:%s", expire/100, skynet.time()-start_time))
            --assert(expire == os.time() - start_time)
        end)
        --skynet.sleep(1)
    end
    --[[timer:timeout(100, function()
        print("test1")
    end)
    timer:timeout(200, function()
        print("test2")
    end)
    timer:timeout(300, function()
        print("test3")
    end)]]
end

skynet.start(function()
    --gmcmd.test()
    --pressure.test("animal", 10, 20)
    test_timer()
end)
