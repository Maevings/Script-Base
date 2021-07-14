--[[
setsale("flower") = sells flowers with color you selected
setsale("spring") = sells radishes
setsale("fall") = sells pumpkins
]]--
--DOESNT MATTER WHAT NPC IS ON YOUR ISLAND

local color = "red" -- ONLY red OR blue OR white (changes color of flower on sale)
local villager = workspace.Islands[game.Players.LocalPlayer.UserId.."-island"].Entities.villager
function setsale(val)
   if val == "flower" then
       villager.MindID.Value = "rose_"..color
       villager.VillagerID.Value = "florist"
       villager.MerchantId.Value = "florist"
   elseif val == "spring" then
       villager.MindID.Value = "spring_mind"
       villager.VillagerID.Value = "seeds"
       villager.MerchantId.Value = "seeds"
   elseif val == "fall" then
    villager.MindID.Value = "autumn_mind"
       villager.VillagerID.Value = "seeds"
       villager.MerchantId.Value = "seeds"
    end
end
setsale("flower") --Edit this to fall/flowers/spring depending on what you want