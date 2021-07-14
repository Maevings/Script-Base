local ts = game:GetService("TweenService")
local player = game.Players.LocalPlayer

for i, v in pairs(workspace.Trinkets:GetChildren()) do
    if v.Name == "EpicSpawn" or "RareSpawn" then
        local tweenInfo = TweenInfo.new(
            3, -- Time
            Enum.EasingStyle.Linear, -- EasingStyle
            Enum.EasingDirection.Out, -- EasingDirection
            0, -- RepeatCount (when less than zero the tween will loop indefinitely)
            false, -- Reverses (tween will reverse once reaching it's goal)
            0 -- DelayTime
        )
        local tween = ts:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = workspace.Trinkets.EpicSpawn.CFrame})

        tween:Play()
    end
end