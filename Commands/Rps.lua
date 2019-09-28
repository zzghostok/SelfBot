require("Funcs")
Help = {Help = "Rock Paper scissors",Category = "Fun"}

local function rps(Message,Arguments)
local RpsTable = {"rock","paper","scissors"}
randomseed(ostime())
    if Arguments[1] then
        if Arguments[1]:lower() == "rock" or Arguments[1]:lower() == "paper" or Arguments[1]:lower() == "scissors" then 
            reply(Message,"Your answer: "..Arguments[1].."\nThe Bots answer: "..RpsTable[random(1,#RpsTable)])
        else
            reply(Message,"You need an Argument to use this command (Rock/Paper/Scissors)")
        end
    end
end

commandAdd("rps",rps)
commandAdd("rockpaperscissors",rps)