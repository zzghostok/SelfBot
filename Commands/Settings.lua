require("Funcs")
Help = {Help = "Settings [CacheAllMembers/SyncGuilds/AntiGhostPing/canalluse]",Category = "Utility"}

local function updateSettings()
    writeFile("ClientSettings.txt",encode({cacheAllMembers = _G.ClientSettings.cacheAllMembers;syncGuilds = _G.ClientSettings.syncGuilds;LogMessages = _G.ClientSettings.LogMessages;EmbedMessage = _G.ClientSettings.EmbedMessage;antiGhostPing = _G.ClientSettings.antiGhostPing;canAllUse = _G.ClientSettings.canAllUse}),"Overwrite")
end

local function settings(Message,Arguments)
	if Arguments[1] and Message.author == Client.owner  then
		if lower(Arguments[1]) == "cacheallmembers" then
      _G.ClientSettings.cacheAllMembers = not _G.ClientSettings.cacheAllMembers
			reply(Message,">>> Cache All Members has been sent to "..tostring(_G.ClientSettings.cacheAllMembers))
			updateSettings()
		elseif lower(Arguments[1]) == "syncguilds" then
      _G.ClientSettings.syncGuilds = not _G.ClientSettings.syncGuilds
      reply(Message,">>> SyncGuilds has been sent to "..tostring(_G.ClientSettings.syncGuilds))
			updateSettings()
    elseif lower(Arguments[1]) == "canalluse" then 
          _G.ClientSettings.canAllUse = not _G.ClientSettings.canAllUse
          reply(Message,">>> Can All Use has been sent to "..tostring(_G.ClientSettings.canAllUse))
				  updateSettings()
		elseif lower(Arguments[1]) == "antighostping" then 
			if readFile("WebHook.txt") then 
				_G.ClientSettings.antiGhostPing = not _G.ClientSettings.antiGhostPing
				reply(Message,">>> Anti Ghost Ping has been sent to "..tostring(_G.ClientSettings.antiGhostPing))
				updateSettings()
			else 
				reply(Message,">>> You need to make a file called WebHook.txt and put a webhook in it to use this command. (It will send Messages that were ghost pings in that channel.)```")
			end
		end
	end
end


commandAdd("settings",settings)
