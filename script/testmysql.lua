local Mysql = require "db.mysql_helper"
local Util = require "util"
local M = {}
function M.query1()
    local tid = 1111
    local ret = Mysql.query(string.format('select * from payment where tid="%s"', tid))
    Util.printdump(ret)
end

return M
