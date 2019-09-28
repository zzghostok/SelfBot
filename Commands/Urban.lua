require("Funcs")
Help = {Help = "defines a word for you",Category = "Utility"}

function urban(Message,Arguments)
	if Arguments[1] then 
		local _,Body = request("Get","https://api.urbandictionary.com/v0/define?term="..concat(Arguments,"%23"))
		local New = decode(Body)
		if New['list'] and New['list'][1] and New['list'][1]['definition'] then 
			reply(Message,"**Definition:** ```"..tostring(New['list'][1]['definition']):sub(1,500).."```\n**Example:** ```"..New['list'][1]['example']:sub(1,500).."```","Urban Dictionary: "..concat(Arguments," "),"NoHead")
		else
			reply(Message,"```css\nUrban Dictionary: "..concat(Arguments," ").." is not a word.```")
		end
	else 
		reply(Message,"```css\nTo use this command you need to do urban [Word].```")
	end
end

commandAdd("urban",urban)
commandAdd("urbandictionary",urban)
