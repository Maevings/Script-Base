if not game:IsLoaded() then
    game.Loaded:Wait()
    end

--[[

Credits: 
luci#0004 | pryncelucifer#6936

Info:
Simple script/GUI to display FPS in the bottom right corner   [ Bright Lime Green Color ]

Note:
Sorry for the spacing lmfao ' sum with the GuiToLua messed with it

Line 159 has the drag toggle set it to ' true ' to make it draggable
]]







local ScreenGui = Instance.new("ScreenGui")


local TextLabel = Instance.new("TextLabel")


local UICorner = Instance.new("UICorner")







ScreenGui.Parent = game.CoreGui


ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling



TextLabel.Parent = ScreenGui


TextLabel.BackgroundColor3 = Color3.fromRGB(31, 31, 31)


TextLabel.BackgroundTransparency = 1


TextLabel.BorderSizePixel = 0


TextLabel.Position = UDim2.new(0.979750693, 0, 0.984892488, 0)


TextLabel.Size = UDim2.new(0, 36, 0, 16)


TextLabel.Font = Enum.Font.SourceSans


TextLabel.Text = ""


TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)


TextLabel.TextSize = 20.000 -- Change Text Size   [Default: 20]   



UICorner.Parent = TextLabel




local function SNHSDI_fake_script() -- TextLabel.LocalScript 


	local script = Instance.new('LocalScript', TextLabel)



	game:GetService("RunService").RenderStepped:Connect(function(TimeBetween)


		local FPS = math.floor(1/TimeBetween)


		script.Parent.Text = ""..FPS


	end)


end


coroutine.wrap(SNHSDI_fake_script)()


local function KZIPJKE_fake_script()


	local script = Instance.new('LocalScript', TextLabel)



	local UIS = game:GetService('UserInputService')


	local frame = script.Parent


	local dragToggle = nil


	local dragSpeed = 0.25


	local dragStart = nil


	local starPos = nil


	


	local function updateInput(input)


		local delta = input.Position - dragStart


		local position = UDim2.new(starPos.X.Scale, starPos.X.Offset + delta.X, starPos.Y.Scale, starPos.Y.Offset + delta.Y)


		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()


	end


	


	frame.InputBegan:Connect(function(input)


		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then


			dragToggle = false -- dragToggle = true | makes it draggable


			dragStart = input.Position


			starPos = frame.Position


			input.Changed:Connect(function()


				if input.UserInputState == Enum.UserInputState.End then


					dragToggle = false


				end


			end)


		end


	end)


	


	UIS.InputChanged:Connect(function(input)


		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then


			if dragToggle then


				updateInput(input)


			end


		end


	end)


end


coroutine.wrap(KZIPJKE_fake_script)()

print("⚙: FPS | FramesPerSecond Is Now Shown In The Bottom Right Corner")