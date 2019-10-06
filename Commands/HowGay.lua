require("Funcs")
Help = {Help = "Tells you how gay You / Optional @User is (This is 100% accurate.)",Category = "Fun"}

local function howGay(Message,Arguments)
randomseed(ostime())
    if Arguments[1] then 
        for User in Message.mentionedUsers:iter() do
            if ClientSettings.EmbedMessage then 		
                local Embed = newEmbed()
                Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
                Embed:setTitle("HowGay")
                Embed:setDescription(User.tag.." is "..random(1,100).."% gay")
                Embed:setFooter()
                reply(Message,{embed = Embed})
            else 
                reply(Message,">>> "..User.tag.." is "..random(1,100).."% gay")
            end
        end
    else
        if ClientSettings.EmbedMessage then
            local Embed = newEmbed()
            Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
            Embed:setTitle("HowGay")
            Embed:setDescription(Message.author.tag.." you are "..random(1,100).."% gay")
            Embed:setFooter()
            reply(Message,{embed = Embed})
        else
            reply(Message,">>> "..Message.author.tag.." you are "..random(1,100).."% gay")
        end
    end
end 

commandAdd("howgay",howGay)