require("Funcs")
Help = {Help = "Set your Playing status to anything you want",Category = "Utility"}

local function setGame(Message,Arguments)
    if Arguments[1] and Message.author == Client.owner then 
        Client:setGame{name = concat(Arguments," "),type = 1,url = "https://www.twitch.tv/cyhatesn"}
    else 
        reply(Message,">>> You need an Argument to use this command (Example: I am AFK)")
    end
end

commandAdd("setgame",setGame)
commandAdd("setstatus",setgame)
