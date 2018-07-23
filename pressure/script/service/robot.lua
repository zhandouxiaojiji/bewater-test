local skynet = require "skynet"
local socket = require "websocketclient"
local ws_proto = require "ws.proto"

local function send_text(fd, data)
    local fin = true
    local opcode = 0x1
    local finbit, mask_bit
    local mask_outgoing = true
    if fin then
        finbit = 0x80
    else
        finbit = 0
    end

    local frame = string.pack("B", finbit | opcode)
    local l = #data
    print("payload data:", l)

    if mask_outgoing then
        mask_bit = 0x80
    else
        mask_bit = 0
    end

    if l < 126 then
        frame = frame .. string.pack("B", l | mask_bit)
    elseif l < 0xFFFF then
        frame = frame .. string.pack(">BH", 126 | mask_bit, l)
    else 
        frame = frame .. string.pack(">BL", 127 | mask_bit, l)
    end

    frame = frame .. data

    socket.send(fd, frame)
end

local function send_text2(fd, data)
    local frame = ws_proto.build_frame(true, 0x1, #data, data, true)
    socket.send(fd, frame)
end

skynet.start(function()		
    --local fd = assert(socket.connect("127.0.0.1", 8653))
    local fd = assert(socket.connect("127.0.0.1", 8002))
    --send_text(fd, '{"grant_type":"client_credential","appid":"wx6c83f709500b39a8","secret":"95f6bbe6a6a03226c01fa8a5ae276280"}') 
    local str = ""
    for i = 1, 97 do
        str = str .. "a"
    end
    str = str .. "bbb"
    send_text2(fd, str)
end)

