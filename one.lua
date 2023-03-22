local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/dirt",true))()
local Table = {}
local window = Lib:CreateWindow("Zentain Hub")
window:Section("Fart Race")

detector = game:GetService("Workspace").Scenes.BasicScene.RaceWall.Detector
playerwa = game.Players.LocalPlayer.Character.HumanoidRootPart
poop = game:GetService("Workspace").Scenes.BasicScene.CollectionArea




local isRunning = false

window:Toggle("Auto Collection", {location = Table, flag = "AutoCollection"}, function()
    print(Table["AutoCollection"])
    isRunning = Table["AutoCollection"]
end)

spawn(function()
    while true do
        if isRunning then
            local playerwa = game.Players.LocalPlayer.Character.HumanoidRootPart
            local collectionArea = game:GetService("Workspace").Scenes.BasicScene.CollectionArea

            for _, child in pairs(collectionArea:GetChildren()) do
                child.CFrame = playerwa.CFrame
            end
        end
        wait(3)
    end
end)



local isRunning = false

window:Toggle("Auto Fart", {location = Table, flag = "AutoRace"}, function()
    print(Table["AutoRace"])
    isRunning = Table["AutoRace"]
end)

spawn(function()
    while true do
        if isRunning then
            playerwa.CFrame = detector.CFrame
        end
        wait(6)
    end
end)


local isRunning = false
window:Toggle("Merge All", {location = Table, flag = "Merge All"}, function()
   print(Table["Merge All"])
   isRunning = Table["Merge All"]
end)

spawn(function()
   while true do
       if isRunning then
         game:GetService("ReplicatedStorage").Events.Shop.CS_MergeAllPetEvent:FireServer()
       end
       wait(10)
   end
end)


local isRunning = false

window:Toggle("Equip Best", {location = Table, flag = "Equip Best"}, function()
   print(Table["Equip Best"])
   isRunning = Table["Equip Best"]
end)

spawn(function()
   while true do
       if isRunning then
         game:GetService("ReplicatedStorage").Events.Shop.CS_EquipBestPetEvent:FireServer()
       end
       wait(1)
   end
end)



window:Dropdown("Egg Hatcher",{location = Table,flag = "Dropdown",search = true --[[AddsSearchBar]], list = {"Egg Hatcher","50","5K","50K","150K","5M","50M"} --[[Wont work when PlayerList = true]], PlayerList = false --[[ Turns the list into the players in the server ]]},function()
   print(Table["Dropdown"])
   val = Table["Dropdown"]
   if val == "50" then
    game:GetService("ReplicatedStorage").Events.Shop.CS_BuyItemFunc:InvokeServer(1,1)
    elseif val == "5K" then
        game:GetService("ReplicatedStorage").Events.Shop.CS_BuyItemFunc:InvokeServer(2,1)
    elseif val == "50K" then
        game:GetService("ReplicatedStorage").Events.Shop.CS_BuyItemFunc:InvokeServer(3,1)
    elseif val == "150K" then
        game:GetService("ReplicatedStorage").Events.Shop.CS_BuyItemFunc:InvokeServer(4,1)
    elseif val == "5M" then
        game:GetService("ReplicatedStorage").Events.Shop.CS_BuyItemFunc:InvokeServer(5,1)
    elseif val == "50M" then
        game:GetService("ReplicatedStorage").Events.Shop.CS_BuyItemFunc:InvokeServer(6,1)
    end
end)
