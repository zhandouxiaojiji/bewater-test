local Skynet    = require "skynet"
require "skynet.manager"
local Timer     = require "timer"

local ti = Timer.create()
math.randomseed(os.time())
for i = 1, 50000 do
    local expire = math.random(1, 100)
    local start_time = Skynet.time()
    ti:delay(expire, function()
        print(string.format("test cd expire:%s use:%s", expire, Skynet.time()-start_time))
    end)
    Skynet.sleep(1)
end
