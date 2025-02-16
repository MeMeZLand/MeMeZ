local Supports = {}
local Scriptname = Supports[game.PlaceId] or "Universal.lua"
getgenv().MeMeZStorage = "https://raw.githubusercontent.com/MeMeZLand/MeMeZ/refs/heads/main/"
loadstring(game:HttpGet(getgenv().MeMeZStorage.."Scripts/"..Scriptname))()
