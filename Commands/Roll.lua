require("Funcs")
Help = {Help = "Roll the die get a prize! (The prize is air! I really just wanted to make this rhyme)",Category = "Fun"}

local function Roll(Message,Arguments)
    randomseed(ostime())
    if ClientSettings.EmbedMessage then 
        local Embed = newEmbed()
        Embed:setAuthor("CyBot","http://cyhost.x10.mx/Utilities/RaccAttack.png")
        Embed:setTitle("Roll")
        Embed:setDescription("You rolled the die and got "..random(1,6))
        Embed:setFooter()
        reply(Message,{embed = Embed})
    else 
        reply(Message,">>> You rolled the die and got "..random(1,6))
    end
end 

commandAdd("roll",Roll)
commandAdd("die",Roll)
commandAdd("dice",Roll)