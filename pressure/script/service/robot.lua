local skynet = require "skynet"
local socket = require "websocketclient"

local function send_package(fd, pack)
	-- local package = string.pack(">s2", pack)
	socket.send(fd, pack)
end

local function recv_package(fd)
	local r , istimeout= socket.recv(fd, 100)
	if not r then
		return nil
	end
	if r == ""  and istimeout == 0 then
		error "Server closed"
	end
	return r
end


local function send_request(fd, str)
    socket.send(fd, string.pack(">s2", str))
    --socket.send(fd, str)
end

local last = ""

local function print_request(name, args)
	print("REQUEST", name)
	if args then
		for k,v in pairs(args) do
			print(k,v)
		end
	end
end

local function print_response(session, args)
	print("RESPONSE", session)
	if args then
		for k,v in pairs(args) do
			print(k,v)
		end
	end
end

local function print_package(t, ...)
	if t == "REQUEST" then
		print_request(...)
	else
		assert(t == "RESPONSE")
		print_response(...)
	end
end

local function dispatch_package(fd)
	while true do
		local v
		v = recv_package(fd)
		if not v  or v == "" then
			break
		end

		print_package(host:dispatch(v))
	end
end

skynet.start(function()		
    local fd = assert(socket.connect("127.0.0.1", 8653))
    send_request(fd, "shake")
    while true do
        dispatch_package(fd)
        local cmd = socket.readstdin()
        if cmd then
            if cmd == "quit" then
                send_request("quit")
            else
                send_request("get", { what = cmd })
            end
        else
            socket.usleep(100)
        end
    end
end)

