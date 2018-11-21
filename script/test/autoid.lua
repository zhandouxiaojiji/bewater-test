local Skynet    = require "skynet.manager"
local Cluster   = require "skynet.cluster"
local Conf      = require "conf"

local Share     = require "share.init"
local Autoid    = require "share.autoid"

Skynet.start(function()
    Cluster.reload(Conf.cluster)
    Cluster.open(Conf.clustername)
    Share.init()
    print("test Autoid", Autoid.create())
end)

