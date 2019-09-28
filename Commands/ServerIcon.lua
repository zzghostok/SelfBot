require("Funcs")
Help = {Help = "Gets the Server Icon",Category = "Utility"}

local function getServerIcon(Message,Arguments)
    if inGuild(Message) then 
        if Message.guild.iconURL then 
            reply(Message,"```css\nThe server Icon Link is: "..Message.guild.iconURL.."```")
        else 
            reply(Message,"The server has no Icon")
        end
    else 
        reply(Message,"You need to use this command in a guild.")
    end
end

commandAdd("servericon",getServerIcon)
commandAdd("sicon",getServerIcon)