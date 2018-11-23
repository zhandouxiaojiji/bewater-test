local Skynet = require "skynet"
local Service = require "skynet.service"

Skynet.start(function()
    print "test"
end)

local a = 1
Skynet.init(function()
    Service.new("testservice", function()
        local Skynet = require "skynet"
        Skynet.start(function()
            print(a)
            print "hello"
        end)
    end)
end)

