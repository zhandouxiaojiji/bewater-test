local skynet = require "skynet"
local db = require "mongo_helper"
local conf = require "conf"
local mongo = require "skynet.db.mongo"

skynet.start(function()
    skynet.error("master start!")
    --skynet.newservice("webserver", "test", 8001)
    --skynet.newservice("gate/ws_gate", "gamesvr.player", 8001)
    local db = mongo.client({host = conf.db_host, port = conf.db_port})
    local col = db[conf.db_name].base
    col:safe_insert({fuck="you"})
end)
