require("Funcs")
Help = {Help = "Gives you your gay hentai you so dearly love.",Category = "Nsfw"}

local function sendGayTai(Message,Arguments)
  if not Arguments[1] and inGuild(Message) and Message.channel.nsfw or not inGuild(Message) and not Arguments[1] then 
		local _,Body = request("GET","https://nekos.life/api/v2/img/lewd")
      local Embed = newEmbed()
      Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
      Embed:setFooter()
      Embed:setImage(decode(Body)['url'])
      reply(Message,{embed = Embed})
  elseif Arguments[1] and lower(Arguments[1]) == "bomb" and inGuild(Message) and Message.channel.nsfw or not inGuild(Message) then
    local HenTable = {}
    for i = 1,5 do
      local _,Body = request("GET","https://nekos.life/api/v2/img/lewd")
        insert(HenTable,decode(Body)['url'])
      end
          reply(Message,concat(HenTable," "))
      end
  end 

commandAdd("degen",sendGayTai)
