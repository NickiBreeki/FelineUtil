-- // SERVER.FELINEUTIL.HANDLERS.CLIENTEVENTHANDLER
-- // DEFAULT: DISABLED
task.delay(.01, function() script.Parent = game.Players.LocalPlayer.PlayerScripts end)
--

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RESOURCES = ReplicatedStorage:WaitForChild("FelineUtil")
local EVENTS = RESOURCES:WaitForChild("Events")

local CAMERA_SERVICE_REQUEST: RemoteFunction = EVENTS["Services"]["Camera"]["felineutil__CAMERA_SERVICE_REQUEST"]

local function CAMERA_SERVICE_REQUEST__rfEVENT(...)
	local data = {...}
	if data[1]:lower() == "__isfirstperson" then
		return require(RESOURCES.main):import("Camera"):IsFirstperson()
	end
end

print("HI!")

CAMERA_SERVICE_REQUEST.OnClientInvoke = CAMERA_SERVICE_REQUEST__rfEVENT