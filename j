-----good riddance
local existingGui = game:GetService("CoreGui"):FindFirstChild("Game")
if existingGui then
	existingGui:Destroy()
end



local truckFollowCoroutine





local truckDistance = 10




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
while wait(1) do

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





Tab:AddSlider({
	Name = "Walkspeed",
	Min = 0,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "speed",
	Callback = function(Value)
		hum.WalkSpeed = Value
	end    
})



Tab:AddSlider({
	Name = "Jumppower",
	Min = 0,
	Max = 500,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "jump power",
	Callback = function(Value)
		hum.JumpPower = Value
	end    
})


Tab:AddSlider({
	Name = "HipHeight (can trigger anticheats)",
	Min = 0,
	Max = 500,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "height (in studs duh)",
	Callback = function(Value)
		hum.HipHeight = Value
	end    
})

--[[
Name = <string> - The name of the slider.
Min = <number> - The minimal value of the slider.
Max = <number> - The maxium value of the slider.
Increment = <number> - How much the slider will change value when dragging.
Default = <number> - The default value of the slider.
ValueName = <string> - The text after the value number.
Callback = <function> - The function of the slider.
]]




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
		Name = "Subplace Viewer GUI",
		Callback = function()
			
			
			
			
			
		local TeleportService = game:GetService("TeleportService")
		local UserInputService = game:GetService("UserInputService")

		local pages = game:GetService("AssetService"):GetGamePlacesAsync()

		local gui = Instance.new("ScreenGui")
		gui.Name = "Game"
		gui.Parent = game:GetService("CoreGui")

		local outerFrame = Instance.new("Frame")
		outerFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
		outerFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
		outerFrame.BorderSizePixel = 5
		outerFrame.BackgroundColor3 = Color3.new(1, 0.5, 0) 
		outerFrame.Parent = gui

		local title = Instance.new("TextLabel") 
		title.Text = "Teleport To Subplaces By Your Name" 
		title.Size = UDim2.new(1, 0, 0, 30)
		title.TextSize = 15
		title.TextColor3 = Color3.new(1, 1, 1)
		title.BackgroundColor3 = Color3.new(1, 0.5, 0) 
		title.Parent = outerFrame

		local closeButton = Instance.new("TextButton") 
		closeButton.Text = "X"
		closeButton.Size = UDim2.new(0, 30, 0, 30)
		closeButton.Position = UDim2.new(1, -30, 0, 0)
		closeButton.TextSize = 20
		closeButton.TextColor3 = Color3.new(1, 1, 1) 
		closeButton.BackgroundColor3 = Color3.new(1, 0.5, 0) 
		closeButton.Parent = title
		closeButton.MouseButton1Click:Connect(function()
			gui:Destroy()
		end)

		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, -10, 1, -40) 
		frame.Position = UDim2.new(0, 5, 0, 35) 
		frame.BackgroundColor3 = Color3.new(1, 0.5, 0)
		frame.Parent = outerFrame

		local scrollFrame = Instance.new("ScrollingFrame")
		scrollFrame.Size = UDim2.new(0.9, 0, 0.9, 0)
		scrollFrame.Position = UDim2.new(0.05, 0, 0.05, 0)
		scrollFrame.BackgroundColor3 = Color3.new(1, 0.8, 0.4) 
		scrollFrame.CanvasSize = UDim2.new(0, 0,100, 0)
		scrollFrame.Parent = frame

		local function updateGUI()
			for _, place in pairs(pages:GetCurrentPage()) do
				local placeLabel = Instance.new("TextLabel")
				placeLabel.Text = "Name: " .. place.Name .. "\nPlaceId: " .. tostring(place.PlaceId)
				placeLabel.Size = UDim2.new(1, 0, 0, 30)
				placeLabel.Position = UDim2.new(0, 0, 0, (#scrollFrame:GetChildren() + 1) * 30)
				placeLabel.TextColor3 = Color3.new(1, 1, 1) 
				placeLabel.BackgroundColor3 = Color3.new(1, 0.5, 0) 
				placeLabel.Parent = scrollFrame

				local teleportButton = Instance.new("TextButton")
				teleportButton.Text = "Teleport"
				teleportButton.Size = UDim2.new(0.2, 0, 0, 30)
				teleportButton.Position = UDim2.new(0.8, 0, 0, 0)
				teleportButton.BackgroundColor3 = Color3.new(1, 0.8, 0.4) 
				teleportButton.TextColor3 = Color3.new(1, 1, 1) 
				teleportButton.Parent = placeLabel
				teleportButton.MouseButton1Click:Connect(function()
					TeleportService:Teleport(place.PlaceId, game.Players.LocalPlayer)
				end)
			end
			if pages.IsFinished then
				return
			end
			pages:AdvanceToNextPageAsync()
		end

		updateGUI()

		local dragging
		local dragStartPos
		local startPos

		local function updateDrag(input)
			local delta = input.Position - dragStartPos
			outerFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end

		outerFrame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStartPos = input.Position
				startPos = outerFrame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		outerFrame.InputChanged:Connect(function(input)
			if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				updateDrag(input)
			end
		end)
			
			
			
			
			
			
		end,
		
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
			["Manager"] = _G.Manager,  -- Updated for matching
			["Delivery"] = _G.Delivery,
			
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






pizza:AddButton({
	Name = "TP Truck to your position",
	Callback = function()
		local currentPos = rootpart.Position
		workspace.Trucks:FindFirstChild("Supply Truck").Driver.ClickDetector.Detector:FireServer()
		






		




		--------other instances

		local truckTP = Instance.new("Part")
		truckTP.Parent = workspace
		truckTP.Position = currentPos





		local plr = game.Players.LocalPlayer
		local char = plr.Character

		local hum = char:FindFirstChildOfClass("Humanoid")

		local sitting = hum.SeatPart



		-- Teleport the truck to the specified position
		if sitting and sitting.Parent:IsA("Model") then
			sitting.Parent:PivotTo(truckTP.CFrame)

		else
			error("failed to teleport truck: player is not sitting in a valid seat.")
		end
	end,
	
	
	
})


pizza:AddToggle({
	Name = "Make supply truck(s) follow behind you",
	Default = false,
	Callback = function(run)
		print(" truck follow")

		if run then
			truckFollowCoroutine = coroutine.create(function()
				while true do
					local success, err = pcall(function()  
						local trucks = workspace.Trucks
						local truck = trucks:FindFirstChild("Supply Truck")

						if truck then
							for _, part in truck:GetDescendants() do
								if part:IsA("BasePart") then
									local bp = part:FindFirstChildOfClass("BodyPosition")
									if not bp then
										bp = Instance.new("BodyPosition")
										bp.Parent = part
									end

									local plrPos = rootpart.Position
									local mainLookVector = rootpart.CFrame.LookVector
									bp.Position = plrPos - (mainLookVector * truckDistance)
								end
							end
						end
					end)

					if not success then
						print("truck wont follow cuz: ".. tostring(err))
					end



					task.wait(0.01)  
				end
			end)

			coroutine.resume(truckFollowCoroutine)

		else
			if truckFollowCoroutine and coroutine.status(truckFollowCoroutine) == "suspended" then
				truckFollowCoroutine = nil  
			end
		end
	end    
})

--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]

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
	Default = "",
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





pizza:AddButton({
	Name = "drakeface",
	Callback = function()
		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Head.face,
			[2] = "rbxassetid://18102135310"
		}

		workspace.Main.ChangeFace:FireServer(unpack(args))
	end,
	
	
	
	
})



pizza:AddTextbox({
	Name = "Custom Face (Decal ID)",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		workspace.Main.ChangeFace:FireServer(char:FindFirstChild("Head"), "rbxassetid://"..tonumber(Value))
	end	  
})

--[[
Name = <string> - The name of the textbox.
Default = <string> - The default value of the textbox.
TextDisappear = <bool> - Makes the text disappear in the textbox after losing focus.
Callback = <function> - The function of the textbox.
]]















print("loaded")

