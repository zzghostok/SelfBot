require("Funcs")
Help = {Help = "Roll the die get a prize! (The prize is air! I really just wanted to make this rhyme)",Category = "Fun"}

local function Roll(Message,Arguments)
    randomseed(ostime())
    reply(Message,"You rolled the die and got "..math.random(1,6))
end 

commandAdd("roll",Roll)
commandAdd("die",Roll)
commandAdd("dice",Roll)