local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/dirt",true))()
local Table = {}
local window = Lib:CreateWindow("ZENTAIN HUB")
window:Section("Universal")
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
