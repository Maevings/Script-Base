_G.Mars = true -- Global toggle, run _G.Mars = false to stop the Marspocalypse
wait(5) -- Adjust based on your internet connection, your entire character should be loaded in

local character = game:GetService("Players").LocalPlayer.Character

function weldAttachments(attach1, attach2)
    local weld = Instance.new("Weld")
    weld.Part0 = attach1.Parent
    weld.Part1 = attach2.Parent
    weld.C0 = attach1.CFrame
    weld.C1 = attach2.CFrame
    weld.Parent = attach1.Parent
    return weld
end
 
local function buildWeld(weldName, parent, part0, part1, c0, c1)
    local weld = Instance.new("Weld")
    weld.Name = weldName
    weld.Part0 = part0
    weld.Part1 = part1
    weld.C0 = c0
    weld.C1 = c1
    weld.Parent = parent
    return weld
end
 
local function findFirstMatchingAttachment(model, name)
    for _, child in pairs(model:GetChildren()) do
        if child:IsA("Attachment") and child.Name == name then
            return child
        elseif not child:IsA("Accoutrement") and not child:IsA("Tool") then -- Don't look in hats or tools in the character
            local foundAttachment = findFirstMatchingAttachment(child, name)
            if foundAttachment then
                return foundAttachment
            end
        end
    end
end
 
function addAccoutrement(character1, accoutrement)  
    accoutrement.Parent = character1
    local handle = accoutrement:FindFirstChild("Handle")
    if handle then
        local accoutrementAttachment = handle:FindFirstChildOfClass("Attachment")
        if accoutrementAttachment then
            local characterAttachment = findFirstMatchingAttachment(character1, accoutrementAttachment.Name)
            if characterAttachment then
                weldAttachments(characterAttachment, accoutrementAttachment)
            end
        else
            local head = character1:FindFirstChild("Head")
            if head then
                local attachmentCFrame = CFrame.new(0, 0.5, 0)
                local hatCFrame = accoutrement.AttachmentPoint
                buildWeld("HeadWeld", head, head, handle, attachmentCFrame, hatCFrame)
            end
        end
    end
end

local h = Instance.new("Hat")
local p = Instance.new("Part")
local m = Instance.new("SpecialMesh")
h.Name = "Mars"
p.Parent = h
p.Position = character:findFirstChild("Head").Position
p.Name = "Handle" 
p.formFactor = 0
p.Size = Vector3.new(-0,-0,-1) 
p.BottomSurface = 0 
p.TopSurface = 0 
p.Locked = true 
m.Parent = p
m.MeshId = "rbxassetid://907843392"
m.TextureId = "rbxassetid://907843446"
m.Scale = Vector3.new(0.0375, 0.0375, 0.0375)
m.Offset = Vector3.new(0, -0.45, 0)
h.Parent = game:GetService("ReplicatedStorage")
if (string.lower(game:GetService("Players").LocalPlayer.DisplayName) == "mars") then
    addAccoutrement(character, h)
end
h.AttachmentPos = Vector3.new(0,-0.1,0.03) -- Adjust position

local h2 = Instance.new("Hat")
local p2 = Instance.new("Part")
local m2 = Instance.new("SpecialMesh")
h2.Name = "Fedora"
p2.Parent = h2
p2.Position = character:findFirstChild("Head").Position
p2.Name = "Handle" 
p2.formFactor = 0
p2.Size = Vector3.new(-0,-0,-1) 
p2.BottomSurface = 0 
p2.TopSurface = 0 
p2.Locked = true 
m2.Parent = p2
m2.MeshId = "http://www.roblox.com/asset/?id=72081410"
m2.TextureId = "http://www.roblox.com/asset/?id=259418230"
m2.Scale = Vector3.new(1.45, 1.45, 1.45)
m2.Offset = Vector3.new(0, 0.3, -0.1)
h2.Parent = game:GetService("ReplicatedStorage")
if (string.lower(game:GetService("Players").LocalPlayer.DisplayName) == "mars") then
    addAccoutrement(character, h2)
end
h2.AttachmentPos = Vector3.new(0,-0.1,0.03) -- Adjust position

workspace.ChildAdded:Connect(function(child)
    if game:GetService("Players"):FindFirstChild(child.name) then
        if string.lower(game:GetService("Players"):FindFirstChild(child.name).DisplayName) == "mars" and _G.Mars == true then
            child.ChildAdded:Connect(function(child2)
                if child2.Name == "Head" then
                    print("accouting")
                    wait(2)
                    addAccoutrement(child, h:Clone())
                    addAccoutrement(child, h2:Clone())
                end
            end)
        end
    end
end)