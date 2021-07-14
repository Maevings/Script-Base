-- Made by TempedOut#9532


local UIS = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer
local char = player.Character
local hmrp = char.HumanoidRootPart

chestPool = {
	
	bronzeTreasure = "Bronze Treasure Chest",
	silverTreasure = "Silver Treasure Chest",
	goldTreasure = "Gold Treasure Chest",
	smallExp = "Small Exp Chest",
	mediumExp = "Medium Exp Chest",
	largeExp = "Large Exp Chest"
	
}

UIS.InputBegan:Connect(function(input)
	
	if input.KeyCode == Enum.KeyCode.T then
		
		for i, chest in pairs(game:GetService("Workspace").Interactions.MiscPoints:GetChildren()) do
			
			for i, values in pairs(chestPool) do
				
				if chest:FindFirstChild("Value").Value == values and chest:FindFirstChild("Decal").Color3 ~= Color3.fromRGB(255,0,0) then
					
					hmrp.CFrame = chest.CFrame * CFrame.new(3,10,0)
					
					local args = {
                        [1] = "SentArgument"
                    }
                    
                    
                    wait(3)
                
                    workspace.Interactions.MiscPoints:FindFirstChild(chest.Name).RemoteEvent:FireServer(unpack(args))

					 wait(3)
				end
				
			end
			
		end
		
		
	end
	
end)