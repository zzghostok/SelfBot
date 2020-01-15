require("Funcs")
Help = {Help = "Stops the SelfBot",Category = "Utility"}

local function StopBot(Message,Arguments)
    if Message.author == Client.owner then 
        reply(Message,"Goodbye")
        Client:stop()
    end
end

commandAdd("stopbot",StopBot)
commandAdd("stop",StopBot)
