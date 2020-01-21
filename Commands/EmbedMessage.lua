require("Funcs")
Help = {Help = "EmbedMessages [On/Off]",Category = "Utility"}

local function embedMessages(Message,Arguments)
	if Arguments[1] and Message.author == Client.owner then 
		if lower(Arguments[1]) == "on" then
			ClientSettings.EmbedMessage = true
			updateSettings()
		elseif lower(Arguments[1]) == "off" then
			ClientSettings.EmbedMessage = false
			updateSettings()
		end
	end
end 

commandAdd("embedmessages",embedMessages)
