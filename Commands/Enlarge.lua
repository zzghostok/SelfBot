require("Funcs")
Help = {Help = "Gets an Emoji URL",Category = "Utility"}

local function getEmoji(Message,Arguments)
    if Arguments[1] then 
        for Emoji in Message.mentionedEmojis:iter() do
            if ClientSettings.EmbedMessage then 
                local Embed = newEmbed()
                Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
                Embed:setImage(Emoji.url.."?size=1024")
                Embed:setFooter()
                reply(Message,{embed = Embed})
            else 
                reply(Message,Emoji.url)
            end
        end 
    else
        if ClientSettings.EmbedMessage then 
            local Embed = newEmbed()
            Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
            Embed:setTitle("Enlarge")
            Embed:setDescription("You need to supply an Emoji for this to work.")
            Embed:setFooter()
            reply(Message,{embed = Embed})
        else
            reply(Message,">>> You need to supply an Emoji for this to work.")
        end
    end
end

commandAdd("enlarge",getEmoji)