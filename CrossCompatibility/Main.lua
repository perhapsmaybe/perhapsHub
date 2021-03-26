local API = {}

local ExploitIdentify = {
    ["Synapse X"] = syn and is_synapse_function,
    ["Protosmasher"] = pebc_execute,
    ["Sentinel"] = issentinelclosure,
    ["Krnl"] = "None",
    ["Scriptware"] = getexecutorname and getexecutorname() == "Scriptware",
    ["Elysian"] = elysianexecute
}

local CurrentExploit = "Unknown"
for i, v in pairs(ExploitIdentify) do if v == true or v ~= nil then CurrentExploit = i end end

function API.getexploit() return CurrentExploit end 

local APIFunctions = {
    ["writefile"] = writefile,
    ["readfile"] = readfile,
    ["isfile"] = isfile, 
    ["makefolder"] = makefolder,
    ["delfolder"] = delfolder,
    ["delfile"] = delfile, 
    ["appendfile"] = appendfile, 
    ["loadfile"] = loadfile,
    ["isfolder"] = isfolder
}

local TempTable = {
    ["isfile"] = function(FileName) local success, response = pcall(function() API.readfile(FileName) end) return success end,
    ["dofile"] = function(FileName) local success, response = pcall(function() local a = loadstring(API.readfile(FileName)) return a end) return response end,
    ["appendfile"] = function(FileName, NewValue) local success, response = pcall(function() local a = API.readfile(FileName) API.writefile(FileName, a..NewValue) end) end,
    ["loadfile"] = function(FileName) local success, response = pcall(function() local a = loadstring(API.readfile(FileName)) return a end) return response end,
}

function CheckForFunction(a)local b=false;local c=""for d=1,string.len(a)do local e=string.split(a,"")[d]if d~=1 then local f,g,h=pcall(function()local i=""for d,j in pairs(string.split(a,""))do if j==e and j~="_"then i=i.."_"..j else i=i..j end end;return getfenv(0)[TempName],TempName end)local k,l,m=pcall(function()local n=""for d,j in pairs(string.split(a,""))do if j==e and j~="_"then n=n.."_"..j elseif j~="_"then n=n..j end end;return getfenv(0)[n],n end)if f and g~=nil then b=true;c=h elseif k and l~=nil then b=true;c=m end end end;local f,g=pcall(function()return getfenv(0)[a]end)if f and g~=nil then b=true c = a end;return b,c end

for i, v in pairs(APIFunctions) do
    if v ~= nil and typeof(v) == "function" then
        API[i] = v
    elseif TempTable[i] then
        API[i] = TempTable[i]
    else
        local FoundFunction, Function = CheckForFunction(v)

        if FoundFunction and typof(Function) == "function" then
            API[i] = Function
        end
    end
end

--print(API.getexploit())
--print(API.appendfile)
