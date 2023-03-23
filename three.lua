local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/dirt",true))()
local Table = {}
local window = Lib:CreateWindow("Vehicle Legends")
window:Section("Auto Farm Eggs")

-- get the eggs folder in Workspace
local eggsFolder = game:GetService("Workspace").Eggs

-- define the toggle function
window:Toggle("Toggle", {location = Table, flag = "Toggle"}, function()
    -- loop through all the child objects in the folder
    for _, egg in pairs(eggsFolder:GetChildren()) do
        -- get the local player's character's HumanoidRootPart
        local character = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        
        -- set the player's position to the egg's position
        character.CFrame = egg.CFrame
        
        -- wait for 1 second
        wait(1)
        
        -- print the name of the egg
        print(egg.Name)
    end
    -- print the toggle status
    print(Table["Toggle"])
end)
