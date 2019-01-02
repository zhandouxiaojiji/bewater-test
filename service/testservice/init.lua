local skynet = require "skynet"
local test1 = require "test1"

skynet.start(function()
    print("test1", test1)    
end)
