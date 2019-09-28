require("Funcs")
Help = {Help = "Tells you how gay You / Optional @User is (This is 100% accurate.)",Category = "Fun"}

local function howGay(Message,Arguments)
randomseed(ostime())
    if Arguments[1] then 
        for User in Message.mentionedUsers:iter() do 
            reply(Message,User.tag.." is "..random(1,100).."% gay")
        end
    else 
        reply(Message,Message.author.tag.." you are "..random(1,100).."% gay")
    end
end 

commandAdd("howgay",howGay)