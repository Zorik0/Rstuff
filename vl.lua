local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/dirt",true))()
local Table = {}
local window = Lib:CreateWindow("Vehicle Legends")
window:Section("Auto Farm Eggs")

-- get the eggs folder in Workspace
local eggsFolder = game:GetService("Workspace").Eggs

-- define the toggle function
window:Toggle("Egg Farm", {location = Table, flag = "Toggle"}, function()
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

window:Button("Vehicle Fly [X]",function()
    local FlyKey = Enum.KeyCode.V
local SpeedKey = Enum.KeyCode.LeftControl

local SpeedKeyMultiplier = 3
local FlightSpeed = 999
local FlightAcceleration = 4
local TurnSpeed = 16



local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local User = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserCharacter = nil
local UserRootPart = nil
local Connection = nil


workspace.Changed:Connect(function()
    Camera = workspace.CurrentCamera
end)

local setCharacter = function(c)
    UserCharacter = c
    UserRootPart = c:WaitForChild("HumanoidRootPart")
end

User.CharacterAdded:Connect(setCharacter)
if User.Character then
    setCharacter(User.Character)
end

local CurrentVelocity = Vector3.new(0,0,0)
local Flight = function(delta)
    local BaseVelocity = Vector3.new(0,0,0)
    if not UserInputService:GetFocusedTextBox() then
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
        end
    	if UserInputService:IsKeyDown(SpeedKey) then
    		BaseVelocity = BaseVelocity * SpeedKeyMultiplier
    	end
    end
    if UserRootPart then
        local car = UserRootPart:GetRootPart()
        if car.Anchored then return end
        if not isnetworkowner(car) then return end
        CurrentVelocity = CurrentVelocity:Lerp(
            BaseVelocity,
            math.clamp(delta * FlightAcceleration, 0, 1)
        )
        car.Velocity = CurrentVelocity + Vector3.new(0,2,0)
        if car ~= UserRootPart then
            car.RotVelocity = Vector3.new(0,0,0)
            car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                car.Position,
                car.Position + CurrentVelocity + Camera.CFrame.LookVector
            ), math.clamp(delta * TurnSpeed, 0, 1))
        end
    end
end

UserInputService.InputBegan:Connect(function(userInput,gameProcessed)
    if gameProcessed then return end
    if userInput.KeyCode == FlyKey then
        if Connection then
            StarterGui:SetCore("SendNotification",{
                Title = "Zentain Hub",
                Text = "Flight disabled"
            })
            Connection:Disconnect()
            Connection = nil
        else
            StarterGui:SetCore("SendNotification",{
                Title = "Zentain Hub",
                Text = "Flight enabled"
            })
            CurrentVelocity = UserRootPart.Velocity
            Connection = RunService.Heartbeat:Connect(Flight)
        end
    end
end)

StarterGui:SetCore("SendNotification",{
    Title = "Zentain Hub",
    Text = "Loaded successfully"
})

 end)
window:Section("Teleports")
local character = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

window:Button("Car Dealership",function()
    character.CFrame = game:GetService("Workspace").Dealership.Line.CFrame
 end)

window:Button("Plane Dealership",function()
   character.CFrame = game:GetService("Workspace").Map.Static.Buildings.Desert.Runway.Part.CFrame
end)

window:Button("Garage",function()
  character.CFrame = game:GetService("Workspace").DiscoveryZones.Zone2.CFrame
end)

window:Button("Races",function()
    character.CFrame = game:GetService("Workspace").DiscoveryZones.Zone1.CFrame
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
 
