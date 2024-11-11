

if game:GetService("CoreGui").Game then
	game.CoreGui.Game:Destroy()
end

-- New draggable Orion Lib script for hub creations!
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AzureEpic/orion/refs/heads/main/Source')))()

------Player variables

local plr = game.Players.LocalPlayer
local char = plr.Character

local hum = char:FindFirstChildOfClass("Humanoid")

local sitting = hum.SeatPart

local playerName = game.Players.LocalPlayer.Name

local camera = workspace.CurrentCamera
-------g



_G.DoorbellDelay = .1
_G.TruckTPPos = Vector3.new(46.4887, 3.80013, 126.255)




--------other instances

local truckTP = Instance.new("Part")
truckTP.Parent = workspace
truckTP.Position = _G.TruckTPPos





local Window = OrionLib:MakeWindow({
	Name = "Azure's Thing",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "AzureConfigs" -- Put the name of your hub or script here!
})

print("Successfully executed.") -- Just a debug

local Tab = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://7937261499",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Info"
})

Tab:AddLabel("Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
Tab:AddLabel("Game ID: ".. game.GameId)




Tab:AddLabel("ur fps [ "..math.floor(workspace:GetRealPhysicsFPS()).."]")
Tab:AddLabel("ur walkspeed ["..hum.WalkSpeed.."]")
Tab:AddLabel("ur ping [ "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString().." ]")
Tab:AddLabel("# of players [ "..#game.Players:GetPlayers().." / "..game.Players.MaxPlayers.." ]")
Tab:AddLabel("Server Run Time [ "..math.floor(workspace.DistributedGameTime / 60 / 60).." hour(s) | "..math.floor(workspace.DistributedGameTime / 60) - (math.floor(workspace.DistributedGameTime / 60 / 60) * 60).." Minutes | "..math.floor(workspace.DistributedGameTime) - (math.floor(workspace.DistributedGameTime / 60) * 60).." seconds ]")
Tab:AddLabel("your time [ "..os.date("%X").." ]")
Tab:AddLabel("account age [ "..game.Players.LocalPlayer.AccountAge.. " days"..  " ]")

Tab:AddSection({

Name = 	"Useless stuff"
})

Tab:AddLabel("Amount of instances: ".. #game:GetDescendants())








--[[

Tab:AddButton({
	Name = "discord server",
	Callback = function()
		setclipboard("https://discord.gg/9vsvzS6mer")
		toclipboard("https://discord.gg/9vsvzS6mer")
	end    
})
]]


Tab:AddButton({
	Name = "Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end    
})


Tab:AddButton({
	Name = "Nameless Admin",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
	end    
})



local ftap = Window:MakeTab({
	Name = "FTAP",
	Icon = "rbxassetid://12006440375",
	PremiumOnly = false
	
	
	
})


ftap:AddButton({
	Name = "click to load the FTAP script (make sure you only load it ONCE or it will break)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Raigforce/CrappyFTAPLol/refs/heads/main/FtapSigmaShi"))()
	end
})





local pizza = Window:MakeTab({
	Name = "🍕Pizza Place🍕",
	Icon = "rbxassetid://131356501692031",
	PremiumOnly = false



})



--[[
pizza:AddButton({
	Name = "Ring all house doorbells (troll)",
	Callback = function()
		for i = 1, 11 do
			for _, thing in workspace.Houses:GetDescendants() do
				if thing.Name == "Detector" then 
			
			local door = thing
			if door then
				door:FireServer()
				wait(_G.DoorbellDelay)
			end
			
				end
			end
		end
	end
})
]]





pizza:AddButton({
	Name = "Teleport a supply truck into restaurant (troll)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AzureEpic/orion/refs/heads/main/truck"))()
	end
})






pizza:AddButton({
	Name = "Snowball random player",
	Callback = function()
		local players = game.Players:GetPlayers()
		local randomPlayer = players[math.random(1, #players)]
		local character = randomPlayer.Character
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart and humanoidRootPart:IsA("Part") then

		
			game:GetService("Players").LocalPlayer.Character.Snowball.Clicked:FireServer(humanoidRootPart.Position)

	camera.CameraSubject = character
	wait(3)
	camera.CameraSubject = char
	
	
	end
	end,
	
	
	
})



--pizza:AddParagraph("","Below will be teleports.")







