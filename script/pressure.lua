local skynet    = require "skynet"
local conf      = require "conf"
local protobuf  = require "protobuf"

require "bash"

local M = {}
function M.test(server_name, a, r)
    local c = assert(conf.pressure[server_name], server_name)
    bash("cp -r %s/script/def %s/script", c.workspace, conf.workspace) 
    bash("cp -r %s/script/def.lua %s/script", c.workspace, conf.workspace) 

    local total = 0
    local total_delay = 0
    local delay_count = 0
    local max_delay = 0
    local online = 0
    skynet.dispatch("lua", function(_, _, cmd, arg1)
        if cmd == "total" then
            total = total + 1
            skynet.ret(skynet.pack(total))
        elseif cmd == "delay" then
            local delay = arg1
            total_delay = total_delay + delay
            delay_count = delay_count + 1 
            max_delay = delay > max_delay and delay or max_delay
            skynet.error("在线", online,  "次数", delay_count, "平均延时:", total_delay/delay_count,"最高延时:", max_delay)
        elseif cmd == "online" then
            if arg1 == "add" then
                online = online + 1
            elseif arg1 == "sub" then
                online = online - 1
            end
        end
    end)

    local list = {}
    for i = 1, a do
        table.insert(list, skynet.newservice(c.service, server_name, r*i))
    end
    for i = 1, a do
        skynet.fork(function()
            skynet.call(list[i], "lua", "start", r, skynet.self())
        end)
        skynet.sleep(10)
    end

end

return M
