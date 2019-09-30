require("Funcs")
Help = {Help = "Type .Commands to see the Commands.",Category = "Utility"}

function help(Message,Arguments)
local File = popen("ls Commands")
	if Arguments[1] then 
		local ReloadFile
		local F = Arguments[1]:lower()..".lua"
		for Files in File:lines() do 
			if Files:lower():sub(1,#Arguments[1]) == F:sub(1,#Arguments[1])  then 
				ReloadFile = Files
			end
		end
		File:close()
		if ReloadFile then 
			local Work,Error = lfile("Commands/"..ReloadFile)
			if not Work then 
				Message:setContent(">>> Syntax Error. "..ReloadFile.."\n```Lua\n"..Error.."```")
			else
				setfnv(Work,_G)
				local Func,Error = pcll(Work)
				if not Func then
					Message:setContent(">>> Runtime Error. "..ReloadFile.."```Lua\n"..Error.."```")
				else
                    Message:setContent(">>> Command: "..ReloadFile.."\nCategory: "..Help.Category.."\nCommand Use: "..Help.Help)
				end
			end
		else
			Message:setContent(">>> "..Arguments[1].."is not a valid command! http://cyhost.x10.mx/DiscordBot/")
		end
    else 
        reply(Message,"http://cyhost.x10.mx/DiscordBot/")
	end
end

commandAdd("help",help)
