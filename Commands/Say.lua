require("Funcs")
Help = {Help = "Say anything you want!",Category = "Fun"}

local function say(Message,Arguments)
    if Arguments[1] then 
        reply(Message,concat(Arguments," "))
    else 
        reply(Message,"You need atleast one Argument (Example: CyBot is the best bot!")
    end 
end

commandAdd("say",say)