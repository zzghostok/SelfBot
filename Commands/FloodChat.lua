require("Funcs")
Help = {Help = "Floods the chat with empty lines",Category = "Utility"}


local function flood(Message,Arguments)
   if Message.author == Client.owner then
        reply(Message,rep("_\n",1000))
        Message:delete()
    end
end

commandAdd("purgechat",flood)
commandAdd("flood",flood)
commandAdd("floodchat",flood)
