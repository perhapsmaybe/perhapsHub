local GameIDs = {
    ["BladeQuest"] = 2429242760,
    ["Arsenal"] = 286090429
}

local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/perhapsmaybe/perhapsHub/master/CrossCompatibility/Main.lua"))()
local Exploit = API.getexploit()
for i, v in pairs(GameIDs) do
    if game.gameId == v then 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/perhapsmaybe/perhapsHub/master/Games/"..i..".lua"))()
        
        if Exploit == "Synapse X" or Exploit == "Krnl" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/perhapsmaybe/perhapsHub/master/Console.lua"))()
        end
    end 
end
