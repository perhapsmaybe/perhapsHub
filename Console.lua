local SplitText = [[                               /$$                                     /$$   /$$           /$$      
                              | $$                                    | $$  | $$          | $$      
  /$$$$$$   /$$$$$$   /$$$$$$ | $$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$$| $$  | $$ /$$   /$$| $$$$$$$ 
 /$$__  $$ /$$__  $$ /$$__  $$| $$__  $$ |____  $$ /$$__  $$ /$$_____/| $$$$$$$$| $$  | $$| $$__  $$
| $$  \ $$| $$$$$$$$| $$  \__/| $$  \ $$  /$$$$$$$| $$  \ $$|  $$$$$$ | $$__  $$| $$  | $$| $$  \ $$
| $$  | $$| $$_____/| $$      | $$  | $$ /$$__  $$| $$  | $$ \____  $$| $$  | $$| $$  | $$| $$  | $$
| $$$$$$$/|  $$$$$$$| $$      | $$  | $$|  $$$$$$$| $$$$$$$/ /$$$$$$$/| $$  | $$|  $$$$$$/| $$$$$$$/
| $$____/  \_______/|__/      |__/  |__/ \_______/| $$____/ |_______/ |__/  |__/ \______/ |_______/ 
| $$                                              | $$                                              
| $$                                              | $$                                              
|__/                                              |__/                                              
SPLITHERE - Blade Quest 
 - Arsenal
]]

SplitText = SplitText:split("SPLITHERE")

local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/perhapsmaybe/perhapsHub/master/CrossCompatibility/Main.lua"))()
local Exploit = API.getexploit()

-- // Script

local ConsoleName = ""
local Colors = {"RED", "YELLOW", "LIGHT_GREEN", "GREEN", "LIGHT_CYAN", "LIGHT_BLUE", "BLUE", "LIGHT_MAGENTA", "MAGENTA", "LIGHT_MAGENTA", "BLUE", "LIGHT_BLUE", "LIGHT_CYAN", "GREEN", "LIGHT_GREEN", "YELLOW", "LIGHT_RED"}
function ClearConsole() rconsoleclear() end
function ConsoleLine() rconsoleprint("\n") end

function ChangeName(Text) rconsolename(Text) return Text end

function ColoredText(Text) local CurrentName = "" CurrentColor = 0  for i, v in pairs(Text:split("")) do CurrentColor = CurrentColor + 1 if CurrentColor > #Colors then CurrentColor = 1 end rconsoleprint("@@"..Colors[CurrentColor].."@@") rconsoleprint(v) end end 
function AnimateText(Text) rconsoleprint("@@LIGHT_GRAY@@") local CurrentName = "" rconsoleprint("\n") for i, v in pairs(Text:split("")) do CurrentName = CurrentName..v rconsoleprint(v) wait(0.1) end end 
function AnimatedColoredText(Text) local CurrentName = "" rconsoleprint("\n") local CurrentName = "" CurrentColor = 0  for i, v in pairs(Text:split("")) do CurrentColor = CurrentColor + 1 if CurrentColor > #Colors then CurrentColor = 1 end rconsoleprint("@@"..Colors[CurrentColor].."@@") rconsoleprint(v) wait(0.1) end end

local Title = SplitText[1]
local Games = SplitText[2]

ClearConsole()
ColoredText(Title)

rconsoleprint("\n")
rconsoleprint("@@GREEN@@")
rconsoleprint("Loaded using ")
rconsoleprint("@@CYAN@@")
rconsoleprint(Exploit.."!")
rconsoleprint("\n")
rconsoleinfo("Games")
rconsoleprint("@@GREEN@@")
rconsoleprint(Games)

local marketplaceService = game:GetService("MarketplaceService")
local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)
if isSuccessful then
  ChangeName("perhapsHub >> "..info.Name)
end
