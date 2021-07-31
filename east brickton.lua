--eT--

_G.poop = true --set this to false after u already executed if u want the script to stop

warn("loaded")

local tweenspeed = 500

local isTweening = false;
local function tweenplayer(cframe)
   repeat wait() until game.Players.LocalPlayer.Character;
   isTweening = true
   and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
   and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
   and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
   local TweenInfo = TweenInfo.new(((cframe.p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)/tweenspeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false)
   local Objective = {CFrame = cframe}
   local TweenPlayer = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo, Objective)
   --game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
   TweenPlayer:Play()
   TweenPlayer.Completed:Wait(); wait(1);
   --game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
   isTweening = false;
end
--if game:GetService("Workspace").GameMap.Buildings.LitFits.GlassLightPARTCLOSED.Transparency > .05 or game:GetService("Workspace").GameMap.Buildings.LitFits.GlassLightPARTCLOSED.Reflectance > .7 then
   tweenplayer(CFrame.new(-6,7,188)) --lit store
   --
   wait(3)
   local RS = game:GetService("ReplicatedStorage")
   --


   local A_1 = "Lit Fits"
   local A_2 = "Enter"
   local A_3 = game:GetService("Workspace").GameMap.Buildings.LitFits.DoorScriptShop.Greenzone
   local A_4 = game:GetService("Workspace").GameMap.Buildings.LitFits.DoorScriptShop
   RS.Events.TeleportService:FireServer(A_1, A_2, A_3, A_4)
   if RS.Scenes.Interiors:FindFirstChild("LitFits") then
       RS.Scenes.Interiors:FindFirstChild("LitFits").Parent = workspace.Interiors
   end
   wait(3)
   --
   tweenplayer(CFrame.new(2007.05957, -244.650055, 28.7871609, -0.122768477, -4.28530456e-08, -0.992435396, -2.94921971e-08, 1, -3.95313755e-08, 0.992435396, 2.44158933e-08, -0.122768477)) --cashier area
   local A_1 = "Start"
   local A_2 = game:GetService("Workspace").NPC.LitFitsNPC.NPCTag.Dialogue
   local Event = game:GetService("ReplicatedStorage").Events.NPCService
   Event:FireServer(A_1, A_2)
   --
   wait(.5)
   local A_1 = "Mop"
   local Event = game:GetService("ReplicatedStorage").Events.NPCService
   Event:FireServer(A_1)
   --
   wait(.5)
   local A_1 = "Terminate"
   local Event = game:GetService("ReplicatedStorage").Events.NPCService
   Event:FireServer(A_1)
   local o
   while _G.poop do
       --if game:GetService("Workspace").GameMap.Buildings.LitFits.GlassLightPARTCLOSED.Transparency > .05 or game:GetService("Workspace").GameMap.Buildings.LitFits.GlassLightPARTCLOSED.Reflectance > ..7 then
           o = 0
           --]]
           wait()

           game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Mop)

           wait()
           --]]
           for i,v in pairs(game:GetService("Workspace").Interiors.LitFits.Job:GetChildren()) do
               local A_1 = v
               local Event = game:GetService("Players").LocalPlayer.Character.Mop.RemoteEvent
               v.Decal.Transparency = 0
               tweenplayer(CFrame.new(v.Position)+Vector3.new(0,3,0))
               game:GetService("Players").LocalPlayer.Character.LowerTorso.Anchored = true
               game:GetService("Players").LocalPlayer.Character.Humanoid.TargetPoint = v.Position
               v.Decal.Transparency = 1
               Event:FireServer(A_1)
               wait(4.5) --change this to 4.2 if ur not running it in the background
               game:GetService("Players").LocalPlayer.Character.LowerTorso.Anchored = false
           end
           --
           game:GetService("Players").LocalPlayer.Character.Humanoid:UnequipTools()
           tweenplayer(CFrame.new(2007.05957, -244.650055, 28.7871609, -0.122768477, -4.28530456e-08, -0.992435396, -2.94921971e-08, 1, -3.95313755e-08, 0.992435396, 2.44158933e-08, -0.122768477)) --cashier area
           --
           local A_1 = "Start"
           local A_2 = game:GetService("Workspace").NPC.LitFitsNPC.NPCTag.Dialogue
           local Event = game:GetService("ReplicatedStorage").Events.NPCService
           Event:FireServer(A_1, A_2)

           wait()
           --[[
           mousemoveabs(1132, 995) --ui button
           wait(.5)
           mouse1click()
           --]]
           local A_1 = "LitFitsJobDone"
           local Event = game:GetService("ReplicatedStorage").Events.NPCService
           Event:FireServer(A_1)

           wait()

           local A_1 = "Terminate"
           local Event = game:GetService("ReplicatedStorage").Events.NPCService
           Event:FireServer(A_1)


           for i,v in pairs(game:GetService("Workspace").Interiors.LitFits.Job:GetChildren()) do
               v.Decal.Transparency = 0
           end
           --[[
       else
           if o ~= 1 then
               o=o+1
               warn("shop closed! wait for the shop to open or server hop (shop open 7 am - 10 pm)")
           end
       end
       --]]
       wait()
   end
--[[
else
   warn("shop closed! wait for the shop to open or server hop (shop open 7 am - 10 pm)")
end
--]]