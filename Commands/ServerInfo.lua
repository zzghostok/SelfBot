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
		if ClientSettings.EmbedMessage then
			local Embed = newEmbed()
			Embed:setAuthor("CyBot","http://cyhost.x10.mx/Utilities/RaccAttack.png")
			Embed:setTitle(Message.guild.name)
			Embed:setDescription("\nOwner: <@"..Message.guild.ownerId..">\nRegion: "..Message.guild.region.."\nGuild Categories: "..Message.guild.categories:count().."\nText Channels: "..Message.guild.textChannels:count().."\nVoice Channels: "..Message.guild.voiceChannels:count().."\nMembers: "..Message.guild.totalMemberCount.."\nPeople: "..#Humans.."\nBots: "..#Bots.."\nCreated at: "..os.date("%m/%d/%Y at %I:%M:%S%p",Message.guild.createdAt).."\nRole Count: "..Message.guild.roles:count().."\nEmoji Count: "..Message.guild.emojis:count().."\nJoined At: "..Message.member.joinedAt:sub(1,10).."\nServer Id: "..Message.guild.id)
			Embed:setFooter()
			reply(Message,{embed = Embed})
		else 
    		reply(Message,">>> [Server Name]: "..Message.guild.name.."\n[Owner]: <@"..Message.guild.ownerId..">\n[Region]: "..Message.guild.region.."\n[Guild Categories]: "..Message.guild.categories:count().."\n[Text Channels]: "..Message.guild.textChannels:count().."\n[Voice Channels]: "..Message.guild.voiceChannels:count().."\n[Members]: "..Message.guild.totalMemberCount.."\n[People]: "..#Humans.."\n[Bots]: "..#Bots.."\n[Created at]: "..os.date("%m/%d/%Y at %I:%M:%S%p",Message.guild.createdAt).."\n[Role Count]: "..Message.guild.roles:count().."\n[Emoji Count]: "..Message.guild.emojis:count().."\n[Joined At]: "..Message.member.joinedAt:sub(1,10).."\n[Server Id]: "..Message.guild.id)
		end
	else
		reply(Message,">>> You need to use this command in a guild.")
	end
end

commandAdd("server",getServerInfo)
commandAdd("serverinfo",getServerInfo)
