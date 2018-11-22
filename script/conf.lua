local skynet = require "skynet"
local workspace = skynet.getenv('workspace')
local conf = {
    workspace = workspace,

    proj = "test",
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

    mysql = {
        host = "127.0.0.1",
        port = 3306,
        name = "test",
        user = "mysql",
    },

    mongo = {
        host = "127.0.0.1",
        port = 19999,
        name = "test",
    },

    -- 通用节点
    cluster = {
        monitor = "127.0.0.1:19800",
        share   = "127.0.0.1:19801",
        test    = "127.0.0.1:19802",
    },
    clustername = skynet.getenv "clustername",
}
return conf
