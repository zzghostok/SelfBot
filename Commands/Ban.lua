require("Funcs")
Help = {Help = "Bans a User from the guild if you have permissions to do so.",Category = "Moderation"}

local function banUser(Message,Arguments)
    if inGuild(Message) then 
        if hasAdmin(Message,"Ban") then 
            if Arguments[1] then
                for User in Message.mentionedUsers:iter() do 
                    if Arguments[2] then 
                        remove(Arguments,1)
                        local Embed = newEmbed()
                        Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
                        Embed:setTitle("Banned from "..Message.guild.name)
                        Embed:setDescription("Reason: "..concat(Arguments," "))
                        Embed:setFooter()
                        User:send({embed = Embed})
                        modifyUser(Message.guild,User,"Ban",concat(Arguments," "))
                        reply(Message,User.tag.." has been banned for "..concat(Arguments," "))
                    else
                        local Embed = newEmbed()
                        Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
                        Embed:setTitle("Banned from "..Message.guild.name)
                        Embed:setDescription("Reason: Unspecified")
                        Embed:setFooter()
                        User:send({embed = Embed})
                        modifyUser(Message.guild,User,"Ban","Unspecified")
                        reply(Message,User.tag.." has been banned for Unspecified")
                    end
                end
            else 
                if ClientSettings.EmbedMessage then 
                    local Embed = newEmbed()
                    Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
                    Embed:setTitle("Ban")
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
                Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
                Embed:setTitle("Ban")
                Embed:setDescription("You need the Ban permission to use this command.")
                Embed:setFooter()
                reply(Message,{embed = Embed})
            else 
                reply(Message,">>> You need the Ban permission to use this command.")
            end
        end
    else 
        local Embed = newEmbed()
        Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
        Embed:setTitle("Ban")
        Embed:setDescription("You need to use this command in a guild")
        Embed:setFooter()
        reply(Message,{embed = Embed})
    end
end

commandAdd("ban",banUser)