local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/dirt",true))()
local Table = {}
local window = Lib:CreateWindow("Zentain Hub")

local player = game.Players.LocalPlayer
local cplayer = game.Players.LocalPlayer.Character.HumanoidRootPart
local tycoons = game:GetService("Workspace").Tycoons.Tycoons
--Team Checker
for _, tycoon in ipairs(tycoons:GetChildren()) do
    local owner = tycoon.Owner
    if owner and owner.Value == player then
        team = tycoon.Name
        print(team)
    end
end
-- delete extra buttons
local buttonsToDestroy = {
    game:GetService("Workspace").Tycoons.Tycoons[team].Buttons:FindFirstChild("Buy Automatic Turret"),
    game:GetService("Workspace").Tycoons.Tycoons[team].Buttons:FindFirstChild("Buy 2x Cash Upgrader"),
    game:GetService("Workspace").Tycoons.Tycoons[team].Buttons:FindFirstChild("Buy Private Island"),
    game:GetService("Workspace").Tycoons.Tycoons[team].Buttons:FindFirstChild("Buy Extra Bunker"),
    game:GetService("Workspace").Tycoons.Tycoons[team].Buttons:FindFirstChild("Buy Rainbow Upgrader")
}

for _, button in ipairs(buttonsToDestroy) do
    if button then
        button:Destroy()
    end
end




window:Section("Super Hero Tycoon")
window:Section("Auto Farm")
local isAutoCollectEnabled = false

window:Toggle("Auto Collect", {location = Table, flag = "Toggle"}, function()
    isAutoCollectEnabled = not isAutoCollectEnabled
    
    if isAutoCollectEnabled then
        local giver = game:GetService("Workspace").Tycoons.Tycoons[team].Essentials.Giver
        giver.Transparency = 1
        while isAutoCollectEnabled do
            giver.CFrame = cplayer.CFrame
            wait()
        end
    else
        local giver = game:GetService("Workspace").Tycoons.Tycoons[team].Essentials.Giver
        giver.Transparency = 1
    end
end)



 local isAutoBuyEnabled = false

 window:Toggle("Auto Buy", {location = Table, flag = "Toggle"}, function()
     isAutoBuyEnabled = not isAutoBuyEnabled
     
     if isAutoBuyEnabled then
         local function changeHeadCFrames(parent)
             for _, child in ipairs(parent:GetChildren()) do
                 if string.find(child.Name, "Head") and child:IsA("BasePart") then
                     child.CFrame = cplayer.CFrame
                 end
                 changeHeadCFrames(child)
             end
         end
         
         local buttons = game:GetService("Workspace").Tycoons.Tycoons[team].Buttons
         changeHeadCFrames(buttons)
     end
 end)
 
 window:Toggle("Auto Collect Crates", {location = Table, flag = "Toggle"}, function()
    -- Get the local player's character
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local cframe = character.HumanoidRootPart.CFrame
    
    -- Define the recursive function to change the CFrame over several frames
    local function changeCFrame(obj, step)
        if obj:IsA("BasePart") then
            obj.CFrame = cframe:Lerp(obj.CFrame, step)
        end
        for _, child in ipairs(obj:GetChildren()) do
            changeCFrame(child, step)
        end
    end
    
    -- Get the Crates object and call the recursive function on its children
    local crates = game:GetService("Workspace").Crates
    
    -- Define the step size for updating the CFrame over several frames
    local stepSize = 0.1
    
    -- Connect to RunService.Stepped to update the CFrame over several frames
    local connection
    connection = game:GetService("RunService").Stepped:Connect(function()
        if Table["Toggle"] then
            for _, child in ipairs(crates:GetChildren()) do
                changeCFrame(child, stepSize)
            end
        else
            connection:Disconnect()
        end
    end)
end)

window:Section("Teleport")
window:Button("Teleport to Base",function()
    cplayer.CFrame = game:GetService("Workspace").Tycoons.Tycoons[team].Essentials.Spawn.CFrame
end)

window:Dropdown("Teleport to Player",{location = Table,flag = "Dropdown",search = true --[[AddsSearchBar]], list = {"1","2","3","4","5","6","7","8","9","0"} --[[Wont work when PlayerList = true]], PlayerList = true --[[ Turns the list into the players in the server ]]},function()
    print(Table["Dropdown"])
    selectedplayer = Table["Dropdown"]
    cplayer.CFrame = game:GetService("Workspace")[selectedplayer].HumanoidRootPart.CFrame
 end)

window:Section("GamePlay")
window:Slider("WalkSpeed",{location = Table, min = 15, max = 1000, default = 16, precise = true --[[ 0.00 instead of 0 ]], flag = "Slider"},function()
    print("Speed Set to"..Table["Slider"])
    sethiddenproperty(game.Players.LocalPlayer.Character.Humanoid, "WalkSpeed", Table["Slider"])
 end)


 local Player = game:GetService('Players').LocalPlayer
 local UIS = game:GetService('UserInputService')
 
 local jumpHeight = 50
 local isJumpEnabled = false
 
 function Action(Object, Function)
     if Object ~= nil then
         Function(Object)
     end
 end
 
 UIS.InputBegan:connect(function(UserInput)
     if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
         if isJumpEnabled then
             Action(Player.Character.Humanoid, function(self)
                 if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                     Action(self.Parent.HumanoidRootPart, function(self)
                         self.Velocity = Vector3.new(0, jumpHeight, 0)
                     end)
                 end
             end)
         end
     end
 end)
 
 window:Toggle("INF Jump", {location = Table, flag = "Toggle"}, function()
     isJumpEnabled = not isJumpEnabled
     if isJumpEnabled then
         jumpHeight = 50
     else
         jumpHeight = 0
     end
 end)
