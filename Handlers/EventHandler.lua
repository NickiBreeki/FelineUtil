-- // SERVER.FELINEUTIL.HANDLERS.EVENTHANDLER
local RESOURCES = game:GetService("ReplicatedStorage"):WaitForChild("FelineUtil")

local Prefix = "felineutil_%s"

-- // SETUP EVENTS
local EVENTS_STORAGE = Instance.new("Folder")
EVENTS_STORAGE.Name = "Events"
EVENTS_STORAGE.Parent = RESOURCES

local SERVICES_EVENT = Instance.new("Folder")
SERVICES_EVENT.Name = "Services"
SERVICES_EVENT.Parent = EVENTS_STORAGE

-- // CAMERA SERVICE EVENTS
local CAMERA_SERVICE = Instance.new("Folder")
CAMERA_SERVICE.Name = "Camera"
CAMERA_SERVICE.Parent = SERVICES_EVENT

local CAMERA_SERVICE_REQUEST = Instance.new("RemoteFunction")
CAMERA_SERVICE_REQUEST.Name = Prefix:format("_CAMERA_SERVICE_REQUEST")
CAMERA_SERVICE_REQUEST.Parent = CAMERA_SERVICE

-- // EVENT FUNCTIONS
local function CAMERA_SERVICE_REQUEST_rfEVENT(REQUESTER: Player, ...)
	local data = {...}
	if data[1]:lower() == "__isfirstperson" then
		if data[2]:IsA("Player") then
			local Result = CAMERA_SERVICE_REQUEST:InvokeClient(data[2], "__isfirstperson")
			return Result
		end
	end
end

-- // EVENTS
CAMERA_SERVICE_REQUEST.OnServerInvoke = CAMERA_SERVICE_REQUEST_rfEVENT
