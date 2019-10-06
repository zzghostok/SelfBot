require("Funcs")
_G.Discordia = require('discordia')
_G.Client,_G.Http,_G.Json,_G.PrettyPrint,_G.Enums,_G.Commands,_G.Prefix,_G.extensions = Discordia.Client({cacheAllMembers = false;syncGuilds = false;}),require('coro-http'),require('json'),require('pretty-print'), Discordia.enums,{},".",Discordia.extensions()
_G.random,_G.randomseed = math.random,math.randomseed
_G.lower,_G.rep,_G.tstring = string.lower,string.rep,tostring
_G.request = Http.request
_G.encode,_G.decode = Json.encode,Json.decode
_G.ostime,_G.osdate,_G.osclock = os.time,os.date,os.clock
_G.concat,_G.insert,_G.maxn,_G.remove = table.concat,table.insert,table.maxn,table.remove
_G.lfile,_G.setfnv,_G.pcll = loadfile,setfenv,pcall
_G.popen = io.popen

_G.ClientSettings = {
    cacheAllMembers = false;
    syncGuilds = false;
    antiGhostPing = false;
    LogMessages = false;
    EmbedMessage = false;
}

local function startSettings()
    if not readFile("ClientSettings.txt") then 
        writeFile("ClientSettings.txt",encode(_G.ClientSettings),"Overwrite",Json)
        return 
    end
    local Data = decode(readFile("ClientSettings.txt"))
    _G.ClientSettings.antiGhostPing = Data.antiGhostPing
    _G.ClientSettings.LogMessages = Data.LogMessages
    _G.ClientSettings.EmbedMessage = Data.EmbedMessage
    _G.Client = Discordia.Client{cacheAllMembers = Data.cacheAllMembers;syncGuilds = Data.syncGuilds}
end
startSettings()

Client:on('messageCreate',runCmd)
Client:on('messageDelete',function(Message)
    if ClientSettings.LogMessages and not Message.author.bot and not isOwner(Message.author) then
        if Message.attachment then 
            writeFile("LoggedMessages.txt","Message Author: "..Message.author.tag.."\nMessage Content: "..Message.content.."\nMessage Id: "..Message.id.."\nMessage Link: "..Message.link.."\nMessage Channel: "..Message.channel.name.."\nAttachment: "..Message.attachment.url)
        else 
            writeFile("LoggedMessages.txt","Message Author: "..Message.author.tag.."\nMessage Content: "..Message.content.."\nMessage Id: "..Message.id.."\nMessage Link: "..Message.link.."\nMessage Channel: "..Message.channel.name)
        end
	end
	if ClientSettings.antiGhostPing then 
		for User in Message.mentionedUsers:iter() do 
			if User == Client.user and not isOwner(Message.author) then 
                local MessageSend = {}
                MessageSend.username = "Ghost pinger detected"
                MessageSend.content = ">>> ```Message Author: "..Message.author.tag.."\nMessage Content: "..Message.content.."\nMessage Id: "..Message.id.."\nMessage Link: "..Message.link.."\nMessage Channel: "..Message.channel.name.."```"
                request("POST",tostring(readFile("WebHook.txt")),{{"content-type", "application/json"};},Json.encode(MessageSend))
			end 
		end
	end
end)

for Command in popen("ls Commands","r"):lines() do 
    local File,Error = lfile("Commands/"..Command)
        if not File then 
            print("Command "..Command.." had a syntax error. "..Error)
        else
            setfnv(File,_G)
            local Work,Error = pcll(File)
         if not Work then 
            print("There was an error on runtime. "..Error) 
        end
    end
end

Client:run(readFile("Token.txt"),{afk = true})
