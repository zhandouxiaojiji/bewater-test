local skynet    = require "skynet"
local conf      = require "conf"
local def       = require "def"
local util      = require "util"
local robot_t   = require "ws.robot_t"
local opcode    = require "def.opcode"
local http      = require "web.http_helper"
local protobuf  = require "protobuf"

local server_name, idx = ...
local clientd

local test_conf = conf.pressure[server_name]

local function create()
    skynet.fork(function()
        local uid
        local c = robot_t.new(string.format("ws://%s:%d", 
            test_conf.host, test_conf.port), "binary")                                                                                                                                                                                             
        function c:user_s2c_data(data)
            --print("&&& user")
            --util.printdump(data)  
        end
        function c:bag_s2c_data(data)
            --print("&&&& bag")
            --util.printdump(data)
        end
        function c:battle_s2c_info(data)
            --print("&&&&&& battle_s2c_info")
        end
        function c:battle_s2c_match_ret(data)
            --print("&&&&& battle_s2c_match")
            --util.printdump(data)
        end
        function c:achieve_s2c_data(data)
            --print("&&&&& achieve_s2c_data")
            --util.printdump(data)
        end
        function c:achieve_s2c_sync(data)
            --print("&&& achieve_s2c_sync")
            --util.printdump(data)
        end
        function c:invite_s2c_data(data)
            --print("&&&&&&&& invite_s2c_data")
            --util.printdump(data)
        end
        function c:battle_s2c_battle_start(data)
            --c:send(opcode.Battle.c2s_emoticon, {sn = 1})
            --c:send(opcode.Gm.c2s_cmd, {cmd = string.format("gamesvr gameover %s 1", uid)})
        end
        function c:battle_s2c_battle_over(data)
            --util.printdump(data)
            --print("&&&&& battle_s2c_battle_over")
            if data.win then
                c:send(opcode.Battle.c2s_double_reward)
            else
                c:send(opcode.Battle.c2s_revert_star)
            end
        end
        
        c:test(function()
            local ret = c:call(opcode.Login.c2s_login, {
                acc = "TEST"..idx,
                login_type = 2,
                version = "1.1.0",
            })  
            uid = ret.uid

            c:wait(100)
            ret = c:call(opcode.Gm.c2s_cmd, {
                --cmd = string.format("gamesvr segment %s 1", uid),
                cmd = string.format("gamesvr invite %s", uid),
            })
            --print(ret.msg)
            ret = c:call(opcode.Invite.c2s_reward, {sn = 3})
            --ret = c:call(opcode.Race.c2s_reward)

            --ret = c:call(opcode.Race.c2s_data)

            ret = c:call(opcode.Shop.c2s_buy, {sn = 201})
            ret = c:call(opcode.User.c2s_change_dress, {
                chessman_type = 7,
                item_id = 3001,
            })

            --ret = c:call(opcode.Checkin.c2s_data)
            --print(ret.can_checkin)
            --print(ret.day)
            --ret = c:call(opcode.Checkin.c2s_reward, {})
            --print(ret.err)

            ret = c:call(opcode.Achieve.c2s_reward, {sn = 20801})

            --ret = c:call(opcode.Battle.c2s_match, {mode = def.BattleMode.RACE})
            
            ret = c:call(opcode.Rank.c2s_data)
            --util.printdump(ret)

            --skynet.sleep(100)
            --ret = c:call(opcode.Battle.c2s_cancel_match)

            --skynet.sleep(700)
            --ret = c:call(opcode.Battle.c2s_data)
            --util.printdump(ret)

          
            --ret = c:call(opcode.Race.c2s_data)
            --util.printdump(ret)
            --ret = c:call(opcode.Race.c2s_reward)
        end)

        idx = idx + 1

    end)
end

local CMD = {}
function CMD.start(count, addr)
    clientd = addr
    for i = 1, count do
        create()    
        local total = skynet.call(clientd, "lua", "total")
        skynet.error(string.format("robot %d start", total))
        skynet.sleep(100)
    end
end

skynet.start(function()
    protobuf.register_file(test_conf.workspace.."/script/def/proto/package.pb")
    skynet.dispatch("lua", function(_, _, cmd, ...)
        local f = assert(CMD[cmd], cmd)
        skynet.ret(f(...))
    end)
end)
