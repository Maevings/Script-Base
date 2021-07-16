while wait(0) do
local plr = game:GetService("Players").LocalPlayer
plr.Character.Powers.Gravity.RemoteEvent:FireServer("GravityPower6","StartCharging",plr.Character.HumanoidRootPart.CFrame,workspace.IslandSnowyMountains.Stone.Stone,100)
plr.Character.Powers.Gravity.RemoteEvent:FireServer("GravityPower6","StopCharging",plr.Character.HumanoidRootPart.CFrame,workspace.IslandSnowyMountains.Stone.Stone,100)
end