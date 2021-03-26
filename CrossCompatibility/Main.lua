local API = {}

local CurrentExploit = syn and is_sirhurt_closure and "Sirhurt" or syn and not is_sirhurt_closure and not pebc_execute and syn.secure_call and "Synapse X" or secure_load and issentinelclosure and "Sentinel" or pebc_execute and "Protosmasher" or KRNL_LOADED and "Krnl" or WrapGlobal and "WRD" or isvm and "Proxo" or shadow_env and "Shadow" or jit and "EasyExploits" or unit and "Unit" or IS_VIVA_LOADED and "Viva" or IS_COCO_LOADED and "Coco" or getexecutorname and getexecutorname() == "Scriptware" and "Scriptware" or "Undetected" function API.getexploit() return CurrentExploit end 
function customwarn(name, text) warn(name.." >> "..text) end function customprint(name, text) print(name.." >> "..text) end
function CheckForFunction(a) if not getfenv then return false end local b=false;local c=""for d=1,string.len(a)do local e=string.split(a,"")[d]if d~=1 then local f,g,h=pcall(function()local i=""for d,j in pairs(string.split(a,""))do if j==e and j~="_"then i=i.."_"..j else i=i..j end end;return getfenv(0)[TempName],TempName end)local k,l,m=pcall(function()local n=""for d,j in pairs(string.split(a,""))do if j==e and j~="_"then n=n.."_"..j elseif j~="_"then n=n..j end end;return getfenv(0)[n],n end)if f and g~=nil then b=true;c=h elseif k and l~=nil then b=true;c=m end end end;local f,g=pcall(function()return getfenv(0)[a]end)if f and g~=nil then b=true c = a end;return b,c end
function GetFunction(a) if not getfenv then return false end local Found, Function = CheckForFunction(a) if Found then local TempFunction = getfenv(0)[Function] if typeof(TempFunction) == "function" then return TempFunction else return false end else return false end end 
local APIFunctions = {
    ["writefile"] = writefile,
    ["readfile"] = readfile,
    ["isfile"] = isfile, 
    ["makefolder"] = makefolder,
    ["delfolder"] = delfolder,
    ["delfile"] = delfile, 
    ["appendfile"] = appendfile, 
    ["loadfile"] = loadfile,
    ["isfolder"] = isfolder,
    ["customwarn"] = customwarn,
    ["customprint"] = customprint,
    ["getfunction"] = GetFunction,
    ["checkforfunction"] = CheckForFunction,
    ["getfenv"] = getfenv,
    ["getsenv"] = getsenv
}

local TempTable = {
    ["isfile"] = function(FileName) local success, response = pcall(function() API.readfile(FileName) end) return success end,
    ["dofile"] = function(FileName) local success, response = pcall(function() local a = loadstring(API.readfile(FileName)) return a end) return response end,
    ["appendfile"] = function(FileName, NewValue) local success, response = pcall(function() local a = API.readfile(FileName) API.writefile(FileName, a..NewValue) end) end,
    ["loadfile"] = function(FileName) local success, response = pcall(function() local a = loadstring(API.readfile(FileName)) return a end) return response end,
}

local BlacklistedExploits = {}
for i, v in pairs(APIFunctions) do 
    local Exploit = syn and is_sirhurt_closure and "Sirhurt" or syn and not is_sirhurt_closure and not pebc_execute and syn.secure_call and "Synapse X" or secure_load and issentinelclosure and "Sentinel" or pebc_execute and "Protosmasher" or KRNL_LOADED and "Krnl" or WrapGlobal and "WRD" or isvm and "Proxo" or shadow_env and "Shadow" or jit and "EasyExploits" or unit and "Unit" or IS_VIVA_LOADED and "Viva" or IS_COCO_LOADED and "Coco" or getexecutorname and getexecutorname() == "Scriptware" and "Scriptware" or "Undetected" 
    if v ~= nil and typeof(v) == "function" then 
        local a = 
        v API[i] = function(...) 
            if not table.find(BlacklistedExploits, Exploit) then 
                return a(...) 
            end 
        end 
    elseif TempTable[i] then 
        local a = TempTable[i] 
        API[i] = function(...) 
            if not table.find(BlacklistedExploits, Exploit) then 
                return a(...) 
            end 
        end 
    else 
        local FoundFunction, Function = CheckForFunction(v) 
        if FoundFunction and typof(Function) == "function" then 
            local a = Function 
            API[i] = function(...) 
                if not table.find(BlacklistedExploits, Exploit) then 
                    return a(...) 
                end 
            end 
        else
            API[i] = function(...)
                customwarn("perhapsHub", "Function is not supported!")
                return false
            end
        end
    end 
end

function API.blacklistexploit(Exploit) if Exploit == CurrentExploit then table.insert(BlacklistedExploits, Exploit) end end

return API
