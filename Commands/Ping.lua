require("Funcs")
Help = {Help = "returns the latency of the SelfBot",Category = "Fun"}

local function ping(Message,Arguments)
	local Tick = os.clock()
	if _G.ClientSettings.EmbedMessage then
		local Embed = newEmbed()
		Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
		Embed:setTitle("Pong")
		Embed:setDescription("The time it took to return this message was "..tostring(os.clock() - Tick).."ms")
		Embed:setFooter()
		reply(Message,{embed = Embed})
	else 
		reply(Message,">>> The time it took to return this message was "..tostring(os.clock() - Tick).."ms")
	end
end

commandAdd("ping",ping)