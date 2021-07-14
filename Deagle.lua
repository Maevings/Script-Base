local plr = game.Players.LocalPlayer
local usp = game:GetService("UserInputService")
local Char = plr.Character
local AnimID = "rbxasset://204062532"
local fire = "rbxasset://7057991482"
local sound = Instance.new("Sound",Char.Torso)
sound.SoundId = fire
local Plr = game:GetService("Players").LocalPlayer -- you
local Player = game:GetService("Players").LocalPlayer-- you
local Character = Player.Character-- your character
local function PointGunIDLE(i,v,pos,rot) -- align function
    local att0 = Instance.new("Attachment", Character["Left Arm"])
    att0.Name = "asdf"
    att0.Position = Vector3.new(0,0,0)
    local att1 = Instance.new("Attachment", Character["Torso"])
    att1.Name = "asdf"
    att1.Position = Vector3.new(-1.5,1,-1.5)--position
    att1.Rotation = Vector3.new(100, 75, 10)--rotation
    local AP = Instance.new("AlignPosition", Character["Left Arm"])
    AP.Name = "asdf"
    AP.Attachment0 = att0
    AP.Attachment1 = att1
    AP.RigidityEnabled = false
    AP.ReactionForceEnabled = false
    AP.ApplyAtCenterOfMass = true
    AP.MaxForce = 9999999
    AP.MaxVelocity = math.huge
    AP.Responsiveness = 1000000000000
    local AO = Instance.new("AlignOrientation", Character["Left Arm"])
    AO.Name = "asdf"
    AO.Attachment0 = att0
    AO.Attachment1 = att1
    AO.ReactionTorqueEnabled = true
    AO.PrimaryAxisOnly = false
    AO.MaxTorque = 9999999
    AO.MaxAngularVelocity = math.huge
    AO.Responsiveness = 10000000000000
end
local function PointGunShoot(i,v,pos,rot) -- align function
    local att0 = Instance.new("Attachment", Character["Left Arm"])
    att0.Name = "asdf"
    att0.Position = Vector3.new(0,0,0)
    local att1 = Instance.new("Attachment", Character["Torso"])
    att1.Name = "asdf"
    att1.Position = Vector3.new(-1.5,1,-2)--position
    att1.Rotation = Vector3.new(100, 75, 40)--rotation
    local AP = Instance.new("AlignPosition", Character["Left Arm"])
    AP.Name = "asdf"
    AP.Attachment0 = att0
    AP.Attachment1 = att1
    AP.RigidityEnabled = false
    AP.ReactionForceEnabled = false
    AP.ApplyAtCenterOfMass = true
    AP.MaxForce = 9999999
    AP.MaxVelocity = math.huge
    AP.Responsiveness = 1000000000000
    local AO = Instance.new("AlignOrientation", Character["Left Arm"])
    AO.Name = "asdf"
    AO.Attachment0 = att0
    AO.Attachment1 = att1
    AO.ReactionTorqueEnabled = true
    AO.PrimaryAxisOnly = false
    AO.MaxTorque = 9999999
    AO.MaxAngularVelocity = math.huge
    AO.Responsiveness = 10000000000000
end
Character["Left Arm"]:BreakJoints()--breaks the joints so you can customize its position
PointGunIDLE()
usp.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.E then
            sound:Play()
            PointGunShoot() 
            wait(1)
            PointGunIDLE()
        end
    end
end)
PointGunIDLE()
wait(3)
PointGunShoot()
wait(1)
PointGunIDLE()







