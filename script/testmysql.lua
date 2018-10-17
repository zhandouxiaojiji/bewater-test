local mysql = require "db.mysql_helper"
local util = require "util"
local M = {}
function M.query1()
    local tid = 1111
    local ret = mysql.query(string.format('select * from payment where tid="%s"', tid))
    util.printdump(ret)
end

return M
