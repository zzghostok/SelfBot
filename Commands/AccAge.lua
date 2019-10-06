require("Funcs")
Help = {Help = "Gets Your / Optional @User's account age",Category = "Utility"}

local function accAge(Message,Arguments)
    if Arguments[1] then 
        for User in Message.mentionedUsers:iter() do
            if ClientSettings.EmbedMessage then
                local Embed = newEmbed()
                Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
                Embed:setTitle("AccAge")
                Embed:setDescription(User.tag.."'s acc was created on "..osdate("%m/%d/%Y at %I:%M:%S%p",User.createdAt))
                Embed:setFooter()
                reply(Message,{embed = Embed})
            else 
                reply(Message,">>> "..User.tag.."'s acc was created on "..osdate("%m/%d/%Y at %I:%M:%S%p",User.createdAt))
            end
        end
    else
        if ClientSettings.EmbedMessage then 
            local Embed = newEmbed()
            Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
            Embed:setTitle("AccAge")
            Embed:setDescription(Message.author.tag..", your acc was created on "..osdate("%m/%d/%Y at %I:%M:%S%p",Message.author.createdAt))
            Embed:setFooter()
            reply(Message,{embed = Embed})
        else
            reply(Message,">>> "..Message.author.tag", Your acc was created on "..osdate("%m/%d/%Y at %I:%M:%S%p",Message.author.createdAt))
        end
    end 
end

commandAdd("accage",accAge)
commandAdd("age",accAge)