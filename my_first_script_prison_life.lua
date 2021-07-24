
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.349090904, 0, 0.429394782, 0)
Frame.Size = UDim2.new(0, 373, 0, 236)
Frame.Active = true
Frame.Draggable = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 127)
TextButton.Position = UDim2.new(0, 0, 0.733050942, 0)
TextButton.Size = UDim2.new(0, 373, 0, 63)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "AK-47"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000
TextButton.MouseButton1Down:connect(function()
	local args = {
		[1] = workspace.Prison_ITEMS.giver:FindFirstChild("AK-47").ITEMPICKUP
	}

	workspace.Remote.ItemHandler:InvokeServer(unpack(args))
end)

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 0, 127)
TextButton_2.Position = UDim2.new(0, 0, 0.440677971, 0)
TextButton_2.Size = UDim2.new(0, 373, 0, 67)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "Remington"
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextSize = 14.000
TextButton_2.MouseButton1Down:connect(function()
	local args = {
		[1] = workspace.Prison_ITEMS.giver:FindFirstChild("Remington 870").ITEMPICKUP
	}

	workspace.Remote.ItemHandler:InvokeServer(unpack(args))

end)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 127)
TextBox.Size = UDim2.new(0, 373, 0, 50)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = "JFK's PL hub 0.01"
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000