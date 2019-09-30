require("Funcs")
Help = {Help = "Rock Paper scissors",Category = "Fun"}

local function rps(Message,Arguments)
local RpsTable = {"rock","paper","scissors"}
randomseed(ostime())
    if Arguments[1] then
        if Arguments[1]:lower() == "rock" or Arguments[1]:lower() == "paper" or Arguments[1]:lower() == "scissors" then
            if ClientSettings.EmbedMessage then
                local Embed = newEmbed()
                Embed:setAuthor("CyBot","http://cyhost.x10.mx/Utilities/RaccAttack.png")
                Embed:setTitle("CoinFlip")
                Embed:setDescription("Your answer: "..Arguments[1].."\nThe Bots answer: "..RpsTable[random(1,#RpsTable)])
                Embed:setFooter()
                reply(Message,{embed = Embed})
            else 
                reply(Message,"Your answer: "..Arguments[1].."\nThe Bots answer: "..RpsTable[random(1,#RpsTable)])
            end
        else
            reply(Message,">>> That is an invalid Argument Correct Arguments: (Rock/Paper/Scissors)")
        end
    else
        reply(Message,">>> You need an Argument to use this command (Rock/Paper/Scissors)")
    end
end

commandAdd("rps",rps)
commandAdd("rockpaperscissors",rps)