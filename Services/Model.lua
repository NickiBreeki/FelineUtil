-- // MODULE.FELINEUTIL.SERVICES.MODEL

-- // SERVICES
local RunService = game:GetService("RunService")
local PhysicsService = game:GetService("PhysicsService")

-- // COMMON VARIABLES
local _Model = {}

-- // USAGES
function _Model:IsModelOnScreen(Model: Model)
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
    local CurrentCamera = workspace.CurrentCamera
		
	if Model:IsA("Model") or Model:IsA("BasePart")  then
		local _, OnScreen = CurrentCamera:WorldToScreenPoint(Model:GetPivot().p)
		return OnScreen
	end
end

function _Model:BulkSetCollisionGroup(Model: Model, CollisionGroup: string, ThroughDescendants)
	assert(
		PhysicsService:IsCollisionGroupRegistered(CollisionGroup),
		("\n\n[%s>%s]: :BulkSetCollisionGroup() '%s' isn't found in CollisionGroup! Please Register it before run this function!")
		:format(script.Parent.Parent.Name, script.Name, CollisionGroup)
	)
	
	assert(
		Model,
		("\n\n[%s>%s]: :BulkSetCollisionGroup() First Parameter appear not to be found!")
		:format(script.Parent.Parent.Name, script.Name)
	)
	
	for _,v:BasePart in pairs(ThroughDescendants and Model:GetDescendants() or Model:GetChildren()) do
		if v:IsA("BasePart") then
			v.CollisionGroup = CollisionGroup
		end
	end
end

return _Model
