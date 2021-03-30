local GameIDs = {
    ["BladeQuest"] = 2429242760,
    ["Arsenal"] = 0
}

for i, v in pairs(GameIDs) do
    if game.gameId == v then 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/perhapsmaybe/perhapsHub/master/Games/"..i..".lua"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/perhapsmaybe/perhapsHub/master/Console.lua", true))()
    end 
end
