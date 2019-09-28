require("Funcs")
Help = {Help = "returns the latency of the SelfBot",Category = "Fun"}

local function ping(Message,Arguments)
	local Tick = osclock()
	if _G.ClientSettings.EmbedMessage then
		local Embed = newEmbed()
		Embed:setAuthor("CyBot","http://cyhost.x10.mx/Utilities/RaccAttack.png")
		Embed:setTitle("Pong")
		Embed:setDescription("The time it took to return this message was "..tostring(osclock() - Tick):sub(1,4).."ms")
		Embed:setFooter()
		reply(Message,{embed = Embed})
	else 
		reply(Message,"The time it took to return this message was "..tostring(osclock() - Tick):sub(1,4).."ms")
	end
end

commandAdd("ping",ping)