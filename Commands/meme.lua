require("Funcs")
Help = {Help = "Gives you bad memes from soyreddit",Category = "Fun"}
local MemeTable = {"dankmemes","NewOffensiveMemes","darkmeme","memes","meirl"}
local function soyMeme(Message,Arguments)
  if Arguments[1] and Arguments[1]:lower() == "bomb" then 
    local _,Body = request("GET","https://meme-api.herokuapp.com/gimme/5")
    local New = decode(Body)
      reply(Message,New['memes'][1]['url'].." "..New['memes'][2]['url'].." "..New['memes'][3]['url'].." "..New['memes'][4]['url'].." "..New['memes'][5]['url'])
  else
      local _,Body = request("GET","https://meme-api.herokuapp.com/gimme/"..MemeTable[math.random(1,#MemeTable)])
      Body = decode(Body)
      local Embed = newEmbed()
      Embed:setAuthor("CyBot","https://i.imgur.com/WM6c9ld.png")
      Embed:setImage(Body['url'])
      Embed:setFooter()
      reply(Message,{embed = Embed})
    end
end 

commandAdd("meme",soyMeme)
