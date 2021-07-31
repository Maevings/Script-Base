-- Made By LunaGotAim#0001

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Aimbot = Instance.new("TextButton")
local ESP = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(-2.23517418e-08, 0, 0.608646154, 0)
Frame.Size = UDim2.new(0, 384, 0, 246)
Frame.Active = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0, 384, 0, 50)
TextLabel.Font = Enum.Font.Cartoon
TextLabel.Text = "CloudWare [Arsenal]"
TextLabel.TextColor3 = Color3.fromRGB(255, 0, 127)
TextLabel.TextSize = 32.000

Aimbot.Name = "Aimbot"
Aimbot.Parent = Frame
Aimbot.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Aimbot.Position = UDim2.new(0.0911458284, 0, 0.34959349, 0)
Aimbot.Size = UDim2.new(0, 123, 0, 35)
Aimbot.Font = Enum.Font.Cartoon
Aimbot.Text = "Aimbot"
Aimbot.TextColor3 = Color3.fromRGB(255, 0, 255)
Aimbot.TextSize = 22.000
Aimbot.MouseButton1Down:connect(function()
	local dwCamera = workspace.CurrentCamera
	local dwRunService = game:GetService("RunService")
	local dwUIS = game:GetService("UserInputService")
	local dwEntities = game:GetService("Players")
	local dwLocalPlayer = dwEntities.LocalPlayer
	local dwMouse = dwLocalPlayer:GetMouse()

	local settings = {
		Aimbot = true,
		Aiming = false,
		Aimbot_AimPart = "Head",
		Aimbot_TeamCheck = true,
		Aimbot_Draw_FOV = true,
		Aimbot_FOV_Radius = 200,
		Aimbot_FOV_Color = Color3.fromRGB(255,255,255)
	}

	local fovcircle = Drawing.new("Circle")
	fovcircle.Visible = settings.Aimbot_Draw_FOV
	fovcircle.Radius = settings.Aimbot_FOV_Radius
	fovcircle.Color = settings.Aimbot_FOV_Color
	fovcircle.Thickness = 1
	fovcircle.Filled = false
	fovcircle.Transparency = 1

	fovcircle.Position = Vector2.new(dwCamera.ViewportSize.X / 2, dwCamera.ViewportSize.Y / 2)

	dwUIS.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton2 then
			settings.Aiming = true
		end
	end)

	dwUIS.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton2 then
			settings.Aiming = false
		end
	end)

	dwRunService.RenderStepped:Connect(function()

		local dist = math.huge
		local closest_char = nil

		if settings.Aiming then

			for i,v in next, dwEntities:GetChildren() do 

				if v ~= dwLocalPlayer and
					v.Character and
					v.Character:FindFirstChild("HumanoidRootPart") and
					v.Character:FindFirstChild("Humanoid") and
					v.Character:FindFirstChild("Humanoid").Health > 0 then

					if settings.Aimbot_TeamCheck == true and
						v.Team ~= dwLocalPlayer.Team or
						settings.Aimbot_TeamCheck == false then

						local char = v.Character
						local char_part_pos, is_onscreen = dwCamera:WorldToViewportPoint(char[settings.Aimbot_AimPart].Position)

						if is_onscreen then

							local mag = (Vector2.new(dwMouse.X, dwMouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude

							if mag < dist and mag < settings.Aimbot_FOV_Radius then

								dist = mag
								closest_char = char

							end
						end
					end
				end
			end

			if closest_char ~= nil and
				closest_char:FindFirstChild("HumanoidRootPart") and
				closest_char:FindFirstChild("Humanoid") and
				closest_char:FindFirstChild("Humanoid").Health > 0 then

				dwCamera.CFrame = CFrame.new(dwCamera.CFrame.Position, closest_char[settings.Aimbot_AimPart].Position)
			end
		end
	end)
end)

ESP.Name = "ESP"
ESP.Parent = Frame
ESP.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ESP.Position = UDim2.new(0.588541687, 0, 0.34959349, 0)
ESP.Size = UDim2.new(0, 123, 0, 35)
ESP.Font = Enum.Font.Cartoon
ESP.Text = "ESP"
ESP.TextColor3 = Color3.fromRGB(255, 0, 255)
ESP.TextSize = 22.000
ESP.MouseButton1Down:connect(function()
	loadstring(game:HttpGet('https://pastebin.com/raw/zKjj0TQD'))()
end)

Close.Name = "Close"
Close.Parent = Frame
Close.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Close.BorderColor3 = Color3.fromRGB(25, 25, 25)
Close.Position = UDim2.new(0.908854187, 0, 0, 0)
Close.Size = UDim2.new(0, 35, 0, 35)
Close.Font = Enum.Font.Cartoon
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 0, 255)
Close.TextSize = 22.000

TextButton.Parent = ScreenGui
TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.Position = UDim2.new(0, 0, 0.560864627, 0)
TextButton.Size = UDim2.new(0, 104, 0, 23)
TextButton.Font = Enum.Font.Cartoon
TextButton.Text = "Open"
TextButton.TextColor3 = Color3.fromRGB(255, 0, 255)
TextButton.TextSize = 26.000
TextButton.Active = true

-- Scripts:

local function RNKWQJ_fake_script() -- Close.LocalScript 
	local script = Instance.new('LocalScript', Close)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.Visible = false
	end)
	
	
end
coroutine.wrap(RNKWQJ_fake_script)()
local function ASBBZ_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.Frame.Visible = true
	end)
	
end
coroutine.wrap(ASBBZ_fake_script)()
