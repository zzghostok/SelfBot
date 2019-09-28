require("Funcs")
Help = {Help = "Flip the coin",Category = "Fun"}

local function coinFlip(Message,Arguments)
    local FlipTable = {"Heads","Tails"}
    randomseed(ostime())
    if ClientSettings.EmbedMessage then 
        local Embed = newEmbed()
        Embed:setAuthor("CyBot","http://cyhost.x10.mx/Utilities/RaccAttack.png")
        Embed:setTitle("CoinFlip")
        Embed:setDescription("You flipped the coin and got "..FlipTable[random(1,#FlipTable)])
        Embed:setFooter()
        reply(Message,{embed = Embed})
    else 
        reply(Message,"You flipped the coin and got "..FlipTable[random(1,#FlipTable)])
    end
end

commandAdd("coinflip",coinFlip)
commandAdd("flip",coinFlip)
