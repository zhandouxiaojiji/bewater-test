local skynet = require "skynet"
local db = require "mongo_helper"
local def = require "def"
local conf = require "conf"

local player = {}
function player:init(gate, sock_id)
    self.gate = gate
    self.sock_id = sock_id

    self:load_module("user",    "gamesvr.user.player_user")
    self:load_module("login",   "gamesvr.login.player_login")
end

function player:load_module(name, m)
    self[name] = require(m)
    self[name]:ctor(player)
end

function player:load_data(account)
    db.connect(conf.db_host, conf.db_port, conf.db_name)
    local data = db.query_player(account, {
        account = account,
        create_time = os.time()
    })
    db.disconnect()

    if not data then
        skynet.error("load player from db error:%s", self.account)
        return false
    end
    self:init_by_data(data)
    return true
end

function player:init_by_data(data)
    self.account = data.account
    self.user:init_by_data(data.user)
end

function player:base_data()
    return {
        account = self.account,
        user    = self.user:base_data() 
    }
end

function player:online()
    self.user:sync_all()
end

function player:send(op, msg)
    assert(self.gate)
    skynet.send(self.gate, "lua", "send", self.sock_id, {
        id = op,
        msg = msg,
    })
end


function player:C2sLogin(data)
    print("login!")
    return player.login:login(data.WechatData, data.LoginType, data.OpenId) 
end

return player
