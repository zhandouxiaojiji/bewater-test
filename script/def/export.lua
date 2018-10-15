local skynet    = require "skynet"
local util      = require "util"
local conf      = require "conf"
local json      = require "cjson"
local opcode    = require "def.opcode"
local errcode   = require "def.errcode"
local prop      = require "prop"
local def       = require "def"

function export_opcode()
    skynet.error("export_opcode") 
    local code2name = opcode.get_code2name()
    local map = {}
    for code, name in pairs(code2name) do
        map[tostring(code)] = {
            id      = code,
            module  = string.match(name, "^[^.]+"),
            name    = string.match(name, "[^.]+$"),
            session = opcode.has_session(code),
        }
    end
    local str = util.format_json(json.encode(map))
    local file = io.open(conf.workspace.."/data/ProtoDef.json", "w+")
    file:write(str)
    file:close()
end

function export_errcode()
    skynet.error("export_errcode") 
    local name2errcode = errcode.get_name2errcode()
    local map = {}
    for name, code in pairs(name2errcode) do
        map[tostring(code)] = {
            id      = code,
            name    = name,
            desc    = errcode.describe(code)
        }
    end
    local str = util.format_json(json.encode(map))
    local file = io.open(conf.workspace.."/data/ErrDef.json", "w+")
    file:write(str)
    file:close()
end

function export_def()
    skynet.error("export_def")
    local str = util.format_json(json.encode(def))
    local file = io.open(conf.workspace.."/data/Def.json", "w+")
    file:write(str)
    file:close()
end

if not conf.remote_path then
    export_opcode()
    export_errcode()
    export_def()
end

