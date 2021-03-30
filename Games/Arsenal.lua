repeat wait() until game:IsLoaded()

-- // Variables

if not getgenv().MTAPIMutex then loadstring(game:HttpGet("https://pastebin.com/raw/UwFCVrhS", true))() end

local mt = getrawmetatable(game)
local namecall = mt.__namecall
setreadonly(mt, false)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer
local PlayerGui = Player.PlayerGui

local Client = PlayerGui.GUI.Client
local Script = getsenv(Client)

local a = ""
for i, v in pairs(Script) do 
    a = a..tostring(i).." "..tostring(v).."\n"
end 

setclipboard(a)

-- // Script
for i, v in pairs(game:GetService("CoreGui"):GetChildren()) do if v.Name == "FluxLib" then v:Destroy() end end
local Flux = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt")()
local UI = Flux:Window("perhaps Hub", "\nArsenal", Color3.fromRGB(255, 110, 48), Enum.KeyCode.LeftControl)
local Weapon = UI:Tab("Weapon", "http://www.roblox.com/asset/?id=6023426915")
local InfoTab = UI:Tab("Credits", "http://www.roblox.com/asset/?id=6587512303")

-- // Weapon Tab

Weapon:Toggle("Infinite Ammo", "Gives your weapons infinite ammo", shared.InfiniteAmmo or false, function(Value)
    shared.InfiniteAmmo = Value
end)

Weapon:Toggle("No Recoil", "Makes your guns have no recoil", shared.NoRecoil or false, function(Value)
    shared.NoRecoil = Value
end)

Weapon:Toggle("No Spread", "Makes your guns have no spread", shared.NoSpread or false, function(Value)
    shared.NoSpread = Value
end)

Weapon:Toggle("Automatic Gun", "Makes your gun automatic", shared.AutomaticGun or false, function(Value)
    shared.AutomaticGun = Value
end)

Weapon:Toggle("Headshots Only", "Makes you hit a headshot everytime", shared.HeadshotsOnly or false, function(Value)
    shared.HeadshotsOnly = Value
end)

Weapon:Toggle("Wallbang", "Makes your bullets able to go through walls", shared.Wallbang or false, function(Value)
    shared.Wallbang = Value
end)

game:GetService("RunService").RenderStepped:Connect(function(Step)
    if Script then
        if shared.InfiniteAmmo then
            Script["ammocount"] = 999
        end

        if shared.NoRecoil then
            Script["recoil"] = 0
        end

        if shared.NoSpread then
            Script["currentspread"] = 0
        end 

        if shared.AutomaticGun then
            Script["mode"] = "automatic"
        end 

        for i, v in pairs(Script) do
            if string.find(i, "debounce") and not string.find(i, "Scanner") then
                Script[i] = false
            end
        end
    else
        Script = getsenv(PlayerGui.GUI.Client)
    end 
end)

local old = mt.__index
mt.__index = newcclosure(function(self, Value) 
    if Value == "Clips" and shared.Wallbang then
        return workspace.Map
    end
    
    return old(self, Value)
end)

mt.__namecall = newcclosure(function(self, ...) 
   local method = getnamecallmethod()
   local args = {...}
  
    if method == "FireServer" and shared.HeadshotsOnly and self == ReplicatedStorage.Events.HitPart and args[1] ~= nil and typeof(args[1]) == "Instance" and args[2] ~= nil and typeof(args[2]) == "Vector3" and args[3] ~= nil and typeof(args[3]) == "string" then
        local Part = args[1]
        if Players:GetPlayerFromCharacter(Part.Parent) and Part.Parent:FindFirstChild("HeadHB") then
            args[1] = Part.Parent:FindFirstChild("Head")
            args[2] = Part.Parent:FindFirstChild("Head").Position
            args[8] = true
            return self.FireServer(self, unpack(args))
        end
    end 

    return namecall(self, ...)
end)

-- // Info Tab

InfoTab:Label("V3rm Credits")
InfoTab:Line()
InfoTab:Label("AFriendlyNewUser - Creator")
InfoTab:Label("ToddDev - Wallbang")
