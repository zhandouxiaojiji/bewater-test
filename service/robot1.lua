local Skynet    = require "skynet"
local Conf      = require "conf"
local Util      = require "util"
local Robot     = require "ws.robot_t"
local Opcode    = require "def.opcode"
local Protobuf  = require "protobuf"

local server_name, idx = ...
local clientd

local test_conf = Conf.pressure[server_name]

local function create()
    Skynet.fork(function()
        local uid
        local c = Robot.new(string.format("ws://%s:%d",
            test_conf.host, test_conf.port), "binary")

        c.test(function()
            local ret = c:call(Opcode.Login.c2s_login, {
                acc = "TEST"..idx,
                login_type = 2,
                version = "1.1.0",
            })
            uid = ret.uid

            c:wait(100)
            c:call(Opcode.Gm.c2s_cmd, {
                --cmd = string.format("gamesvr segment %s 1", uid),
                cmd = string.format("gamesvr invite %s", uid),
            })
            --print(ret.msg)
            c:call(Opcode.Invite.c2s_reward, {sn = 3})
            --ret = c:call(Opcode.Race.c2s_reward)

            --ret = c:call(Opcode.Race.c2s_data)

            c:call(Opcode.Shop.c2s_buy, {sn = 201})
            c:call(Opcode.User.c2s_change_dress, {
                chessman_type = 7,
                item_id = 3001,
            })

            --ret = c:call(Opcode.Checkin.c2s_data)
            --print(ret.can_checkin)
            --print(ret.day)
            --ret = c:call(Opcode.Checkin.c2s_reward, {})
            --print(ret.err)

            c:call(Opcode.Achieve.c2s_reward, {sn = 20801})

            ret = c:call(Opcode.Rank.c2s_data)
            Util.printdump(ret)

            --Skynet.sleep(100)
            --ret = c:call(Opcode.Battle.c2s_cancel_match)

            --Skynet.sleep(700)
            --ret = c:call(Opcode.Battle.c2s_data)
            --Util.printdump(ret)

            --ret = c:call(Opcode.Race.c2s_data)
            --Util.printdump(ret)
            --ret = c:call(Opcode.Race.c2s_reward)
        end)

        idx = idx + 1

    end)
end

local CMD = {}
function CMD.start(count, addr)
    clientd = addr
    for _ = 1, count do
        create()
        local total = Skynet.call(clientd, "lua", "total")
        Skynet.error(string.format("robot %d start", total))
        Skynet.sleep(100)
    end
end

Skynet.start(function()
    Protobuf.register_file(test_conf.workspace.."/script/def/proto/package.pb")
    Skynet.dispatch("lua", function(_, _, cmd, ...)
        local f = assert(CMD[cmd], cmd)
        Skynet.ret(f(...))
    end)
end)
