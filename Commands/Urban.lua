require("Funcs")
Help = {Help = "defines a word for you",Category = "Utility"}

function urban(Message,Arguments)
	if Arguments[1] then 
		local _,Body = request("Get","https://api.urbandictionary.com/v0/define?term="..concat(Arguments,"%23"))
		local New = decode(Body)
		if New['list'] and New['list'][1] and New['list'][1]['definition'] then
			if ClientSettings.EmbedMessage then
				local Embed = newEmbed()
                Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
				Embed:setTitle("Word: "..concat(Arguments," "))
				Embed:setDescription("**Definition: **```"..tostring(New['list'][1]['definition']):sub(1,500).."```\n**Example:** ```"..tostring(New['list'][1]['example']):sub(1,500).."```")
				Embed:setFooter()
                reply(Message,{embed = Embed})
			else
				reply(Message,">>> **Word: **"..concat(Arguments," ").."\n\n**Definition:** ```"..tostring(New['list'][1]['definition']):sub(1,500).."```\n**Example:** ```"..New['list'][1]['example']:sub(1,500).."```","Urban Dictionary: "..concat(Arguments," "))
			end
		else
			reply(Message,">>> Urban Dictionary: "..concat(Arguments," ").." is not a word.")
		end
	else 
		reply(Message,">>> To use this command you need to do urban [Word].")
	end
end

commandAdd("urban",urban)
commandAdd("urbandictionary",urban)
