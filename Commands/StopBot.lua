require("Funcs")
Help = {Help = "Stops the SelfBot",Category = "Utility"}

local function StopBot(Message,Arguments)
    reply(Message,"Goodbye nigger")
    Client:stop()
end

commandAdd("stopbot",StopBot)
commandAdd("stop",StopBot)