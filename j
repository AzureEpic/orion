-----good riddance
local existingGui = game:GetService("StarterGui"):FindFirstChild("Game")
if existingGui then
	existingGui:Destroy()
end







------Func





local function Error(err)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "AzureEpic",
		Text = "error: "..tostring(err) .. "However, this may be fixed in a few seconds.",
		Icon = "rbxassetid://7733658504",
		Duration = 7
	})
end

function getPlrHum(plr)
	if plr and plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
		return game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	else
		return false
	end
end



function r15(plr)
	plr=(plr or game:GetService("Players").LocalPlayer)
	if plr then
		if plr.Character:FindFirstChildOfClass('Humanoid').RigType==Enum.HumanoidRigType.R15 then
			return true
		end
	end
	return false
end




local err, success = pcall(function()  

local secondsFollow

local npcSpinFollow
local following = false





	local hiddenfling=false
	local truckFollowCoroutine

	local walkSpeedCoroutine
	local JumpCoroutine
	local hipHeightCoroutine
local antiTripCoroutine

	local truckDistance = 10

	local sliderWalkspeed
	local sliderJump
	local sliderHeight


	
	
	-- New draggable Orion Lib script for hub creations!

	
	local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AzureEpic/orion/refs/heads/main/Source')))() 


	print("starting aashfhfuishfihfdibhijdfbfdbksdfbhkfsd")


	------Player variables

	local plr = game.Players.LocalPlayer
	local char = plr.Character

	local huma = char:FindFirstChildOfClass("Humanoid")

	local sitting = huma.SeatPart

	local playerName = game.Players.LocalPlayer.Name

	local camera = workspace.CurrentCamera
	local rootpart = char:FindFirstChild("HumanoidRootPart")

	plr.CharacterAdded:Connect(function(character) 
		local rootpart = character:WaitForChild("HumanoidRootPart", 10) -- Waits 10 seconds for root part
		if rootpart then
			character.PrimaryPart = rootpart
		end
	end)

rootpart.Massless = true


local function makeSelfOrb(size: number, color, func:string)
	


			
		
		
		local orb = Instance.new("SpecialMesh")
		orb.Name = "orb"
		orb.Parent = rootpart
		orb.MeshId = "rbxassetid://5697933202"
		
		rootpart.Size = Vector3.new(size,size,size)
		rootpart.Color = color
		rootpart.Material = Enum.Material.ForceField
		rootpart.Transparency = 0
		
		
			
		
		
	
	
	
end




local function removeOrb()
	rootpart:FindFirstChild("orb"):Destroy()
		rootpart.Size = Vector3.new(2, 2, 1)
		rootpart.Transparency = 1
end




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
	local ws = huma.WalkSpeed
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

Tab:AddButton({
	Name = "Rejoin Game",
	Callback = function()
		
			local PlaceId,JobId,GameId=game.PlaceId,game.JobId,game.GameId



			if #game:GetService("Players"):GetPlayers() <=1 then
				game:GetService("Players").LocalPlayer:Kick("Rejoining...")
				wait()
				game:GetService("TeleportService"):Teleport(PlaceId)
			else
				game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId,JobId,game:GetService("Players").LocalPlayer)
			end



			wait();
		
		
		
	end,
	
})


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



	local HttpService = game:GetService("HttpService")

	-- GitHub API endpoint for commits
	local repoOwner = "AzureEpic"
	local repoName = "orion"
	local branch = "main"
	local filePath = "j"

	-- Construct the API URL
	local apiUrl = string.format(
		"https://api.github.com/repos/%s/%s/commits?path=%s&sha=%s",
		repoOwner,
		repoName,
		filePath,
		branch
	)

	-- Function to fetch the latest commit details

		local success, response = pcall(function()
			return game:HttpGet(apiUrl)
		end)

	
			local commits = HttpService:JSONDecode(response)
		
				local latestCommit = commits[1]
				print("Most Recent Commit Details:")
				print("Author: " .. latestCommit.commit.author.name)
				print("Date: " .. latestCommit.commit.author.date)
				print("Message: " .. latestCommit.commit.message)
				print("URL: " .. latestCommit.html_url)
		
	
	

	-- Call the function to fetch and print the latest commit details









	local logs = Window:MakeTab({
		Name = "Update Logs",
		Icon = "http://www.roblox.com/asset/?id=13289068576",
		PremiumOnly = false
	})

	local Section = logs:AddSection({
		Name = "Update Author: "..latestCommit.commit.author.name
	})


	local Section = logs:AddSection({
		Name = "Update Details: "..latestCommit.commit.message
	})



	local fun = Window:MakeTab({
		Name = "NPC Control",
		Icon = "http://www.roblox.com/asset/?id=5326720715",
		PremiumOnly = false



	})

	fun:AddSection({

		Name = 	"These things only work on NPCS! Get closer to them for it to work better."
	})



	fun:AddButton({

		Name = "Kill NPCS",
		Callback = function()

			local npcs={}

			function killNpc(hum)
				if hum:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(hum.Parent) then
					table.insert(npcs,{hum,hum.HipHeight})
					local rootPart=hum.Parent:FindFirstChild("HumanoidRootPart")
					if rootPart then
						hum.Health=0
					end      
				end
			end
			for _,hum in pairs(game:GetService("Workspace"):GetDescendants()) do
				killNpc(hum)
			end

		end,


	})



	fun:AddButton({

		Name = "Fling NPCS",
		Callback = function()

			local npcs={}

			function FlingNpc(hum)
				if hum:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(hum.Parent) then
					table.insert(npcs,{hum,hum.HipHeight})
					hum.HipHeight=1024
				end
			end
			for _,hum in pairs(game:GetService("Workspace"):GetDescendants()) do
				FlingNpc(hum)
			end

		end,


	})



	fun:AddButton({

		Name = "Bring NPCS",
		Callback = function()
			local npcs={}

			function disappear(hum)
				if hum:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(hum.Parent) then
					table.insert(npcs,{hum,hum.HipHeight})
					local rootPart=hum.Parent:FindFirstChild("HumanoidRootPart")
					if rootPart then
						rootPart.CFrame=game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
					end      
				end
			end
			for _,hum in pairs(game:GetService("Workspace"):GetDescendants()) do
				disappear(hum)
			end

		end,


	})
	
	
	fun:AddButton({

		Name = "Void NPCS",
		Callback = function()
			local npcs={}

			function disappear(hum)
				if hum:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(hum.Parent) then
					table.insert(npcs,{hum,hum.HipHeight})
					hum.HipHeight=-1024
				end
			end
			for _,hum in pairs(game:GetService("Workspace"):GetDescendants()) do
				disappear(hum)
			end
		end,


	})
	
	

	fun:AddButton({

		Name = "Sit NPCS",
		Callback = function()

			local npcs={}

			function disappear(hum)
				if hum:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(hum.Parent) then
					table.insert(npcs,{hum,hum.HipHeight})
					local rootPart=hum.Parent:FindFirstChild("HumanoidRootPart")
					if rootPart then
						hum.Sit=true
					end      
				end
			end
			for _,hum in pairs(game:GetService("Workspace"):GetDescendants()) do
				disappear(hum)
			end

		end,


	})


	fun:AddButton({

		Name = "Blackhole (Bring all UNANCHORED parts)",
		Callback = function()

			local character = game.Players.LocalPlayer.Character
			if not character or not character:FindFirstChild("HumanoidRootPart") then
				warn("Player's character or HumanoidRootPart not found.")
				return
			end

			local center = character.HumanoidRootPart.Position -- The position of the "black hole"

			for _, descendant in pairs(workspace:GetDescendants()) do
				if descendant:IsA("BasePart") and not descendant:IsDescendantOf(game.Players.LocalPlayer.Character) then
					-- Create BodyPosition to move the part towards the black hole
					local bodyPosition = Instance.new("BodyPosition")
					bodyPosition.MaxForce = Vector3.new(100000, 100000, 100000) -- Strong force
					bodyPosition.P = 10000 -- Responsiveness of the movement
					bodyPosition.Position = center
					bodyPosition.Parent = descendant

					-- Remove BodyPosition after a few seconds
					task.spawn(function()
						task.wait(5)
						if bodyPosition.Parent then
							bodyPosition:Destroy()
						end
					end)
				end
			end

		end,


	})
	
	
	
	
	fun:AddTextbox({
		Name = "Seconds for NPCs to follow u",
		Default = "",
		TextDisappear = false,
		Callback = function(Value)
			secondsFollow = tonumber(Value)
		end	  
	})
	
	
	fun:AddButton({

		Name = "Make all NPC follow you",
		Callback = function()
			following = true
			for i = 1, tonumber(secondsFollow * 10) do
				if not following then return end
				local npcs={}

				local	function disappear(hum)

					if hum:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(hum.Parent) then
						table.insert(npcs,{hum,hum.HipHeight})
						local rootPart=hum.Parent:FindFirstChild("HumanoidRootPart")
						local targetPos=game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
						hum:MoveTo(targetPos)
						hum.WalkSpeed = huma.WalkSpeed
					end
				end
				for _,hum in pairs(game:GetService("Workspace"):GetDescendants()) do
					disappear(hum)
				end
				wait(.1)
			end
		end,


	})



	fun:AddButton({

		Name = "Stop NPC Following",
		Callback = function()
			following = false

		end,


	})

	


	fun:AddButton({

		Name = "Bang Animation All NPCs (client only sadly)",
		Callback = function()
			local npcs={}

	local 		function bang(hum)
				if hum:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(hum.Parent) then
					table.insert(npcs,{hum,hum.HipHeight})
					local rootPart=hum.Parent:FindFirstChild("HumanoidRootPart")
					local targetPos=game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position

					local Target=hum.Parent
					local bangAnim=Instance.new("Animation")
					if not r15(game:GetService("Players").LocalPlayer) then
						bangAnim.AnimationId="rbxassetid://148840371"
					else
						bangAnim.AnimationId="rbxassetid://5918726674"
					end

					local	bang=hum:LoadAnimation(bangAnim)
					bang:Play(.1,1,1)


				end
			end
			for _,hum in pairs(game:GetService("Workspace"):GetDescendants()) do
				bang(hum)
			end
		end,


	})



	fun:AddTextbox({
		Name = "NPC Spin Power",
		Default = "",
		TextDisappear = false,
		Callback = function(Value)
			npcSpinFollow = tonumber(Value)
		end	  
	})



	fun:AddButton({

		Name = "SPIN ALL NPCS",
		Callback = function()
			local npcs={}

			local 		function spinny(hum)
				if hum:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(hum.Parent) then
					table.insert(npcs,{hum,hum.HipHeight})
					local rootPart=hum.Parent:FindFirstChild("HumanoidRootPart")
					local targetPos=game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position

		
		
				

					-- Set up angular velocity for violent spinning
					local bodyAngularVelocity =rootPart.BodyAngularVelocity or Instance.new("BodyAngularVelocity")
					bodyAngularVelocity.AngularVelocity = Vector3.new(npcSpinFollow,npcSpinFollow,npcSpinFollow) -- High angular velocity
					bodyAngularVelocity.MaxTorque = Vector3.new(1e6, 1e6, 1e6) -- High torque to maintain spin
					bodyAngularVelocity.P = 1e4 -- Power to keep rotation steady
					bodyAngularVelocity.Parent = rootPart

					-- Optional: Add a wait timer to stop spinning after some time
				
		
		
		

				end
			end
			for _,hum in pairs(game:GetService("Workspace"):GetDescendants()) do
				spinny(hum)
			end
		end,


	})

	fun:AddButton({

		Name = "Stop NPC Spin",
		Callback = function()
			local npcs={}

			local 		function Notspinny(hum)
				if hum:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(hum.Parent) then
					table.insert(npcs,{hum,hum.HipHeight})
					local rootPart=hum.Parent:FindFirstChild("HumanoidRootPart")
					local targetPos=game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position





					-- Set up angular velocity for violent spinning
					local bodyAngularVelocity =rootPart.BodyAngularVelocity
					if  bodyAngularVelocity then
						bodyAngularVelocity:Destroy()
					end
				




				end
			end
			for _,hum in pairs(game:GetService("Workspace"):GetDescendants()) do
				Notspinny(hum)
			end
		end,


	})





	Tab:AddToggle({
		Name = "Walk Fling",
		Default = false,
		Callback = function(st)
			if st then
				hiddenfling = true
			else
				hiddenfling = false
			end
		end,
		
		
	})
	
	
	
	
	
	local part = Window:MakeTab({
		Name = "Object Control",
		Icon = "http://www.roblox.com/asset/?id=627675509",
		PremiumOnly = false



	})

	part:AddSection({

		Name = 	"These things only work on Parts (or other physical instances)! Get closer to them for it to work better."
	})
	
	
	
	part:AddButton({

		Name = "Blackhole (Bring all UNANCHORED parts)",
		Callback = function()

			local character = game.Players.LocalPlayer.Character
			if not character or not character:FindFirstChild("HumanoidRootPart") then
				warn("Player's character or HumanoidRootPart not found.")
				return
			end

			local center = character.HumanoidRootPart.Position -- The position of the "black hole"

			for _, descendant in pairs(workspace:GetDescendants()) do
				if descendant:IsA("BasePart") and not descendant:IsDescendantOf(game.Players.LocalPlayer.Character) then
					-- Create BodyPosition to move the part towards the black hole
					local bodyPosition = Instance.new("BodyPosition")
					bodyPosition.MaxForce = Vector3.new(100000, 100000, 100000) -- Strong force
					bodyPosition.P = 10000 -- Responsiveness of the movement
					bodyPosition.Position = center
					bodyPosition.Parent = descendant

					-- Remove BodyPosition after a few seconds
					task.spawn(function()
						task.wait(5)
						if bodyPosition.Parent then
							bodyPosition:Destroy()
						end
					end)
				end
			end

		end,


	})

	part:AddButton({

		Name = "Make Parts Fly Up",
		Callback = function()
			for _, descendant in pairs(workspace:GetDescendants()) do
				if descendant:IsA("BasePart") and not descendant:IsDescendantOf(workspace[plr.Name] or game.Players.LocalPlayer.Character) then
					-- Create BodyVelocity to move the part upwards
					local bodyVelocity = Instance.new("BodyVelocity")
					bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000) -- Strong force in all directions
					bodyVelocity.Velocity = Vector3.new(0, 100, 0) -- Upward velocity
					bodyVelocity.Parent = descendant

					-- Remove BodyVelocity after a few seconds
					task.spawn(function()
						task.wait(50)
						if bodyVelocity.Parent then
							bodyVelocity:Destroy()
						end
					end)
				end
			end
		end,


	})

	
	
	
	
	local feat = Window:MakeTab({
		Name = "Random Features",
		Icon = "http://www.roblox.com/asset/?id=100556601576910",
		PremiumOnly = false


	})
	
	local orbColor
	local orbSize
	
	
	
	
	
	



	feat:AddSection({

		Name = 	"Some of these things may have things that only you can see!"
	})
	
	
	

	feat:AddDropdown({
		Name = "Orb Color",
		Default = "Green",
		Options = {"Blue", "Green", "Yellow", "Red"},
		Callback = function(Value)
			print("the orb color:", Value)

			local colors = {
				["Blue"] = Color3.fromRGB(0,0,255),
				["Green"] = Color3.fromRGB(0,255,0), 
				["Yellow"] = Color3.fromRGB(255,255,0),
				["Red"] = Color3.fromRGB(255,0,0),
			
			}

	orbColor = colors[Value]
				
		
			
		end    
	})
	
	
	feat:AddTextbox({
		Name = "Adjust Orb Size (in studs)",
		Default = "",
		TextDisappear = false,
		Callback = function(Value)
			orbSize = tonumber(Value)
		end	  
	})

	
	
	
	feat:AddButton({
		Name = "Enable Orb",
		Callback = function()
			makeSelfOrb(orbSize, orbColor)
		end,




	})

	feat:AddButton({
		Name = "Remove Orb",
		Callback = function()
			removeOrb()
		end,




	})

	
	
	
	
	
	
	

	local plrTab = Window:MakeTab({
		Name = "Player Settings",
		Icon = "http://www.roblox.com/asset/?id=13289762774",
		PremiumOnly = false


	})





	plrTab:AddSlider({
		Name = "Walkspeed",
		Min = 0,
		Max = 500,
		Default = 16,
		Color = Color3.fromRGB(255,255,255),
		Increment = 1,
		ValueName = "speed",
		Callback = function(Value)
			huma.WalkSpeed = Value
			sliderWalkspeed = Value
		end    
	})




	plrTab:AddToggle({
		Name = "Set WalkSpeed as slider value",
		Default = false,
		Callback = function(run)
			print(" truck follow")

			if run then
				walkSpeedCoroutine = coroutine.create(function()
					while true do
						local success, err = pcall(function()  
							huma.WalkSpeed = sliderWalkspeed
						end)

						if not success then
							Error(err)

						end



						task.wait(0.01)  
					end
				end)

				coroutine.resume(walkSpeedCoroutine)

			else
				if walkSpeedCoroutine and coroutine.status(walkSpeedCoroutine) == "suspended" then
					walkSpeedCoroutine = nil  
				end
			end
		end    
	})






	plrTab:AddSlider({
		Name = "Jumppower",
		Min = 0,
		Max = 500,
		Default = 50,
		Color = Color3.fromRGB(255,255,255),
		Increment = 1,
		ValueName = "jump power",
		Callback = function(Value)
			huma.JumpPower = Value
			sliderJump = Value

		end    
	})



	plrTab:AddToggle({
		Name = "Set JumpPower as slider value",
		Default = false,
		Callback = function(run)
			print(" truck follow")

			if run then
				JumpCoroutine = coroutine.create(function()
					while true do
						local success, err = pcall(function()  
							huma.JumpPower = sliderJump
						end)

						if not success then
							Error(err)

						end



						task.wait(0.01)  
					end
				end)

				coroutine.resume(JumpCoroutine)

			else
				if JumpCoroutine and coroutine.status(JumpCoroutine) == "suspended" then
					JumpCoroutine = nil  
				end
			end
		end    
	})


	plrTab:AddSlider({
		Name = "HipHeight (can trigger anticheats)",
		Min = 0,
		Max = 500,
		Default = 0,
		Color = Color3.fromRGB(255,255,255),
		Increment = 1,
		ValueName = "height (in studs duh)",
		Callback = function(Value)
			huma.HipHeight = Value
			sliderHeight = Value
		end    
	})



	plrTab:AddToggle({
		Name = "Set HipHeight as slider value",
		Default = false,
		Callback = function(run)
			print(" truck follow")

			if run then
				hipHeightCoroutine = coroutine.create(function()
					while true do
						local success, err = pcall(function()  
							huma.HipHeight = sliderHeight
						end)

						if not success then
							Error(err)

						end



						task.wait(0.01)  
					end
				end)

				coroutine.resume(hipHeightCoroutine)

			else
				if hipHeightCoroutine and coroutine.status(hipHeightCoroutine) == "suspended" then
					hipHeightCoroutine = nil  
				end
			end
		end    
	})




	plrTab:AddToggle({
		Name = "Anti Trip",
		Default = false,
		Callback = function(run)
			print(" helo")

			if run then
				antiTripCoroutine = coroutine.create(function()
					while true do
						local success, err = pcall(function()  
							huma.PlatformStand = false 
							huma.Sit = false
							
						end)

						if not success then
							Error(err)

						end



						task.wait(0.01)  
					end
				end)

				coroutine.resume(antiTripCoroutine)

			else
				if antiTripCoroutine and coroutine.status(antiTripCoroutine) == "suspended" then
					antiTripCoroutine = nil  
				end
			end
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
	
	
	
	local duck = Window:MakeTab({
	Name = "Raise A Duck",
Icon = "rbxassetid://0",
PremiumOnly = false
		
	})


duck:AddButton({
	Name = "Kill Raiders",
	Callback = function()

			
	

					for _, descendant in pairs(workspace.Raid:GetDescendants()) do

						if descendant:IsA("Model") and descendant:FindFirstChild("Humanoid") then
							local humanoid = descendant:FindFirstChild("Humanoid")


							if humanoid and not descendant:IsDescendantOf(game.Players.LocalPlayer.Character) then
								--descendant:Destroy()
								char:PivotTo(descendant.PrimaryPart.CFrame)
								humanoid.Health = 0
								print("NPC died lol ", descendant.Name)
							end
						end
					end



			




	end,	
	
})


	duck:AddButton({
		Name = "Collect All Money",
		Callback = function()


local part = Instance.new("Part")
part.Parent = workspace
part.Position = rootpart.Position
part.Size = Vector3.new(0.1,0.1,0.1)
part.Anchored = true
part.Transparency = 1
part.CanCollide = false
			for _, descendant in pairs(workspace:GetDescendants()) do

				if descendant:IsA("BasePart") and descendant.Name == "Money" then
				


					
						--descendant:Destroy()
						char:PivotTo(descendant.CFrame)
			task.wait(.05)
					
				end
				
			end




char:PivotTo(part.CFrame)



		end,	

	})

duck:AddButton({
	Name = "Money Collect Orb",
	Callback = function()
		makeSelfOrb(7, Color3.fromRGB(200,255,0), "CollectMoney")
	end,
	

	
	
})

	duck:AddButton({
		Name = "Remove Orb",
		Callback = function()
		removeOrb()
		end,




	})
 
 
 
 
 
 --[[
 
	duck:AddDropdown({
		Name = "Kick Player",
		Default = "",
		Options = {"Cashier", "Cooks", "Boxer", "Delivery", "Manager", "Supplier"},
		Callback = function(Value)
			print("plr to kick:", Value)

			local players = {
				--Nothing here, but this will be where all the players are as values
		--[[ Example:
		["PlayerNameExample"] = game.Players["PlayerNameExample"]
		
		
		
			}

			local plrToKick = players[Value]

			if plrToKick then
				local success, err = pcall(function()
					local args = {
						[1] = "Kick",
						[2] = game:GetService("Players")[plrToKick]
					}

					game:GetService("ReplicatedStorage").RemoteEvents.HostAction:FireServer(unpack(args))
				end)

				-- Handle errors if the pcall failed
				if not success then
					game:GetService("StarterGui"):SetCore("SendNotification", {
						Title = "AzureEpic",
						Text = "error: "..tostring(err) .. "However, this may be fixed in a few seconds.",
						Icon = "rbxassetid://7733658504",
						Duration = 7
					})
				end
			else
	
			end
		end    
	}) 
	]]
 
 
	duck:AddTextbox({
		Name = "Kick Player (works in-round only)",
		Default = "",
		TextDisappear = false,
		Callback = function(Value)
			local args = {
				[1] = "Kick",
				[2] = game:GetService("Players")[Value]
			}

			game:GetService("ReplicatedStorage").RemoteEvents.HostAction:FireServer(unpack(args))
		end	  
	})

	duck:AddTextbox({
		Name = "Ban Player (from server only, works in-round only)",
		Default = "",
		TextDisappear = false,
		Callback = function(Value)
			local args = {
				[1] = "Ban",
				[2] = game:GetService("Players")[Value]
			}

			game:GetService("ReplicatedStorage").RemoteEvents.HostAction:FireServer(unpack(args))
		end	  
	})


	duck:AddTextbox({
		Name = "Transfer Host to Player",
		Default = "",
		TextDisappear = false,
		Callback = function(Value)
			local args = {
				[1] = "Transfer",
				[2] = game.Players[Value]
			}

			game:GetService("ReplicatedStorage").RemoteEvents.HostAction:FireServer(unpack(args))
		end	  
	})



	duck:AddButton({
		Name = "Transfer Host to yourselfl",
		Callback = function()
			local args = {
				[1] = "Transfer",
				[2] = game.Players.LocalPlayer
			}

			game:GetService("ReplicatedStorage").RemoteEvents.HostAction:FireServer(unpack(args))
		end,




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

--[[
pizza:AddButton({
	Name = "Knock down everyone's mailbox",

	Callback = function()
		
		for i = 1, 100 do
			task.wait()
		
		
		for _, plr in game.Players:GetPlayers() do
			local plrname = plr.Name

			-- Loop through each house from House7 to House11
			for houseNum = 1, 11 do
				local house = workspace.Houses:FindFirstChild("House" .. houseNum)

				-- Check if the house and the player's mailbox exist
				if house and house:FindFirstChild(plrname) then
					local args = {
						[1] = house[plrname]
					}
					workspace.Main.KnockMailbox:FireServer(unpack(args))
				end
			end
		end
		
		end
	end,
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
				["Manager"] = _G.Manager,
				["Delivery"] = _G.Delivery,
			}

			local selectedPosition = locationPositions[Value]

			if selectedPosition then
				local success, err = pcall(function()
					-- Fire the server to activate the supply truck's driver detector
					local truck = workspace.Trucks:FindFirstChild("Supply Truck")
					if truck and truck.Driver and truck.Driver:FindFirstChild("ClickDetector") then
						truck.Driver.ClickDetector:FireServer()
						wait(0.5)

					else
						error("Supply truck not found or missing ClickDetector")
					end

					-- Create a teleport part at the target location for verification
					local truckTP = Instance.new("Part")
					truckTP.Size = Vector3.new(5, 1, 5)
					truckTP.Anchored = true
					truckTP.Position = selectedPosition
					truckTP.Parent = workspace
					truckTP.Name = "TruckTeleportMarker"  -- This marker can help with debugging.

					-- Teleport the truck to the specified position
					if game.Players.LocalPlayer.Character then
						local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
						if hum and hum.SeatPart then
							truck:PivotTo(CFrame.new(selectedPosition))
							print("Truck teleported successfully.")
						else
							error("Failed to teleport truck: player is not sitting in a valid seat.")
						end
					end
				end)

				-- Handle errors if the pcall failed
				if not success then
					game:GetService("StarterGui"):SetCore("SendNotification", {
						Title = "AzureEpic",
						Text = "error: "..tostring(err) .. "However, this may be fixed in a few seconds.",
						Icon = "rbxassetid://7733658504",
						Duration = 7
					})
				end
			else
				print("No position found for selection.")
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



--[[ scrapped till i find a workaround
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

]]



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



--[[]
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
			workspace.Main.ChangeFace:FireServer(char:FindFirstChild("Head").face, "rbxassetid://"..tonumber(Value))
		end	  
	})
]









--[[
Name = <string> - The name of the textbox.
Default = <string> - The default value of the textbox.
TextDisappear = <bool> - Makes the text disappear in the textbox after losing focus.
Callback = <function> - The function of the textbox.
]]


















	print("loaded")

	Error("Loaded!")

end) ---NONE PAST HERE










if not success then
	Error(err)
end




while wait(.1) do
	 fps = math.floor(workspace:GetRealPhysicsFPS())
	 ws = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
	 ping=game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
	 currentPlayers = #game.Players:GetPlayers()
	 maxPlayers = game.Players.MaxPlayers
	 plrTime =  os.date("%X")

end




local NA_storage = Instance.new("ScreenGui")
local RunService = game:GetService("RunService")






if NA_storage:FindFirstChild("juisdfj0i32i0eidsuf0iok") then
	hiddenfling=true
else
	hiddenfling=true
	detection=Instance.new("Decal")
	detection.Name="juisdfj0i32i0eidsuf0iok"
	detection.Parent=NA_storage
	function fling()
		local hrp,c,vel,movel=nil,nil,nil,0.1
		while true do
			RunService.Heartbeat:Wait()
			if hiddenfling then
				local lp=game:GetService("Players").LocalPlayer
				while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
					RunService.Heartbeat:Wait()
					c=lp.Character
					hrp=c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
				end
				if hiddenfling then
					vel=hrp.Velocity
					hrp.Velocity=vel*10000+Vector3.new(0,10000,0)
					RunService.RenderStepped:Wait()
					if c and c.Parent and hrp and hrp.Parent then
						hrp.Velocity=vel
					end
					game:GetService("RunService").Stepped:Wait()
					if c and c.Parent and hrp and hrp.Parent then
						hrp.Velocity=vel+Vector3.new(0,movel,0)
						movel=movel*-1
					end
				end
			end
		end
	end

	fling()
end




