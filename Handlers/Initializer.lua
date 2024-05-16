-- // SERVER.FELINEUTIL.HANDLERS.INITIALIZER
local RESOURCES = script.Parent.Parent

-- // SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

-- // FUNCTIONS
local function StarterScripts(Player: Player)
	local _ClientEventHandler = script.Parent.ClientEventHandler:Clone()
	_ClientEventHandler.Parent = Player.PlayerGui

	_ClientEventHandler.Enabled = true
end

-- // EVENT FUNCTIONS
local function onCharacterAdded(Character: Model)
	RunService.Heartbeat:Wait()
	
	local Player = Players:GetPlayerFromCharacter(Character)
	
	StarterScripts(Player)
end

local function onPlayerAdded(Player: Player)
	Player.CharacterAdded:Connect(onCharacterAdded)
end

local function RepackPackage()
	RESOURCES.Handler.Parent = ServerScriptService
	RESOURCES.Parent = ReplicatedStorage
end

RepackPackage()

-- // ROUTE EVENTS
Players.PlayerAdded:Connect(onPlayerAdded)