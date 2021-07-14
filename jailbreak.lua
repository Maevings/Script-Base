--inf car nitro
for i,v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v,"Nitro") and type(rawget(v,"Nitro")) == "number" then
        setrawmetatable(v,{
            __index = newcclosure(function(t,s)
                if s == "Nitro" and not checkcaller() then
                    return 250
                end    
            end),
            __newindex = newcclosure(function(t,s,v)
                if s == "Nitro" and not checkcaller() then
                    return
                end
            end)
        })
        rawset(v,"Nitro",nil)
        break
    end
end
--inf jetpack fuel
local m = require(game:GetService("ReplicatedStorage").Game.JetPack.JetPack)
local f = m.Init
local t = getupvalue(f,9)
local t2 = t.HeartbeatLocal
local old
old = hookfunc(t2,function(v1,v2,...)
    if rawget(v1,"Fuel") then
        rawset(v1,"Fuel",10)
    end
    return old(v1,v2,...)
end)
rawset(t,"LocalFuel",10)
--jetpack rocket fuel
local FakeTable = {
    LocalFuelType = "Rocket"
}
setmetatable(t,{
    __index = FakeTable,
    __newindex = function(self,s,v)
        if s ~= "LocalFuelType" then
            rawset(self,s,v)
        end
    end
})
rawset(t,"LocalFuelType",nil)