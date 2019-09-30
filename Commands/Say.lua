require("Funcs")
Help = {Help = "Say anything you want!",Category = "Fun"}

local function say(Message,Arguments)
    if Arguments[1] then
        if ClientSettings.EmbedMessage then 
            local Embed = newEmbed()
            Embed:setAuthor("CyBot","http://cyhost.x10.mx/Utilities/RaccAttack.png")
            Embed:setDescription(concat(Arguments," "))
            Embed:setFooter()
            reply(Message,{embed = Embed})
        else 
            reply(Message,concat(Arguments," "))
        end
    else 
        reply(Message,"You need atleast one Argument (Example: CyBot is the best bot!")
    end 
end

commandAdd("say",say)