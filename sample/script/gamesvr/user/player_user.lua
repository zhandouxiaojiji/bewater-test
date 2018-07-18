local skynet = require "skynet"

local player
local M = {}
function M:ctor(ctx)
    player = parent
end

function M:init_by_data(data)
    self.level = data.level or 1
    self.gold = data.gold or 0
end

function M:base_data()
    return {
        level = self.level,
        gold = self.gold,
    }
end

function M:sync_all()
    player:send("S2cPlayerProp", {List = {
        {Id = 1, Cnt = self.level},
        {Id = 2, Cnt = self.gold},
    }})
end

return M
