require("Funcs")
Help = {Help = "EmbedMessages [On/Off]",Category = "Utility"}

local function updateSettings()
    writeFile("ClientSettings.txt",encode({cacheAllMembers = ClientSettings.cacheAllMembers;syncGuilds = ClientSettings.syncGuilds;LogMessages = ClientSettings.LogMessages;EmbedMessage = ClientSettings.EmbedMessage;antiGhostPing = ClientSettings.antiGhostPing;}),"Overwrite")
end

local function embedMessages(Message,Arguments)
	if Arguments[1] then 
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