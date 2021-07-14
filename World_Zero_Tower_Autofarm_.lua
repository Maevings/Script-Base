-- if you know how to make the auto farming faster please send your script to me (i want to learn it lol)
-- bad script
--[[
    Prison Tower = 21
    Atlantis Tower = 23
    Mezuvian Tower = 27
]]

getgenv().Tower = 27
getgenv().RemoveDamage = false
getgenv().AutoChest = true
getgenv().CoinMagnet = true

getgenv().Common = false
getgenv().Uncommon = false
getgenv().Rare = false
getgenv().Epic = false
getgenv().Legendary = false

loadstring(game:HttpGet("https://raw.githubusercontent.com/LuckyToT/Roblox/main/World%20Zero/Tower%20AutoFarm.lua", true))()
