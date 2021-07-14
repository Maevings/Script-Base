while wait(0.1) do
    game.ReplicatedStorage.Remotes.Sync:InvokeServer("Clay", "Server2")
end