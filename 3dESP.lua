local gui = Instance.new("ScreenGui",game.CoreGui)
local vp = Instance.new("ViewportFrame",gui)
vp.CurrentCamera = workspace.CurrentCamera
vp.Position = UDim2.new(0,0,0,-35)
vp.Size = UDim2.new(1,0,1,35)
vp.BackgroundTransparency = 1
local replicatelist = {} --part=partclone
local clonelist = {} --char=clone
local function addplayer(plr)
if plr ~= game.Players.LocalPlayer then
repeat wait() until plr.Character ~= nil
local char = plr.Character
char.Archivable = true
local clone = char:Clone()
clonelist[plr] = clone
char.Archivable = false
clone.Parent = vp
clone.Name = ""
for i,v in pairs(char:GetChildren()) do
if v:IsA("BasePart") then
replicatelist[v] = clone[v.Name]
elseif v.ClassName == "Humanoid" then 
replicatelist[v] = clone[v.Name]
end
end
end
end
local function removeplayer(plr)
for i,v in pairs(plr:GetChildren()) do
if replicatelist[v] then replicatelist[v] = nil end
end
if clonelist[plr] then
clonelist[plr]:Destroy()
end
end
local function initplayer(plr)
addplayer(plr)
plr.CharacterAdded:Connect(function(char)
addplayer(plr)
end)
plr.CharacterRemoving:Connect(function(char)
removeplayer(plr)
end)
end
for i,v in pairs(game.Players:GetPlayers()) do
initplayer(v)
end
game.Players.PlayerAdded:Connect(initplayer)
game:GetService("RunService").RenderStepped:Connect(function()
for orig,clone in pairs(replicatelist) do
if orig ~= nil and clone ~= nil then
if orig:IsA("BasePart") then
pcall(function() clone.CFrame = orig.CFrame end)
else
pcall(function() clone.Health = orig.Health; clone.MaxHealth = orig.MaxHealth end)
end
end
end
end)