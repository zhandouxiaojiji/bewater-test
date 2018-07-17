local util = require "util"

local CMD = {}
function CMD.C2sLogin(data)
    print("login!")
    return {
	OpenId 	= "",
	Msg 	= "",
	Uid 	= "",
	Status 	= 1,
    }
end

return CMD
