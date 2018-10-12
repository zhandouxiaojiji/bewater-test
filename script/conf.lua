local skynet = require "skynet"
local conf = {
    workspace = skynet.getenv('workspace'),

    proj = "client",
    dest = "测试节点",

    webconsole = {
        host = "game.kaizhan8.com",
        port = 8890,
    },
}
return conf
