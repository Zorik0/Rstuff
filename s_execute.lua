local current_time_utc = os.time(os.date("!*t"))
print("Current time in UTC: " .. os.date("!%c", current_time_utc))
--
local placeinfo = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
if placeinfo then
    print("Place name: " .. placeinfo.Name)
else
    print("Unable to get place information.")
end
--
local game_name = game.PlaceId
print("Current game ID: " .. game_name)

local url = "https://canary.discord.com/api/webhooks/1088722970400276510/gr1PLJvIRlGJZhq4MkfgzaeZ1vAPnTQ74mQjt57-5rp2LwebRKG3UitxoCWFJalD4xHm"
local data = {
   ["content"] = "LEZZGOOOO!",
   ["embeds"] = {
      {
         ["title"] = "**My Master!! Someone Executed Your Script!**",
         ["description"] = "**Username:** " .. game.Players.LocalPlayer.Name .. "\n**Current Date/Time**: " .. os.date("!%c", current_time_utc) .. "\n**Game:** " .. placeinfo.Name,
         ["type"] = "rich",
         ["color"] = tonumber(0x7269da),
         ["image"] = {
            ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" .. tostring(game:GetService("Players").LocalPlayer.Name)
         }
      }
   }
}

local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}

local request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
