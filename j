-- New draggable Orion Lib script for hub creations!
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AzureEpic/orion/refs/heads/main/Source')))()




_G.DoorbellDelay = .1
_G.TruckTPPos = Vector3.new(46.4887, 3.80013, 126.255)




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
	Name = "Teleport supply truck into restaurant (troll)",
	Callback = function()
		workspace.Trucks:FindFirstChild("Supply Truck").Driver.ClickDetector.Detector:FireServer()
wait(.5)
		
game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position = _G.TruckTPPos
	end,
	
	
	
	
})
