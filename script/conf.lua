local skynet = require "skynet"
local workspace = skynet.getenv('workspace')
local conf = {
    workspace = workspace,

    proj = "client",
    dest = "测试节点",

    webconsole = {
        host = "game.kaizhan8.com",
        port = 8890,
    },

    pressure = {
        animal = {
            service     = "robot1",
            host        = "game.kaizhan8.com",
            port        = 8831,
            acc         = "TEST",
            workspace   = workspace.."/../animal",
            version     = "1.1.0",
        }, 
    },
   
}
return conf
