local players = game:GetService("Players")
local cam = game:GetService("Workspace").CurrentCamera
local player = players.LocalPlayer
local mouse = player:GetMouse()
local aiming = false

local function FindClosestPlayer()
	local dist = math.huge
	local playerToReturn

	for _, target in pairs(players:GetPlayers()) do
		if target.Character and target.Character:FindFirstChild("Humanoid") and target ~= player and target.Character.Humanoid.Health > 0 then
			local distance = (player.Character.HumanoidRootPart.Position - target.Character.HumanoidRootPart.Position).Magnitude

			if distance < dist then
				dist = distance
				playerToReturn = target
			end
		end
	end
	return playerToReturn
end

mouse.Button2Down:Connect(function()
	aiming = true
end)

mouse.Button2Up:Connect(function()
	aiming = false
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if aiming then
		local target = FindClosestPlayer()
		if target then
			cam.CFrame = CFrame.new(cam.CFrame.Position, target.Character.HumanoidRootPart.Position)
		end
	end
end)