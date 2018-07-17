local player = {}
function player:load(name, m)
    self[name] = require(m)
    self[name]:ctor(player)
end

player:load("login", "gamesvr.login.player_login")

function player:C2sLogin(data)
    print("login!")
    return {
        OpenId 	= "",
        Msg 	= "",
        Uid 	= "",
        Status 	= 1,
    }
end

return player
