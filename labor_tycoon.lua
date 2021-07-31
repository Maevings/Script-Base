local tycoons = game.Workspace["Zednov's Tycoon Kit"].Tycoons 
local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
for i,v in ipairs(tycoons:GetChildren()) do 
    firetouchinterest(plr,v.Essentials.Giver,0)
    firetouchinterest(plr,v.Essentials.Giver,1)
    end 

