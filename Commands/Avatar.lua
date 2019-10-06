require("Funcs")
Help = {Help = "Gets your / Optional @User's avatar",Category = "Utility"}

local function getAvatar(Message,Arguments)
    if Arguments[1] then 
        for User in Message.mentionedUsers:iter() do
            if ClientSettings.EmbedMessage then 
                local Embed = newEmbed()
                Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
                Embed:setTitle("Avatar")
                Embed:setDescription(User.tag.."'s Avatar is")
                Embed:setFooter()
                Embed:setImage(User.avatarURL.."?size=1024")
                reply(Message,{embed = Embed})
            else
                reply(Message,">>> "..User.tag.."'s Avatar is "..User.avatarURL.."?size=1024")
            end
        end
    else
        if ClientSettings.EmbedMessage then
            local Embed = newEmbed()
            Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
            Embed:setTitle("Avatar")
            Embed:setDescription(Message.author.tag..", your Avatar is")
            Embed:setFooter()
            Embed:setImage(Message.author.avatarURL.."?size=1024")
            reply(Message,{embed = Embed})
        else 
            reply(Message,">>> "..Message.author.tag..", your Avatar is: "..Message.author.avatarURL.."?size=1024")
        end
    end
end


commandAdd("avatar",getAvatar)