
local plyrs = game:GetService("Players")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local cam = workspace.Camera
local headset
local p

local bodybinds = {
	[Enum.UserInputType.MouseButton1] = "lHand",
	[Enum.UserInputType.MouseButton2] = "rHand",
	[Enum.KeyCode.W] = Vector3.new(0, 1, 0),
	[Enum.KeyCode.A] = Vector3.new(-1, 0, 0),
	[Enum.KeyCode.S] = Vector3.new(0, -1, 0),
	[Enum.KeyCode.D] = Vector3.new(1, 0, 0),
	[Enum.KeyCode.Q] = false,
	[Enum.KeyCode.E] = true,
	[Enum.KeyCode.LeftShift] = 1,
	[Enum.KeyCode.LeftControl] = 2,
	[Enum.KeyCode.LeftAlt] = 3
}

local gesturebinds = {
	"Fist",
	"Index",
	"Thumb"
}

local body = setmetatable({ -- least fav part of the script
	lastHand = "",
	lHand = {
		false,
		CFrame.new(-math.cos(math.pi / 4), -0.5, -math.sin(math.pi / 4)),
		0
	},
	rHand = {
		false,
		CFrame.new(-math.cos(3 * math.pi / 4), -0.5, -math.sin(3 * math.pi / 4)),
		0
	}
}, {
	__call = function(t, k, mult)
		mult = mult or 1

		local bind = bodybinds[k]
		if bind and headset then
			if typeof(bind) == "string" then
				t[bind][1] = mult > 0
				
				lastHand = mult > 0 and bind or lastHand
				
			elseif typeof(bind) == "Vector3" then
				headset.StickPosition += bind * mult
			elseif typeof(bind) == "boolean" then
				headset.Stick2 = mult > 0 and bind and 1 or 0
			elseif typeof(bind) == "number" and lastHand:len() > 0 then
				local gesture = lastHand:sub(1,1)..gesturebinds[bind]
			
				if mult > 0 then
					headset[gesture] = headset[gesture] == 0 and 1 or 0
				end
			end
		end
	end
})

local ind, nc, nind

local events = {}

local cfs = {
	[Enum.UserCFrame.Head] = CFrame.new(0, 0, 0),
	[Enum.UserCFrame.LeftHand] = CFrame.new(-1, 0, -1),
	[Enum.UserCFrame.RightHand] = CFrame.new(1, 0, -1)

}

local realVrService = game:GetService("VRService")

local fakeVrService = setmetatable({
	VREnabled = true,
	SetTouchpadMode = function()
	end,
	RecenterUserHeadCFrame = function()
	end,
	GetUserCFrameEnabled = function(cf)
		return true
	end,
	GetUserCFrame = function(cf)
		return cfs[cf] or CFrame.new(0, 0, 0)
	end

}, {
	__index = function(t, k)
		local real = ind(realVrService, k)
		if typeof(real) == "RBXScriptSignal" then
			events[k] = events[k] or {
				Name = k,
				Connect = function(t, f)
					t.Function = f

					if t.Name == "UserCFrameChanged" then
						headset = debug.getupvalue(t.Function, 1)

						debug.setupvalue(headset.UpdateHand, 5, setmetatable({}, {
							__index = function(t, k)
								return cam[k]
							end,
							__newindex = function(t, k, v)
								if cam.CameraType == Enum.CameraType.Scriptable and p then -- unfortunately the first time this will run may or may not be before the cameratype is set
									cam.CameraType = Enum.CameraType.Custom
									cam.CameraSubject = headset.Head
								end

								if k ~= "CFrame" then -- fuck you
									cam[k] = v
								end
							end
						}))
						
						cam:GetPropertyChangedSignal("CameraSubject"):connect(function()
							if cam.CameraSubject ~= headset.Head then
								cam.CameraSubject = headset.Head
							end
						end)
					end

				end, 
				Fire = function(t, ...)
					return t.Function(...)
				end
			}

			return events[k]
		end

		return real
	end,
	__call = function(t, method, vr, ...)
		return t[method](...)
	end
})

ind = hookmetamethod(game, "__index", function(...)
	local t, k = ...

	local scr = getcallingscript()

	if t == realVrService and not (scr and ind(scr, "Name") == "CameraModule") then
		return fakeVrService[k]
	end

	return ind(...)
end)

nc = hookmetamethod(game, "__namecall", function(...)
	local t = ...

	if t == realVrService then
		local method = getnamecallmethod()
		return fakeVrService(method, ...)
	end

	return nc(...)
end)

nind = hookmetamethod(game, "__newindex", function(...)
	local t, k, v = ...

	if t == cam and k == "CFrame" and events.UserCFrameChanged then
		events.UserCFrameChanged:Fire(Enum.UserCFrame.Head, CFrame.Angles(cam.CFrame:ToEulerAnglesXYZ()))
	end

	nind(t, k, v)
end)



uis.InputBegan:connect(function(i) -- also least favorite
	if headset then
		if i.UserInputType == Enum.UserInputType.Keyboard then
			body(i.KeyCode)
		elseif i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.MouseButton2 or i.UserInputType == Enum.UserInputType.MouseButton3 then
			body(i.UserInputType)
		end
	end
end)

uis.InputEnded:connect(function(i)
	if headset then
		if i.UserInputType == Enum.UserInputType.Keyboard then
			body(i.KeyCode, -1)
		elseif i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.MouseButton2 or i.UserInputType == Enum.UserInputType.MouseButton3 then
			body(i.UserInputType, -1)
		end
	end
end)

rs:BindToRenderStep(game:GetService("HttpService"):GenerateGUID(), Enum.RenderPriority.Camera.Value - 1, function() -- at least it works
	if events.UserCFrameChanged and headset then	
		local mpos = uis:GetMouseLocation()

		local cursordir = cam:ViewportPointToRay(mpos.x, mpos.y).Direction

		body.lHand[3] = body.lHand[1] and math.clamp(body.lHand[3] + 0.05, 0, 1) or body.lHand[3] > 0 and math.clamp(body.lHand[3] - 0.05, 0, 1) or body.lHand[3]
		body.rHand[3] = body.rHand[1] and math.clamp(body.rHand[3] + 0.05, 0, 1) or body.rHand[3] > 0 and math.clamp(body.rHand[3] - 0.05, 0, 1) or body.rHand[3]

		local theta = math.acos(Vector3.new(-1, 0, 0):Dot((cam.CFrame.LookVector * Vector3.new(1, 0, 1)).unit))

		theta = cam.CFrame.LookVector.z > 0 and (2 * math.pi) - theta or theta


		body.lHand[2] = CFrame.new(-math.cos(theta - (math.pi / 4)), -0.5, -math.sin(theta - (math.pi / 4)))
		body.rHand[2] = CFrame.new(-math.cos(theta + (math.pi / 4)), -0.5, -math.sin(theta + (math.pi / 4)))
		
		local lcf = ((body.lHand[2]):lerp(CFrame.new(cursordir * 100 / cam.HeadScale), body.lHand[3]))
		local rcf = ((body.rHand[2]):lerp(CFrame.new(cursordir * 100 / cam.HeadScale), body.rHand[3]))

		events.UserCFrameChanged:Fire(Enum.UserCFrame.LeftHand, lcf * CFrame.Angles(cam.CFrame:ToEulerAnglesXYZ()))
		events.UserCFrameChanged:Fire(Enum.UserCFrame.RightHand, rcf * CFrame.Angles(cam.CFrame:ToEulerAnglesXYZ()))
	end
end)

p = plyrs.LocalPlayer or (function()
	plyrs:GetPropertyChangedSignal("LocalPlayer"):wait() -- this doesnt return anything for some reason??
	return plyrs.LocalPlayer
end)()