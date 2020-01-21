require("Funcs")
Help = {Help = "Settings [CacheAllMembers/SyncGuilds/AntiGhostPing/CanAllUse/EmbedMessages]",Category = "Utility"}

local function settings(Message,Arguments)
	if Arguments[1] and Message.author == Client.owner  then
		if lower(Arguments[1]) == "cacheallmembers" then
      _G.ClientSettings.cacheAllMembers = not _G.ClientSettings.cacheAllMembers
		elseif lower(Arguments[1]) == "syncguilds" then
      _G.ClientSettings.syncGuilds = not _G.ClientSettings.syncGuilds
    elseif lower(Arguments[1]) == "canalluse" then 
          _G.ClientSettings.canAllUse = not _G.ClientSettings.canAllUse
    elseif lower(Arguments[1]) == "embedmessages" then 
		      _G.ClientSettings.EmbedMessage = not _G.ClientSettings.EmbedMessage
    elseif lower(Arguments[1]) == "logmessages" then 
          _G.ClientSettings.LogMessages = not _G.ClientSettings.LogMessage
		elseif lower(Arguments[1]) == "antighostping" then 
			if readFile("WebHook.txt") then 
				_G.ClientSettings.antiGhostPing = not _G.ClientSettings.antiGhostPing
			else 
				reply(Message,">>> You need to make a file called WebHook.txt and put a webhook in it to use this command. (It will send Messages that were ghost pings in that channel.)```")
			end
		end
      updateSettings()
	end
end

commandAdd("settings",settings)
