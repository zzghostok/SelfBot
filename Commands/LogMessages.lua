Help = {Help = "LogMessages [On/Off]",Category = "Utility"}

local function logMessages(Message,Arguments)
	if Arguments[1] and Message.author == Client.owner then
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
