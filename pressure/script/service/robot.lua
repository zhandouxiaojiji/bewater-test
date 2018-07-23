local skynet = require "skynet"
local socket = require "websocketclient"

local function send_text(fd, data)
    local fin = true
    local opcode = 0x1
    local finbit, mask_bit
    if fin then
        finbit = 0x80
    else
        finbit = 0
    end

    local frame = string.pack("B", finbit | opcode)
    local l = #data

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

skynet.start(function()		
    --local fd = assert(socket.connect("127.0.0.1", 8653))
    local fd = assert(socket.connect("127.0.0.1", 8002))
    send_text(fd, "hello") 
end)

