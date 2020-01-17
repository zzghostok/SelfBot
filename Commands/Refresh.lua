require("Funcs")
Help = {Help = "reloads commands so you can update them and use them in RealTime without having to restart the SelfBot",Category = "Utility"}

function refresh(Message,Arguments)
local File,FileAmount = popen("ls Commands"),{}
	if Arguments[1] then 
		local ReloadFile
		for Files in File:lines() do 
			if Files:lower():sub(1,#Arguments[1]) == (Arguments[1]:lower()..".lua"):sub(1,#Arguments[1]) then 
				ReloadFile = Files
			end
		end
		File:close()
		if ReloadFile then 
			local Work,Error = lfile("Commands/"..ReloadFile)
			if not Work then 
				reply(Message,">>> Syntax Error. "..ReloadFile.."```Lua\n"..Error.."```")
			else
				setfnv(Work,_G)
				local Func,Error = pcll(Work)
				if not Func then
					reply(Message,">>> Runtime Error. "..ReloadFile.."```Lua\n"..Error.."```")
				else
					reply(Message,">>> "..ReloadFile.." has been reloaded!")
				end
			end
		else
			reply(Message,">>> "..Arguments[1].." is not a valid Command")
		end
	end
end

commandAdd("reload",refresh)
commandAdd("refresh",refresh)
commandAdd("reboot",refresh)
