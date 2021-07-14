-- Gui to Lua
-- Version: 3.2

-- Instances:

local WizardXD = Instance.new("ScreenGui")
local openlol = Instance.new("Frame")
local Open = Instance.new("TextButton")
local rofl = Instance.new("Frame")
local titler = Instance.new("TextButton")
local close = Instance.new("TextButton")
local inferno = Instance.new("TextButton")
local blizzard = Instance.new("TextButton")
local aqua = Instance.new("TextButton")
local vore = Instance.new("TextButton")

--Properties:

WizardXD.Name = "WizardXD"
WizardXD.Parent = game.CoreGui

rofl.Active = true
rofl.Draggable = true

openlol.Name = "openlol"
openlol.Parent = WizardXD
openlol.BackgroundColor3 = Color3.fromRGB(237, 162, 255)
openlol.Position = UDim2.new(-7.93218642e-05, 0, 0.886659563, 0)
openlol.Size = UDim2.new(0, 77, 0, 34)

Open.Name = "Open"
Open.Parent = openlol
Open.BackgroundColor3 = Color3.fromRGB(237, 162, 255)
Open.Size = UDim2.new(0, 77, 0, 34)
Open.Font = Enum.Font.Arial
Open.Text = "Open"
Open.TextColor3 = Color3.fromRGB(0, 17, 255)
Open.TextSize = 22.000
Open.MouseButton1Click:connect(function()
	openlol.Visible = false
	rofl.Visible = true
end)

rofl.Name = "rofl"
rofl.Parent = WizardXD
rofl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
rofl.Position = UDim2.new(0.389062494, 0, 0.353268445, 0)
rofl.Size = UDim2.new(0, 317, 0, 343)
rofl.Visible = false


titler.Name = "titler"
titler.Parent = rofl
titler.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titler.BackgroundTransparency = 1.000
titler.Position = UDim2.new(0.145110413, 0, 0.122274861, 0)
titler.Size = UDim2.new(0, 228, 0, 24)
titler.Font = Enum.Font.SciFi
titler.Text = "Wizard Tycoon HAX XD"
titler.TextColor3 = Color3.fromRGB(107, 163, 22)
titler.TextSize = 29.000

close.Name = "close"
close.Parent = rofl
close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
close.BackgroundTransparency = 0.100
close.Position = UDim2.new(0.0283911675, 0, 0.023323616, 0)
close.Size = UDim2.new(0, 30, 0, 23)
close.Font = Enum.Font.SourceSans
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 0, 0)
close.TextSize = 50.000
close.MouseButton1Click:connect(function()
	rofl.Visible = false
	openlol.Visible = true
end)

inferno.Name = "inferno"
inferno.Parent = rofl
inferno.BackgroundColor3 = Color3.fromRGB(83, 0, 1)
inferno.Position = UDim2.new(0.0862524956, 0, 0.446064115, 0)
inferno.Size = UDim2.new(0, 262, 0, 37)
inferno.Font = Enum.Font.SciFi
inferno.Text = "Inferno"
inferno.TextColor3 = Color3.fromRGB(255, 34, 37)
inferno.TextSize = 30.000
inferno.MouseButton1Click:connect(function()
	
	local mouse = game.Players.LocalPlayer:GetMouse()
	local pos = mouse.Hit

	game.Workspace.G2FU.Inferno.ActivateSpecial:FireServer(pos)
	wait(.1)
	game.Workspace.G2FU.Inferno.ActivateSpecial:FireServer(pos)
	wait(.1)
	game.Workspace.G2FU.Inferno.ActivateSpecial:FireServer(pos)
	wait(.1)

end)

blizzard.Name = "blizzard"
blizzard.Parent = rofl
blizzard.BackgroundColor3 = Color3.fromRGB(7, 0, 63)
blizzard.Position = UDim2.new(0.0894070715, 0, 0.271137029, 0)
blizzard.Size = UDim2.new(0, 262, 0, 37)
blizzard.Font = Enum.Font.SciFi
blizzard.Text = "Blizzard"
blizzard.TextColor3 = Color3.fromRGB(0, 38, 255)
blizzard.TextSize = 30.000
blizzard.MouseButton1Click:connect(function()
	
	local mouse = game.Players.LocalPlayer:GetMouse()
	local pos = mouse.Hit


	game.Workspace.G2FU.Blizzard.ActivateSpecial:FireServer(pos)
	wait(.1)
	game.Workspace.G2FU.Blizzard.ActivateSpecial:FireServer(pos)
	wait(.1)
	game.Workspace.G2FU.Blizzard.ActivateSpecial:FireServer(pos)
	wait(.1)

end)

aqua.Name = "aqua"
aqua.Parent = rofl
aqua.BackgroundColor3 = Color3.fromRGB(0, 56, 83)
aqua.Position = UDim2.new(0.0862524956, 0, 0.626822233, 0)
aqua.Size = UDim2.new(0, 262, 0, 37)
aqua.Font = Enum.Font.SciFi
aqua.Text = "Aqua"
aqua.TextColor3 = Color3.fromRGB(0, 166, 255)
aqua.TextSize = 30.000
aqua.MouseButton1Click:connect(function()
	
	local mouse = game.Players.LocalPlayer:GetMouse()
	local pos = mouse.Hit


	game.Workspace.G2FU.Aqua.ActivateSpecial:FireServer(pos)
	game.Workspace.G2FU.Aqua.ActivateSpecial:FireServer(pos)
	game.Workspace.G2FU.Aqua.ActivateSpecial:FireServer(pos)
	game.Workspace.G2FU.Aqua.ActivateSpecial:FireServer(pos)
	game.Workspace.G2FU.Aqua.ActivateSpecial:FireServer(pos)

end)

vore.Name = "vore"
vore.Parent = rofl
vore.BackgroundColor3 = Color3.fromRGB(55, 0, 79)
vore.Position = UDim2.new(0.0894070715, 0, 0.798833787, 0)
vore.Size = UDim2.new(0, 262, 0, 37)
vore.Font = Enum.Font.SciFi
vore.Text = "Leech"
vore.TextColor3 = Color3.fromRGB(140, 0, 255)
vore.TextSize = 30.000
vore.MouseButton1Click:connect(function()
	
	local mouse = game.Players.LocalPlayer:GetMouse()
	local pos = mouse.Hit


	game.Workspace.G2FU.Leech.ActivateSpecial:FireServer(pos)
	game.Workspace.G2FU.Leech.ActivateSpecial:FireServer(pos)
	game.Workspace.G2FU.Leech.ActivateSpecial:FireServer(pos)
	game.Workspace.G2FU.Leech.ActivateSpecial:FireServer(pos)
	game.Workspace.G2FU.Leech.ActivateSpecial:FireServer(pos)
	game.Workspace.G2FU.Leech.ActivateSpecial:FireServer(pos)
	game.Workspace.G2FU.Leech.ActivateSpecial:FireServer(pos)
	game.Workspace.G2FU.Leech.ActivateSpecial:FireServer(pos)

end)