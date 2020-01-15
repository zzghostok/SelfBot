local execute = os.execute
local open = io.open
local sub = string.sub
local remove = table.remove
local pcll,cpath,tnumber = pcall,package.cpath,tonumber
--[[
	Start of Utilities
]]

function readFile(FileName,Method)
	if io.open(FileName,"r") then 
		local Contents = io.open(FileName,"r"):read()
		io.open(FileName):close()
		return Contents
	end
end

function writeFile(FileName,FileContents,Method)
local File
	if Method == "Overwrite" then 
		File = open(FileName,"w")
		File:write(FileContents)
	else
		File = open(FileName,"a")
		File:write(FileContents,"\n")
	end
	if File then -- edge case 
		File:close()
	end
end

function wait(Time)
	if cpath:match("%p[\\|/]?%p(%a+)") == "dll" then 
		return execute("timeout "..Time)
	elseif cpath:match("%p[\\|/]?%p(%a+)") == "so" then 
		return execute("sleep "..Time)
	elseif cpath:match("%p[\\|/]?%p(%a+)") == "dylib" then 
		return execute("timeout "..tnumber(Time.."000"))
	end 
end

--[[
	End of Utilities
and
	Start of Guild Things
]]

function getMessagesBefore(Message,Amount)
	return Message.channel:getMessagesBefore(Message.id,Amount)
end

function delete(toDelete)
	return toDelete:delete()
end

function hasAdmin(Message,Permission) -- Ugly code I know
	if Permission == "Mute" then 
		return Message.member:hasPermission(Message.channel,Enums.permission.muteMembers)
	elseif Permission == "Deafen" then 
		return Message.member:hasPermission(Message.channel,Enums.permission.deafenMembers)
	elseif Permission == "NickName" then 
		return Message.members:hasPermission(Message.channel,Enums.permission.changeNickname)
	elseif Permission == "NickNames" then 
		return Message.member:hasPermission(Message.channel,Enums.permission.manageNicknames)
	elseif Permission == "Admin" then 
		return Message.member:hasPermission(Message.channel,Enums.permission.administrator) 
	elseif Permission == "Kick" then 
		return Message.member:hasPermission(Message.channel,Enums.permission.kickMembers) 
	elseif Permission == "Ban" then 
		return Message.member:hasPermission(Message.channel,Enums.permission.banMembers)
	elseif Permission == "Unban" then 
		return Message.member:hasPermission(Message.channel,Enums.permission.banMembers)
	elseif Permission == "Delete" then 
		return Message.member:hasPermission(Message.channel,Enums.permission.manageMessages)
	elseif Permission == "Owner" then 
		if Message.guild.owner == Message.member then 
			return true
		else 
			return false
		end
	elseif Permission == "" then -- Place Holder
		print''
	end
end

function modifyUser(Guild,User,Method,reason)
	if Method == "Kick" then 
		return Guild:kickUser(User.id,reason)
	elseif Method == "Ban" then 
		return Guild:banUser(User.id,reason)
	elseif Method == "Unban" then 
		return Guild:unbanUser(User,reason)
	end
end

--[[
	End of Guild Things 
and 
	Start of Messages
]]

function isOwner(Author,BotMode)
	if BotMode then 
		return true; 
	else 
		return Author == Client.owner
	end 
end

function commandAdd(name,func)
    local tempRun = function(Message,func)
        local Arguments = string.split(Message.content:sub(2)," ")
		remove(Arguments,1)
		func(Message,Arguments)
	end
	Commands[name] = function(Message) 
		tempRun(Message,func) 
	end
end

function runCmd(Message)
    if sub(Message.content,1,#Prefix) == Prefix and isOwner(Message.author) then 
        local Command = string.split(Message.content:sub(2)," ")
        if Commands[Command[1]] then 
			local Worked,Error = pcll(function()
				Commands[Command[1]](Message)
			end)
			if not Worked then 
				Message:setContent(Error)
			end
        end
    end
end

function reply(Message,Content)
	Message:reply(Content)
end 

function inGuild(Message)
	return Message.guild
end

--[[
	End of Messages
and 
	Start of Embeds
]]

embed = {
	setAuthor = function(self,name,Image)
		self.author = {}
		self.author.name = name
		self.author.url = "https://discord.gg/vsajMNm"
		self.author.icon_url = Image
	end, 

	setImage = function(self,Url)
		self.image = {}
		self.image.url = Url
	end, 

	setFooter = function(self,String)
		self.footer = {}
		if String then 
			self.footer.text = ("Made By Cy#7931 "..String)
		else 
			self.footer.text = ("Made By Cy#7931")
		end
		self.timestamp = os.date("!%Y-%m-%dT%H:%M:%S")
		self.color = 9109504
	end, 

	setFooterIcon = function(self,Url)
		self.footer.icon_url = Url
	end, 
	
	setTitle = function(self,String)
		self.title = String
	end, 
	
	setDescription = function(self,desc)
		self.description = desc
	end
}

function newEmbed()
	return setmetatable({},{__index = embed})
end
