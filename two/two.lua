local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/dirt",true))()
local Table = {}
local window = Lib:CreateWindow("Zentain Hub")
window:Section("Mega Mansion Tycoon")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if LocalPlayer and LocalPlayer.PlayerGui and LocalPlayer.PlayerGui.UI and LocalPlayer.PlayerGui.UI:FindFirstChild("Store") then
    LocalPlayer.PlayerGui.UI:FindFirstChild("Store"):Destroy()
end


local playerwa = game.Players.LocalPlayer.Character.HumanoidRootPart
local player = game.Players.LocalPlayer
local tycoons = game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons
local team

for _, tycoon in pairs(tycoons:GetChildren()) do
    if tycoon.Owner.Value == player then
        team = tycoon.Name
        break
    end
end

if not team then
    print("team not found")
end

window:Toggle("Toggle", {location = Table, flag = "Toggle"}, function()
    while Table["Toggle"] do
        local giver = tycoons[team].Essentials.Giver
        giver.CanCollide = false
        giver.CFrame = playerwa.CFrame

        local tycoonButtons = game:GetService("Workspace")["Zednov's Tycoon Kit"].Tycoons[team].Buttons

        for _, button in pairs(tycoonButtons:GetChildren()) do
            for _, descendant in pairs(button:GetDescendants()) do
                if descendant.Name == "Head" then
                    descendant.CanCollide = false
                    descendant.CFrame = game.Players.LocalPlayer.Character.Head.CFrame
                end
            end
        end
        wait() -- Wait before checking the toggle again to avoid spamming the server
    end
end)
