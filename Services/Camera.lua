-- // MODULE.FELINEUTIL.SERVICES.

-- // SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- // RESOURCES
local Resources = script.Parent.Parent
local Events = Resources:WaitForChild("Events")

-- // COMMON VARIABLES
local CurrentCamera = workspace.CurrentCamera
local _Camera = {}

-- // FUNCTIONS
local function IsCameraDetectionExist(Character)
	local CameraDetection = Character and Character:FindFirstChild("__CameraDetection")
	if not CameraDetection then
		local Head: BasePart = Character:WaitForChild("Head")

		CameraDetection = Instance.new("Part")
		CameraDetection.Name = "__CameraDetection"
		CameraDetection.Size = Vector3.new(1,1,1)
		CameraDetection.CanCollide = false
		CameraDetection.Transparency = 1
		CameraDetection.Parent = Character

		local CameraWeld = Instance.new("Weld")
		CameraWeld.Name = "CameraWeld"
		CameraWeld.Parent = Character
		CameraWeld.Part0 = Character.PrimaryPart
		CameraWeld.Part1 = CameraDetection

		local offset = Character.PrimaryPart.CFrame:ToObjectSpace(Head.CFrame)
		CameraWeld.C1 = offset:Inverse()
	end
	
	return CameraDetection
end

-- // USAGES
function _Camera:GetModelDistance(Model: Instance)
	return Model and math.round((CurrentCamera.CFrame.p - Model:GetPivot().p).Magnitude)
end

function _Camera:IsModelOnScreen(Model: Model)
	assert(
		(not Model:IsA("Model") or not Model:IsA("BasePart")),
		("\n\n[%s>%s]: :IsModelOnScreen() First Parameter found out isn't Model or Part.")
			:format(script.Parent.Parent.Name, script.Name)
	)

	assert(
		RunService:IsClient(),
		("\n\n[%s>%s]: :IsModelOnScreen() can be run only on client-side.")
			:format(script.Parent.Parent.Name, script.Name)
	)

	if Model:IsA("Model") or Model:IsA("BasePart")  then
		local _, OnScreen = CurrentCamera:WorldToScreenPoint(Model:GetPivot().p)
		return OnScreen
	end
end

function _Camera:ZoomToModelExtents(Camera: Camera, Model:	Model)
	local InstanceTypeModel = Model:IsA("Model")

	local instanceCFrame = InstanceTypeModel and InstanceTypeModel:GetModelCFrame() or InstanceTypeModel.CFrame
	local extentsSize = InstanceTypeModel and InstanceTypeModel:GetExtentsSize() or InstanceTypeModel.Size
	
	local HalfSize = extentsSize.Magnitude / 2
	local DivideFieldOfView = math.tan(math.rad(Camera.FieldOfView / 2))
	
	local cameraOffset = HalfSize / DivideFieldOfView
	local cameraRotation = Camera.CFrame - Camera.CFrame.p

	local instancePosition = instanceCFrame.p
	Camera.CFrame = cameraRotation + instancePosition + (-cameraRotation.LookVector * cameraOffset)
	Camera.Focus = cameraRotation + instancePosition
end

function _Camera:IsFirstperson(Return: "Return Boolean Output")	
	local require_component: BasePart
	local Character 
	if RunService:IsClient() then
		Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
		require_component = Character and IsCameraDetectionExist(Character)
	elseif RunService:IsServer() then
		assert(nil, ('\n\n[%s>%s]: Seems like ":IsFirstperson" is called from Server-Side, This function can be called on client-side only, Please use "IsPlayerFirstperson"!'):format(script.Parent.Parent.Name, script.Name))
	end
	
	return RunService:IsClient() and require_component and Character and (CurrentCamera.CFrame.p - require_component.Position).Magnitude <= 2
end

function _Camera:IsPlayerFirstperson(Player: Player | "Return Boolean Output")
	if Player ~= Players.LocalPlayer then
		assert(Player:IsA("Player"), ('\n\n[%s>%s]: Seems like ":IsPlayerFirstperson" First Parameter isnt Player..'):format(script.Parent.Parent.Name, script.Name))
		
		local Request: RemoteFunction = Events["Camera"]["felineutil__CAMERA_SERVICE_REQUEST"]
		local Result = Request and (RunService:IsServer() and Request:InvokeClient(Player, "__IsFirstperson") or RunService:IsClient() and Request:InvokeServer("__IsFirstperson", Player))
		
		return Result
	else
		return _Camera:IsFirstperson()
	end
end

return _Camera
