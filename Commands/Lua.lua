require("Funcs")
Help = {Help = "Executes Lua code.",Category = "Utility"}

local function executeLua(Message,Arguments)
local Sandbox,Table = setmetatable({},{__index = _G}),{}
Sandbox.Message = Message
    Sandbox.print = function(...)
        table.insert(Table,...)
    end
    Sandbox.p = function(...)
        table.insert(Table,...)
    end
    local Work,SynError = load(concat(Arguments," "):gsub("`",""),"CyBot","t",Sandbox)
    if not Work then 
        return reply(Message,">>> ```lua\n"..SynError.."```") 
    end
    local Work,RunError = pcall(Work)
    if not Work then return reply(Message,">>> ```lua\n"..RunError.."```") end
    if Table[1] then
        Message:reply("```lua\n"..concat(Table,"\n"):sub(1,1990).."```")
    end
    wait(1)
    Message:delete()
end 

commandAdd("lua",executeLua)