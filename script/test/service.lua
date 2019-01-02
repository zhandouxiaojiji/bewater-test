local skynet = require "skynet"
local service = require "skynet.service"

skynet.start(function()
    print "test"
    skynet.newservice("testservice")
end)

--[[
local a = 1
skynet.init(function()
    service.new("testservice", function()
        local skynet = require "skynet"
        skynet.start(function()
            print(a)
            print "hello"
        end)
    end)
end)
]]
