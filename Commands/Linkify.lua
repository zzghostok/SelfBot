require("Funcs")
Help = {Help = "Converts Images to URLs (I don't know why I added this)",Category = "Utility"}


local function uselessCommand(Message,Arguments)
    if Message.attachment then 
        reply(Message,Message.attachment.url)
    else 
        reply(Message,">>> You need to put an Attachment in your Message to use this command")
    end
end

commandAdd("linkify",uselessCommand)