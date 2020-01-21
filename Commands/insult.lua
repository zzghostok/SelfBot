require("Funcs")
Help = {Help = "Gives you really cringy fucking insults",Category = "Fun"}

local function badInsult(Message,Arguments)
  local _,Body = request("GET","https://insult.mattbas.org/api/insult")
    reply(Message,Body)
end 

commandAdd("insult",badInsult)
