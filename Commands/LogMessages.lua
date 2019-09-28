Help = {Help = "LogMessages [On/Off]",Category = "Utility"}

local function updateSettings()
    writeFile("ClientSettings.txt",encode({cacheAllMembers = ClientSettings.cacheAllMembers;syncGuilds = ClientSettings.syncGuilds;LogMessages = ClientSettings.LogMessages;EmbedMessage = ClientSettings.EmbedMessage;antiGhostPing = ClientSettings.antiGhostPing;}),"Overwrite")
end

local function logMessages(Message,Arguments)
	if Arguments[1] then
		if lower(Arguments[1]) == "on" then 
			ClientSettings.LogMessages = true
			updateSettings()
		elseif lower(Arguments[1]) == "off" then 
			ClientSettings.LogMessages = false
			updateSettings()
		end
	end
end 

commandAdd("logmessages",logMessages)
