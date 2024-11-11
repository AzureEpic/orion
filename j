-- New draggable Orion Lib script for hub creations!
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AzureEpic/orion/refs/heads/main/Source')))()

------Player variables

local plr = game.Players.LocalPlayer
local char = plr.Character

local hum = char:FindFirstChildOfClass("Humanoid")

local sitting = hum.SeatPart




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

local playerName = game.Players.LocalPlayer.Name

Tab:AddButton({
	Name = "Welcome " .. playerName .. "! this is still in development so lol",
	Callback = function()
	end
})

--[[

Tab:AddButton({
	Name = "Check out our official discord server in your clipboard.",
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
	Icon = "rbxassetid://18398583877",
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






pizza:AddButton({
	Name = "Teleport a supply truck into restaurant (troll)",
	Callback = function()
		local success, errorMessage = pcall(function()
			workspace.Trucks:FindFirstChild("Supply Truck").Driver.ClickDetector.Detector:FireServer()
			wait(0.5)

			-- Teleport the truck to the specified position
			if sitting and sitting.Parent:IsA("Model") then
				sitting.Parent:PivotTo(truckTP.CFrame)
				hum.Sit = false
			else
				error("failed to teleport truck: player is not sitting in a valid seat.")
			end
		end)

		if not success then
			OrionLib:MakeNotif({
				Title = "Error",
				Text = "supply truck cant tp, " ..errorMessage,
				Time = 5
			})
		end
	end
})
