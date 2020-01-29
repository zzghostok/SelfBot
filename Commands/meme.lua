require("Funcs")
Help = {Help = "Gives you bad memes from soyreddit",Category = "Fun"}

local function soyMeme(Message,Arguments)
  local _,Body = request("GET","https://meme-api.herokuapp.com/gimme/dankmemes")
  Body = decode(Body)
  local Embed = newEmbed()
  Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
  Embed:setImage(Body['url'])
	Embed:setFooter()
  reply(Message,{embed = Embed})
end 

commandAdd("meme",soyMeme)
