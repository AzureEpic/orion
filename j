-----good riddance
local existingGui = game:GetService("CoreGui"):FindFirstChild("Game")
if existingGui then
	existingGui:Destroy()
end




-- New draggable Orion Lib script for hub creations!
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AzureEpic/orion/refs/heads/main/Source')))()


print("starting aashfhfuishfihfdibhijdfbfdbksdfbhkfsd")


------Player variables

local plr = game.Players.LocalPlayer
local char = plr.Character

local hum = char:FindFirstChildOfClass("Humanoid")

local sitting = hum.SeatPart

local playerName = game.Players.LocalPlayer.Name

local camera = workspace.CurrentCamera
local rootpart = char:FindFirstChild("HumanoidRootPart")

plr.CharacterAdded:Connect(function(character) 
	local rootpart = character:WaitForChild("HumanoidRootPart", 10) -- Waits 10 seconds for root part
	if rootpart then
		character.PrimaryPart = rootpart
	end
end)



-------g



_G.DoorbellDelay = .1
_G.TruckTPPos = Vector3.new(46.4887, 3.80013, 126.255)
_G.NewIsland = Vector3.new(-1090.03, 28.8735, 641.124)
_G.OldIsland = Vector3.new(1496.06, 0.100165, 1344.64)
_G.Suppliers = Vector3.new(7.29875, 14.5, -1032.49)

_G.Cooks = Vector3.new(39.5155, 3.80013, 61.5834)
_G.Boxers = Vector3.new(56.6061, 3.78614, 21.5776)
_G.Manager = Vector3.new(30.8387, 3.77562, 6.88775)
_G.Delivery = Vector3.new(54.4401, 3.79878, -10.656)

--------other instances

local truckTP = Instance.new("Part")
truckTP.Parent = workspace
truckTP.Position = _G.TruckTPPos




--------INfo Variables
local fps = math.floor(workspace:GetRealPhysicsFPS())
local ws = hum.WalkSpeed
local ping=game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
local currentPlayers = #game.Players:GetPlayers()
local maxPlayers = game.Players.MaxPlayers
local plrTime =  os.date("%X")

--[[
while wait(.1) do

	fps = math.floor(workspace:GetRealPhysicsFPS())
	 ws = hum.WalkSpeed
	 ping=game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
	 currentPlayers = #game.Players:GetPlayers()
	 maxPlayers = game.Players.MaxPlayers
	 plrTime =  os.date("%X")




end]]

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




Tab:AddLabel("ur fps [ ".. fps .."]")
Tab:AddLabel("ur walkspeed ["..ws.."]")
Tab:AddLabel("ur ping [ "..ping.." ]")
Tab:AddLabel("# of players [ "..currentPlayers.." / "..maxPlayers.." ]")
Tab:AddLabel("Server Run Time [ "..math.floor(workspace.DistributedGameTime / 60 / 60).." hour(s) | "..math.floor(workspace.DistributedGameTime / 60) - (math.floor(workspace.DistributedGameTime / 60 / 60) * 60).." Minutes | "..math.floor(workspace.DistributedGameTime) - (math.floor(workspace.DistributedGameTime / 60) * 60).." seconds ]")
Tab:AddLabel("your time [ "..plrTime.." ]")
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




local debTab = Window:MakeTab({
	Name = "Debugs And Utility",
	Icon = "rbxassetid://14502802745",
	PremiumOnly = false
	
})









debTab:AddButton({
Name = "Remote Spy",
Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile"))()
end,
	
	
})

debTab:AddButton({
	Name = "Dex Raspberry Pi",
Callback = function()
		loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
end,
	
	
})




	
	

debTab:AddButton({
	Name = "Anti LocalScript Kick",
	Callback = function()
		local mt = getrawmetatable(game)

		setreadonly(mt, false)

		local oldmt = mt.__namecall

		mt.__namecall = newcclosure(function(Self, ...)


			local method = getnamecallmethod()

			if method == 'Kick' then

				print("Tried To kick")
				wait(9e9)
				return nil

			end

			return oldmt(Self, ...)

		end)

		setreadonly(mt, true)
	end,
	
	
	
	
	
	
		
		
		
	})
	
	
	debTab:AddButton({
		Name = "Adonis Admin Anticheat Bypass",
		Callback = function()
			local getinfo = getinfo or debug.getinfo
			local DEBUG = false
			local Hooked = {}

			local Detected, Kill

			setthreadidentity(2)

			for i, v in getgc(true) do
				if typeof(v) == "table" then
					local DetectFunc = rawget(v, "Detected")
					local KillFunc = rawget(v, "Kill")

					if typeof(DetectFunc) == "function" and not Detected then
						Detected = DetectFunc

						local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
							if Action ~= "_" then
								if DEBUG then
									warn(`Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}`)
								end
							end

							return true
						end)

						table.insert(Hooked, Detected)
					end

					if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
						Kill = KillFunc
						local Old; Old = hookfunction(Kill, function(Info)
							if DEBUG then
								warn(`Adonis AntiCheat tried to kill (fallback): {Info}`)
							end
						end)

						table.insert(Hooked, Kill)
					end
				end
			end

			local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
				local LevelOrFunc, Info = ...

				if Detected and LevelOrFunc == Detected then
					if DEBUG then
						warn(`zins | adonis bypassed`)
					end

					return coroutine.yield(coroutine.running())
				end

				return Old(...)
			end))
			-- setthreadidentity(9)
			setthreadidentity(7)

		end
	})
	
	
	
	
	
	
	debTab:AddButton({
		Name = "Debuggers",
		Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/debugnation/main/decompilers%20and%20debugging/Debuggers.txt"))()
		end,
		
		
		
		
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


pizza:AddLabel("If truck teleporting doesn't work, just wait.")

pizza:AddDropdown({
	Name = "Teleport Supply Truck somewhere",
	Default = "Pizza Place",
	Options = {"Cashier", "Cooks", "Boxer", "Delivery", "Manager", "Supplier"},
	Callback = function(Value)
		print("Selected tp location:", Value)

		local locationPositions = {
			["Cashier"] = _G.TruckTPPos,
			["Supplier"] = _G.Suppliers, 
			["Cooks"] = _G.Cooks,
			["Boxer"] = _G.Boxers,
			["Manager"] = _G.Manager  -- Updated for matching
		}

		local selectedPosition = locationPositions[Value]

		if selectedPosition then
		
		
		
		
		
		
			workspace.Trucks:FindFirstChild("Supply Truck").Driver.ClickDetector.Detector:FireServer()
			wait(0.5)






		




			--------other instances

			local truckTP = Instance.new("Part")
			truckTP.Parent = workspace
			truckTP.Position = _G.TruckTPPos





			local plr = game.Players.LocalPlayer
			local char = plr.Character

			local hum = char:FindFirstChildOfClass("Humanoid")

			local sitting = hum.SeatPart



			-- Teleport the truck to the specified position
			if sitting and sitting.Parent:IsA("Model") then
				sitting.Parent:PivotTo(CFrame.new(selectedPosition))
				
			else
				error("failed to teleport truck: player is not sitting in a valid seat.")
			end
			
			
			
			
			
			
			
			
			print("no positions")
		end
	end    
})
print("Dropdown 'Teleports' created")  -- Confirm if dropdown creation reaches here






--[[
pizza:AddButton({
	Name = "Snowball random player",
	Callback = function()
		local players = game.Players:GetPlayers()
		local randomPlayer = players[math.random(1, #players)]
		local character = randomPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")


		if humanoidRootPart and humanoidRootPart:IsA("Part") then
			local snowball = game.Players.LocalPlayer.Character:FindFirstChild("Snowball")

			if snowball and snowball:FindFirstChild("Clicked") then
				snowball.Clicked:FireServer(humanoidRootPart.Position)

				camera.CameraSubject = character
				print("Throwing at " .. randomPlayer.Name)
				wait(3)
				camera.CameraSubject = game.Players.LocalPlayer.Character
			else


print("no snowball")
			end
		end
	end
})



--pizza:AddParagraph("","Below will be teleports.")


]]


pizza:AddDropdown({
	Name = "Teleports",
	Default = "Pizza Place",
	Options = {"Pizza Place", "Supplier Place", "Secret Island 1", "Secret Island 2"},
	Callback = function(Value)
		print("Selected tp location:", Value)

		local locationPositions = {
			["Pizza Place"] = _G.TruckTPPos,
			["Supplier Place"] = _G.Suppliers, 
			["Secret Island 1"] = _G.NewIsland,
			["Secret Island 2"] = _G.OldIsland  -- Updated for matching
		}

		local selectedPosition = locationPositions[Value]

		if selectedPosition then
			game.Players.LocalPlayer.Character:PivotTo(CFrame.new(selectedPosition))
		else
			print("no positions")
		end
	end    
})
print("Dropdown 'Teleports' created")  -- Confirm if dropdown creation reaches here


--[[
pizza:AddSection({

	Name = 	"Other"
})
]]

pizza:AddDropdown({
	Name = "Choose Job",
	Default = "On Break",
	Options = {"On Break", "Cashier", "Cook", "Pizza Boxer", "Delivery", "Supplier", "Manager"},
	Callback = function(Value)
		print(Value)


		local args = {
			[1] = "ChangeJob",
			[2] = "On Break"
		}

		game:GetService("ReplicatedStorage").PlayerChannel:FireServer("ChangeJob", Value)







	end    
})















print("loaded")

