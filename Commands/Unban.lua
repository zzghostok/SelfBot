require("Funcs")
Help = {Help = "Bans a User from the guild if you have permissions to do so.",Category = "Moderation"}

local function unbanUser(Message,Arguments)
    if inGuild(Message) then 
        if hasAdmin(Message,"Unban") then 
            if Arguments[1] then
				modifyUser(Message.guild,concat(Arguments," "),"Unban")
                reply(Message,">>> They have been unbanned (If you used their Discord Id)")
            else 
                if ClientSettings.EmbedMessage then 
                    local Embed = newEmbed()
                    Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
                    Embed:setTitle("Unban")
                    Embed:setDescription("You need atleast one Argument (Example: Unban 621984141428129797")
                    Embed:setFooter()
                    reply(Message,{embed = Embed})
                else 
                    reply(Message,">>> You need atleast one Argument (Example: Unban 621984141428129797)")
                end
            end
        else 
            if ClientSettings.EmbedMessage then 
                local Embed = newEmbed()
                Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
                Embed:setTitle("Unban")
                Embed:setDescription("You need the Ban/Unban permission to use this command.")
                Embed:setFooter()
                reply(Message,{embed = Embed})
            else 
                reply(Message,">>> You need the Ban/Unban permission to use this command.")
            end
        end
    else 
        local Embed = newEmbed()
        Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
        Embed:setTitle("Unban")
        Embed:setDescription("You need to use this command in a guild")
        Embed:setFooter()
        reply(Message,{embed = Embed})
    end
end

commandAdd("unban",unbanUser)