local Amount = 10 -- the amount of times you want it to buy something
local WhatToBuy = "capacity" -- what you want it to buy, can be capacity, speed and sale_value

local ModuleScript = require(game:GetService("ReplicatedStorage").Modules.Network)

for i=1,Amount do
    ModuleScript.send("buy", WhatToBuy, 1)
end