local png = "input.png" --image in workspace folder

local function StrToTable(s)
   local t = {}
   s:gsub(".", function(c) table.insert(t, c) return c end)
   return t
end

getfenv().bit32 = bit

local Unfilter = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Modules/Unfilter.lua"))()
local BinaryReader = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Modules/BinaryReader.lua"))()
local Deflate = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Modules/Deflate.lua"))()

local PNG = {}
PNG.__index = PNG

local chunks = {
	IDAT = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Chunks/IDAT.lua"))(),
	IEND = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Chunks/IEND.lua"))(),
	IHDR = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Chunks/IHDR.lua"))(),
	PLTE = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Chunks/PLTE.lua"))(),
	bKGD = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Chunks/bKGD.lua"))(),
	cHRM = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Chunks/cHRM.lua"))(),
	gAMA = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Chunks/gAMA.lua"))(),
	sRGB = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Chunks/sRGB.lua"))(),
	tEXt = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Chunks/tEXt.lua"))(),
	tIME = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Chunks/tIME.lua"))(),
	tRNS = loadstring(game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-PNG-Library/master/Chunks/tRNS.lua"))()
}

local function getBytesPerPixel(colorType)
	if colorType == 0 or colorType == 3 then
		return 1
	elseif colorType == 4 then
		return 2
	elseif colorType == 2 then
		return 3
	elseif colorType == 6 then
		return 4
	else
		return 0
	end
end
local function clampInt(value, min, max)
	local num = tonumber(value) or 0
	num = math.floor(num + 0.5)
	return math.clamp(num, min, max)
end
local function indexBitmap(file, x, y)
	local width = file.Width
	local height = file.Height
	local x = clampInt(x, 1, width)
	local y = clampInt(y, 1, height)
	local bitmap = file.Bitmap
	local bpp = file.BytesPerPixel
	local i0 = ((x - 1) * bpp) + 1
	local i1 = i0 + bpp
	return bitmap[y], i0, i1
end

function PNG:GetPixel(x, y)
	local row, i0, i1 = indexBitmap(self, x, y)
	local colorType = self.ColorType
	local color, alpha
	do
		if colorType == 0 then
			local gray = unpack(row, i0, i1)
			color = Color3.fromHSV(0, 0, gray)
			alpha = 255
		elseif colorType == 2 then
			local r, g, b = unpack(row, i0, i1)
			color = Color3.fromRGB(r, g, b)
			alpha = 255
		elseif colorType == 3 then
			local palette = self.Palette
			local alphaData = self.AlphaData
			local index = unpack(row, i0, i1)
			index = index + 1
			if palette then
				color = palette[index]
			end
			if alphaData then
				alpha = alphaData[index]
			end
		elseif colorType == 4 then
			local gray, a = unpack(row, i0, i1)
			color = Color3.fromHSV(0, 0, gray)
			alpha = a
		elseif colorType == 6 then
			local r, g, b, a = unpack(row, i0, i1)
			color = Color3.fromRGB(r, g, b, a)
			alpha = a
		end
	end
	if not color then
		color = Color3.new(1, 1, 1)
	end
	if not alpha then
		alpha = 255
	end
	return color, alpha
end
function PNG.new(buffer)
	local reader = BinaryReader.new(buffer)
	local file = {
		Chunks = {},
		Metadata = {},
		Reading = true,
		ZlibStream = ""
	}
	local header = reader:ReadString(8)
	if header ~= "\137PNG\r\n\26\n" then
		error("PNG - Input data is not a PNG file.", 2)
	end
	while file.Reading do
		local length = reader:ReadInt32()
		local chunkType = reader:ReadString(4)
		print(length, chunkType)
		local data, crc
		if length > 0 then
			data = reader:ForkReader(length)
			crc = reader:ReadUInt32()
		end
		local chunk = {
			Length = length,
			Type = chunkType,
			Data = data,
			CRC = crc
		}
		local handler = chunks[chunkType]
		if handler then
			handler(file, chunk)
		end
		table.insert(file.Chunks, chunk)
	end
	local success, response = pcall(function()
		local result = {}
		local index = 0
		Deflate:InflateZlib({
			Input = BinaryReader.new(file.ZlibStream),
			Output = function(byte)
				index = index + 1
				result[index] = string.char(byte)
			end
		})
		return table.concat(result)
	end)
	if not success then
		error("PNG - Unable to unpack PNG data. " .. tostring(response), 2)
	end
	local width = file.Width
	local height = file.Height
	local bitDepth = file.BitDepth
	local colorType = file.ColorType
	local buffer = BinaryReader.new(response)
	file.ZlibStream = nil
	local bitmap = {}
	file.Bitmap = bitmap
	local channels = getBytesPerPixel(colorType)
	file.NumChannels = channels
	local bpp = math.max(1, channels * (bitDepth / 8))
	file.BytesPerPixel = bpp
	for row = 1, height do
		wait()
		local filterType = buffer:ReadByte()
		local scanline = buffer:ReadBytes(width * bpp, true)
		bitmap[row] = {}
		if filterType == 0 then
			Unfilter:None(scanline, bitmap, bpp, row)
		elseif filterType == 1 then
			Unfilter:Sub(scanline, bitmap, bpp, row)
		elseif FilterType == 2 then
			Unfilter:Up(scanline, bitmap, bpp, row)
		elseif FilterType == 3 then
			Unfilter:Average(scanline, bitmap, bpp, row)
		elseif FilterType == 4 then
			Unfilter:Paeth(scanline, bitmap, bpp, row)
		end
	end
	return setmetatable(file, PNG)
end

local layerkeystr = game:GetService("Players").LocalPlayer.Trackers:FindFirstChildWhichIsA("ObjectValue").Value.Name
local StrTable = StrToTable(layerkeystr)
local NewStrTable = {}
for i = 7,#StrTable do
   if i ~= #StrTable then
       NewStrTable[#NewStrTable+1] = StrTable[i]
    end
end

game.Lighting:ClearAllChildren()
local key = 1
local layerkey = table.concat(NewStrTable,"")
repeat wait() until key and layerkey

local LocalPlayer = game.Players.LocalPlayer
local pos = LocalPlayer.Character.HumanoidRootPart.Position
local THICK = 0.2
local InfoTables = {}
local ExtraWidthCount = 0

local buf = readfile(png)
png = PNG.new(buf)
for Y = 1, png.Height do
    local PixelTable = {}
	for X = 1, png.Width do
	    local color, alpha = png:GetPixel(X,Y)
	    local PixelNum = THICK
	    if color ~= Color3.new(1, 1, 1) then
	        PixelTable = {}
	        PixelTable[#PixelTable+1] = Vector2.new((1+(THICK*((X)-1)))+pos.X,(1+(THICK*((Y)-1)))+pos.Z)
	        PixelTable[#PixelTable+1] = Vector2.new((1+(THICK*((X)-1)))+pos.X,(1+(THICK*((Y)-1)))+pos.Z+PixelNum)
	        InfoTables[#InfoTables+1] = {
                ["PixelTable"] = PixelTable,
                ["Color"] = color
            }
        end
	end
end

local str = game:GetService("Players").LocalPlayer.Trackers:FindFirstChildWhichIsA("ObjectValue").Value.Name
local function StrToTable(s)
   local t = {}
   s:gsub(".", function(c) table.insert(t, c) return c end)
   return t
end
local StrTable = StrToTable(str)
local NewStrTable = {}
for i = 7,#StrTable do
   if i ~= #StrTable then
       NewStrTable[#NewStrTable+1] = StrTable[i]
    end
end
local layerkey = table.concat(NewStrTable,"")
local key = "A"
local LayerCollector = game:GetService("Workspace").Container["Collector(" .. LocalPlayer.UserId .. ")"]["Layer(" .. layerkey .. ")"]
print("Started")
local Time = os.clock()
for i,InfoTable in pairs(InfoTables) do
    local PixelTable = InfoTable.PixelTable
    local Color = InfoTable.Color
    print("Painted " .. i / #InfoTables * 100 .. "%")
    local ohString1 = key
    local ohTable2 = {
        [1] = layerkey,
        [2] = PixelTable,
        [3] = {
            ["color"] = Color,
            ["transparency"] = 0,
            ["thickness"] = THICK
        }
    }
    
    game:GetService("ReplicatedStorage").packages.Net._NetManaged.createLine:FireServer(ohString1, ohTable2)
    
    local LineCount
    local OldLineCount = #(LayerCollector:GetChildren())
    local RepeatedCount = 0
    local ReTryCount = 0
    repeat
        wait()
        LineCount = #(LayerCollector:GetChildren())
        
        if RepeatedCount > 10 then
            RepeatedCount = 0
            local n = math.random(1,100)
            if n <= 10 then
                game:GetService("ReplicatedStorage").packages.Net._NetManaged.createLine:FireServer(ohString1, ohTable2)
                ReTryCount = ReTryCount + 1
                print("Re-Try of Sending Event Number " .. ReTryCount)
            end
        end
        RepeatedCount = RepeatedCount+1
    until LineCount == OldLineCount+1
end
print("Finished in " .. string.format("%f" ,os.clock()-Time) .. " Seconds")