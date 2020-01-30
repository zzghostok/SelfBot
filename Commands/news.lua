require("Funcs")
Help = {Help = "Gives you some cool news",Category = "Utility"}

local function News(Message,Arguments)
    if Arguments[1] then 
      local Head,Body = request("GET","https://newsapi.org/v2/everything?q="..Arguments[1],{{"Authorization","cc0f29666a7e43aaa055576085b9e425"}})
      local New = decode(Body)
      if New['articles'] and New['articles'][1] then 
        local Test = math.random(1,#New['articles'])
        reply(Message,">>> Name of Article: "..New['articles'][Test]['title'].."\nURL: <"..New['articles'][Test]['url']..">\nDescription: "..New['articles'][Test]['description']:sub(1,1800))
      else 
          reply(Message,"Not an article also the tiananmensquare massacre never happened.")
      end
  else 
      local Head,Body = request("GET","https://newsapi.org/v2/top-headlines?country=us",{{"Authorization","cc0f29666a7e43aaa055576085b9e425"}})
      local New = decode(Body)
      local Test = math.random(1,#New['articles'])
      reply(Message,">>> Name of Article: "..New['articles'][Test]['title'].."\nURL: <"..New['articles'][Test]['url']..">\nDescription: "..New['articles'][Test]['description']:sub(1,1800))
  end
end 

commandAdd("news",News)
