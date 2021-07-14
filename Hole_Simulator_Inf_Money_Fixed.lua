local ErrorFixModuleScript = require(game:GetService("ReplicatedStorage").Modules.Utility)

function comma_format_number(p5)
    if p5 ~= math.huge then
	local v19, v20, v21, v22, v23 = tostring(p5):find("([-]?)(%d+)([.]?%d*)");
	return v21 .. v22:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "") .. v23;
	else
	    return math.huge
	end
end

replaceclosure(ErrorFixModuleScript.comma_format_number, comma_format_number)

local ModuleScript = require(game:GetService("ReplicatedStorage").Modules.Menu)

ModuleScript.update_cash(math.huge)