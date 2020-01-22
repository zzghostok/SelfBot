require("Funcs")
Help = {Help = "Changes your input into Regional Indicator emojis",Category = "Utility"}

local function regional(Message,Arguments)
  if Arguments[1] then 
  local Arguments,T = concat(Arguments," "),{}
      gsub(Arguments,".",function(String)
          insert(T,format(":regional_indicator_%s:",lower(String)))
        end)
      reply(Message,concat(T," ")) -- TEMP bypass to "attempt to yield across C-call boundary" error
      Message:delete()
    end
end 

commandAdd("regional",regional)
