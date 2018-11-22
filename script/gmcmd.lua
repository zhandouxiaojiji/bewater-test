local Pressure = require "pressure"

local M = {}
function M.test()
    print("test")
    return "test"
end

function M.pressure(server_name, agent_count, player_count)
    Pressure.test(server_name, agent_count, player_count)
end

return M
