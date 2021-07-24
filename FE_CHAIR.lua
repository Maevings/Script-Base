local plr = game.Players.LocalPlayer
game:GetService("RunService").Stepped:Connect(function()
   setsimulationradius(9e9,9e9)
   plr.ReplicationFocus = workspace
   settings().Physics.AllowSleep = false
end)

local runservice=game:service"RunService";
local player=game:service"Players"["LocalPlayer"];
local character=player["Character"];
character["Head"]:FindFirstChildOfClass"SpecialMesh":Destroy();

character["Humanoid"].HipHeight=0;
character["Left Leg"]:BreakJoints();
character["Right Leg"]:BreakJoints();
character["Left Arm"]:BreakJoints();
character["Right Arm"]:BreakJoints();
while runservice["Heartbeat"]:Wait() do
    character["Left Leg"].CFrame=character["HumanoidRootPart"].CFrame*CFrame.new(0.5,-1.5,-0.5);
    character["Right Leg"].CFrame=character["HumanoidRootPart"].CFrame*CFrame.new(-0.5,-1.5,-0.5);
    character["Left Arm"].CFrame=character["HumanoidRootPart"].CFrame*CFrame.new(-0.5,-1.5,-1.5);
    character["Right Arm"].CFrame=character["HumanoidRootPart"].CFrame*CFrame.new(0.5,-1.5,-1.5);
end

character["Head"]:FindFirstChildOfClass"SpecialMesh":Destroy(); 