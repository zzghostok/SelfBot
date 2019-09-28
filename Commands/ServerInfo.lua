require("Funcs")
Help = {Help = "Gets the Server info",Category = "Utility"}

local function getServerInfo(Message,Arguments)
if inGuild(Message) then 
local Bots,Humans = {},{}
	for User in Message.guild.members:iter() do 
		if User.bot then 
			insert(Bots,v)
		else 
			insert(Humans,v)
		end
	end
    	reply(Message,"```css\n[Server Name]: "..Message.guild.name.."\n[Owner]: <@"..Message.guild.ownerId..">\n[Region]: "..Message.guild.region.."\n[Guild Categories]: "..Message.guild.categories:count().."\n[Text Channels]: "..Message.guild.textChannels:count().."\n[Voice Channels]: "..Message.guild.voiceChannels:count().."\n[Members]: "..Message.guild.totalMemberCount.."\n[People]: "..#Humans.."\n[Bots]: "..#Bots.."\n[Created at]: "..os.date("%X",Message.guild.createdAt):sub(2,5)..string.lower(os.date("%p",Message.guild.createdAt))..". "..os.date("%A",Message.guild.createdAt).." "..os.date("%B",Message.guild.createdAt).." "..os.date("%d",Message.guild.createdAt)..", "..os.date("%Y",Message.guild.createdAt).."\n[Role Count]: "..Message.guild.roles:count().."\n[Emoji Count]: "..Message.guild.emojis:count().."\n[Joined At]: "..Message.member.joinedAt:sub(1,10).."\n[Server Id]: "..Message.guild.id.."```")
	else
		reply(Message,"You need to use this command in a guild.")
	end
end

commandAdd("server",getServerInfo)
commandAdd("serverinfo",getServerInfo)
