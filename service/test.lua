local Skynet    = require "skynet"
require "skynet.manager"
--local gmcmd     = require "gmcmd"
--local pressure  = require "pressure"
--local testmysql = require "testmysql"

function test_timer()
    local timer = require "timer"
    local ti = timer.create()
    math.randomseed(os.time())
    for i = 1, 50000 do
        local expire = math.random(1, 100)
        local start_time = Skynet.time()
        ti:delay(expire, function()
            print(string.format("test cd expire:%s use:%s", expire, Skynet.time()-start_time))
        end)
        Skynet.sleep(1)
    end
end

function test_service()
    local test = Skynet.newservice("testservice")
    Skynet.send(test, "lua")
    Skynet.send(test, "lua")
end

function test_lock()
     local test = Skynet.newservice("testservice")
    Skynet.send(test, "lua")
    Skynet.send(test, "lua")
end

Skynet.start(function()
    print "welcome to bewater"
    
    test_lock()
    --gmcmd.test()
    --pressure.test("animal", 10, 2000)
    --test_timer()
    --testmysql.query1()
end)
