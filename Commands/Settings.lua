require("Funcs")
Help = {Help = "Settings [CacheAllMembers/SyncGuilds/AntiGhostPing]",Category = "Utility"}

local function updateSettings()
    writeFile("ClientSettings.txt",encode({cacheAllMembers = ClientSettings.cacheAllMembers;syncGuilds = ClientSettings.syncGuilds;LogMessages = ClientSettings.LogMessages;EmbedMessage = ClientSettings.EmbedMessage;antiGhostPing = ClientSettings.antiGhostPing;}),"Overwrite")
end

local function settings(Message,Arguments)
	if Arguments[1] and Message.author == Client.owner  then
		if lower(Arguments[1]) == "cacheallmembers" then
			ClientSettings.cacheAllMembers = not ClientSettings.cacheAllMembers
			Message:setContent(">>> Cache All Members has been sent to "..tostring(ClientSettings.cacheAllMembers))
			updateSettings()
		elseif lower(Arguments[1]) == "syncguilds" then
			ClientSettings.syncGuilds = not ClientSettings.syncGuilds
			Message:setContent(">>> SyncGuilds has been sent to "..tostring(ClientSettings.syncGuilds))
			updateSettings()
		elseif lower(Arguments[1]) == "antighostping" then 
			if readFile("WebHook.txt") then 
				ClientSettings.antiGhostPing = not ClientSettings.antiGhostPing
				Message:setContent(">>> Anti Ghost Ping has been sent to "..tostring(ClientSettings.antiGhostPing))
				updateSettings()
			else 
				Message:setContent(">>> You need to make a file called WebHook.txt and put a webhook in it to use this command. (It will send Messages that were ghost pings in that channel.)```")
			end
		end
	end
end


commandAdd("settings",settings)
