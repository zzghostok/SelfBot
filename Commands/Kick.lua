require("Funcs")
Help = {Help = "Kicks a User from the guild if you have permissions to do so.",Category = "Moderation"}

local function kickUser(Message,Arguments)
    if inGuild(Message) then 
        if hasAdmin(Message,"Kick") then 
            if Arguments[1] then
                for User in Message.mentionedUsers:iter() do 
                    if Arguments[2] then 
                        remove(Arguments,1)
                        local Embed = newEmbed()
                        Embed:setAuthor("CyBot","http://cyhost.x10.mx/Utilities/RaccAttack.png")
                        Embed:setTitle("Kicked from "..Message.guild.name)
                        Embed:setDescription("Reason: "..concat(Arguments," "))
                        Embed:setFooter()
                        User:send({embed = Embed})
                        modifyUser(Message.guild,User,"Kick",concat(Arguments," "))
                        reply(Message,User.tag.." has been kicked for "..concat(Arguments," "))
                    else
                        local Embed = newEmbed()
                        Embed:setAuthor("CyBot","http://cyhost.x10.mx/Utilities/RaccAttack.png")
                        Embed:setTitle("Kicked from "..Message.guild.name)
                        Embed:setDescription("Reason: Unspecified")
                        Embed:setFooter()
                        User:send({embed = Embed})
                        modifyUser(Message.guild,User,"Kick","Unspecified")
                        reply(Message,User.tag.." has been kicked for Unspecified")
                    end
                end
            else 
                if ClientSettings.EmbedMessage then 
                    local Embed = newEmbed()
                    Embed:setAuthor("CyBot","http://cyhost.x10.mx/Utilities/RaccAttack.png")
                    Embed:setTitle("Kick")
                    Embed:setDescription("You need atleast one Argument (@User)")
                    Embed:setFooter()
                    reply(Message,{embed = Embed})
                else 
                    reply(Message,">>> You need atleast one Argument ")
                end
            end
        else 
            if ClientSettings.EmbedMessage then 
                local Embed = newEmbed()
                Embed:setAuthor("CyBot","http://cyhost.x10.mx/Utilities/RaccAttack.png")
                Embed:setTitle("Kick")
                Embed:setDescription("You need the Kick permission to use this command.")
                Embed:setFooter()
                reply(Message,{embed = Embed})
            else 
                reply(Message,">>> You need the Kick permission to use this command.")
            end
        end
    else 
        local Embed = newEmbed()
        Embed:setAuthor("CyBot","http://cyhost.x10.mx/Utilities/RaccAttack.png")
        Embed:setTitle("Kick")
        Embed:setDescription("You need to use this command in a guild")
        Embed:setFooter()
        reply(Message,{embed = Embed})
    end
end

commandAdd("kick",kickUser)