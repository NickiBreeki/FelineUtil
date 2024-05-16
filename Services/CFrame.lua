-- // MODULE.FELINEUTIL.SERVICES.CFRAME
local _CFrame = {}

-- // USAGES
function _CFrame.new(x, y, z): Vector3
	return CFrame.new(x, y, z)
end

function _CFrame.RadAngle(x, y, z): Vector3
	return CFrame.Angles(math.rad(y), math.rad(x), math.rad(z))
end

function _CFrame.DegAngle(x, y ,z): Vector3
	return CFrame.Angles(math.deg(y), math.deg(x), math.deg(z))
end

return _CFrame
