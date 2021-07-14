local UseRibCage = false

local Player = game.Players.LocalPlayer
local Character = Player.Character

function Roka() 
    local ohString1 = "EndDialogue"
    local ohTable2 = {
    	["NPC"] = "Rokakaka",
    	["Option"] = "Option1",
    	["Dialogue"] = "Dialogue2"
    }
    Character.RemoteEvent:FireServer(ohString1, ohTable2)
end

function Arrow()
    local ohString1 = "EndDialogue"
    local ohTable2 = {
    	["NPC"] = "Mysterious Arrow",
    	["Option"] = "Option1",
    	["Dialogue"] = "Dialogue2"
    }
    
    Character.RemoteEvent:FireServer(ohString1, ohTable2)
    print("-- Used Arrow --")
end

function Worthiness()
    
    local ohString1 = "LearnSkill"
    local ohTable2 = {
    	["Skill"] = "Agility I",
    	["SkillTreeType"] = "Character"
    }
    
    Character.RemoteFunction:InvokeServer(ohString1, ohTable2)
    
    ohTable2["Skill"] = "Agility II"
    Character.RemoteFunction:InvokeServer(ohString1, ohTable2)
    ohTable2["Skill"] = "Agility III"
    Character.RemoteFunction:InvokeServer(ohString1, ohTable2)
    ohTable2["Skill"] = "Worthiness I"
    Character.RemoteFunction:InvokeServer(ohString1, ohTable2)
    ohTable2["Skill"] = "Worthiness II"
    Character.RemoteFunction:InvokeServer(ohString1, ohTable2)
    
    if UseRibCage == true then
        ohTable2["Skill"] = "Worthiness III"
        Character.RemoteFunction:InvokeServer(ohString1, ohTable2)
        ohTable2["Skill"] = "Worthiness IV"
        Character.RemoteFunction:InvokeServer(ohString1, ohTable2)
        ohTable2["Skill"] = "Worthiness V"
        Character.RemoteFunction:InvokeServer(ohString1, ohTable2)
    end
end

function RibCage()
    local ohString1 = "EndDialogue"
    local ohTable2 = {
    	["Dialogue"] = "Dialogue2",
    	["NPC"] = "Rib Cage of The Saint's Corpse",
    	["Option"] = "Option1"
    }
    Character.RemoteEvent:FireServer(ohString1, ohTable2)
end


if Player.PlayerStats.Stand.Value == "None" then
    Worthiness()
    if UseRibCage == true then
        RibCage()
    else
        Arrow()
    end
else 
    Roka()
end

