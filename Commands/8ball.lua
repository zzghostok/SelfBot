require("Funcs")
Help = {Help = "8ball, Ask it any question and it will answer it!",Category = "Fun"}

local function sendAnswer(Message,Arguments)
local AnswerTable = {"yes.","no.","maybe.","I can't answer right now."}
    if Arguments[1] then
        if ClientSettings.EmbedMessage then
            local Embed = newEmbed()
            Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
            Embed:setTitle("8ball")
            Embed:setDescription("8ball says "..AnswerTable[random(1,#AnswerTable)])
            Embed:setFooter()
            reply(Message,{embed = Embed})
        else
            reply(Message,">>> 8ball says "..AnswerTable[random(1,#AnswerTable)])
        end
    else 
        if ClientSettings.EmbedMessage then 
            local Embed = newEmbed()
            Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
            Embed:setTitle("8ball")
            Embed:setDescription("You need to have an Argument (Question) to use this command.")
            Embed:setFooter()
            reply(Message,{embed = Embed})
        else
            reply(Message,">>> CyBot\nYou need to have an Argument (Question) to use this command.")
        end
    end 
end 


commandAdd("8ball",sendAnswer)