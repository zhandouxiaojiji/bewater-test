local Skynet = require "skynet"
require "schedule"
Skynet.start(function()
    Skynet.newservice("gm") 
end)

