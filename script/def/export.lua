local Skynet    = require "skynet"
local Util      = require "util"
local Conf      = require "conf"
local Json      = require "cjson"
local Opcode    = require "def.opcode"
local Errcode   = require "def.errcode"
local Def       = require "def"

local function export_opcode()
    Skynet.error("export_opcode")
    local code2name = Opcode.get_code2name()
    local map = {}
    for code, name in pairs(code2name) do
        map[tostring(code)] = {
            id      = code,
            module  = string.match(name, "^[^.]+"),
            name    = string.match(name, "[^.]+$"),
            session = Opcode.has_session(code),
        }
    end
    local str = Util.format_json(Json.encode(map))
    local file = io.open(Conf.workspace.."/data/ProtoDef.json", "w+")
    file:write(str)
    file:close()
end

local function export_errcode()
    Skynet.error("export_errcode")
    local name2errcode = Errcode.get_name2errcode()
    local map = {}
    for name, code in pairs(name2errcode) do
        map[tostring(code)] = {
            id      = code,
            name    = name,
            desc    = Errcode.describe(code)
        }
    end
    local str = Util.format_json(Json.encode(map))
    local file = io.open(Conf.workspace.."/data/ErrDef.json", "w+")
    file:write(str)
    file:close()
end

local function export_def()
    Skynet.error("export_def")
    local str = Util.format_json(Json.encode(Def))
    local file = io.open(Conf.workspace.."/data/Def.json", "w+")
    file:write(str)
    file:close()
end

if not Conf.remote_path then
    export_opcode()
    export_errcode()
    export_def()
end

