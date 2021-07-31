_G.AudioLagSettings = {
    Enabled = true,
    Timer = 1.8
}

while wait(_G.AudioLagSettings.Timer) and _G.AudioLagSettings.Enabled do
    game:GetService("Players").LocalPlayer.Character.BoomBox.Remote:FireServer("PlaySong",7018530796)
end