local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Lifting Simulator GUI", "Ocean")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main")
Section:NewButton("Auto Lift", "Toggles Auto Lift", function(v)
    getgenv().autolift = v
    while true do
       _G.Lift = true
 
while _G.Lift do
wait(0.00002)
local table_1 = {
[1] = 'GainMuscle'
};
local Target = game:GetService("ReplicatedStorage").RemoteEvent;
Target:FireServer(table_1);
end

    end
end)
Section:NewButton("Safe Zone", "Takes You To A Safe Zone", function(b)
    getgenv().safezone = b
local plr = game.Players
local lplr = plr.LocalPlayer
local lchar = lplr.Character
local HRP = lchar.HumanoidRootPart
 
HRP.CFrame = CFrame.new(-100, 100, -10000)
 
local C = Instance.new("Part")
C.Parent = workspace
C.CFrame = CFrame.new(-100, 50, -10000)
C.Size = Vector3.new(1000000, 100, 10000000)
C.Anchored = true
end)
Section:NewButton("AutoSell", "AutoSell's Your Muscle", function(n)
    getgenv().AutoSell = n
_G.Sale = true
 
while _G.Sale do
wait()
local table_1 = {
[1] = 'SellMuscle'
};
local Target = game:GetService("ReplicatedStorage").RemoteEvent;
Target:FireServer(table_1);
end
end)
local Tab = Window:NewTab("Player")
local Section = Tab:NewSection("Player")
Section:NewSlider("Walkspeed", "Changes your walkspeed", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section:NewSlider("Jumppower", "Changes your jumppower", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)