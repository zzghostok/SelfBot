require("Funcs")
Help = {Help = "Gives you bad memes from soyreddit",Category = "Fun"}

local function soyMeme(Message,Arguments)
  if Arguments[1] and Arguments[1]:lower() == "bomb" then 
    local MemeTable = {}
    for i = 1,5 do
    local _,Body = request("GET","https://meme-api.herokuapp.com/gimme/dankmemes")
      insert(MemeTable,decode(Body)['url'])
    end
      reply(Message,concat(MemeTable," "))
  else 
      local _,Body = request("GET","https://meme-api.herokuapp.com/gimme/dankmemes")
      Body = decode(Body)
      local Embed = newEmbed()
      Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
      Embed:setImage(Body['url'])
      Embed:setFooter()
      reply(Message,{embed = Embed})
    end
end 

commandAdd("meme",soyMeme)
