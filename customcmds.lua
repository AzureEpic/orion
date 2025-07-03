--[[STEPS ON IMPLEMENTATION
Add this block of code somewhere idk

--NEW 3058 line


-- In your Origin Script

-- ... (Your global definitions: didYouMean, doPREDICTION, adminName, Window, ParseArguments, Spawn, DoNotif, Concat, Insert, Format, ContextActionService) ...

local commandScriptContent = game:HttpGet("https://raw.githubusercontent.com/YourRepo/your_commands_script.lua") -- Make sure this URL is correct and accessible

local success, chunk_or_error_msg = pcall(loadstring, commandScriptContent)

if success then
    local origin_env = getfenv(0)
    setfenv(chunk_or_error_msg, origin_env) -- Use chunk_or_error_msg as the chunk function

    -- Crucially: Execute the chunk and capture its return value
    local runSuccess, returned_value = pcall(chunk_or_error_msg) -- Capture the actual returned value here

    if runSuccess then
        -- Check if the returned_value is what we expect (the cmd table)
        if returned_value and type(returned_value) == "table" and returned_value.run then
            local myCommands = returned_value -- This is your 'cmd' table from the other script!
            print("Commands script loaded and 'cmd' table received successfully!")
            myCommands.run({"debugtest"}) -- Test a command
            -- You can now use myCommands.add(), myCommands.run(), myCommands.loop(), etc.
        else
            warn("Commands script did not return a valid 'cmd' table. Returned type: " .. type(returned_value))
            if returned_value == nil then
                warn("Returned value was nil. This might indicate an unhandled error in the called script before its return statement.")
            end
        end
    else
        -- If runSuccess is false, returned_value is the error message
        warn("Error running commands script: " .. returned_value)
    end
else
    warn("Error loading commands script content (loadstring failed): " .. chunk_or_error_msg)
end



















]]





-- In your Called Script (e.g., your_commands_script.lua)

local _cmds={ -- Renamed to '_cmds' to differentiate from 'cmd.Commands'
	Commands={};
	Aliases={};
	NASAVEDALIASES = {};
}

local cmd = {}
local commandcount = 0
local Loops = {}

-- *** NEW LINES: Expose the internal command storage tables through the 'cmd' table ***
cmd.Commands = _cmds.Commands
cmd.Aliases = _cmds.Aliases
-- Optionally: cmd._InternalCmdsTable = _cmds -- You could expose the whole thing if needed for debugging

-- Define all 'cmd' methods, making sure they use '_cmds' internally
cmd.add = function(aliases, info, func, requiresArguments)
	requiresArguments = requiresArguments or false
	local data = {func, info, requiresArguments}

	for i, cmdName in pairs(aliases) do
		if i == 1 then
			_cmds.Commands[cmdName:lower()] = data -- Use _cmds here
		else
			_cmds.Aliases[cmdName:lower()] = data  -- Use _cmds here
		end
	end

	commandcount += 1
end

-- *** IMPORTANT: Define all 'cmd' methods here, BEFORE any calls to cmd.add ***


cmd.run = function(args)
	   print("DEBUG: cmd.run received args:", tostring(table.concat(args, ", ")))
    print("DEBUG: Command name received by cmd.run:", args[1]) -- See the first argument specifically
	local caller, arguments = args[1], args
	table.remove(args, 1)

	local success, msg = pcall(function()
		local command = cmds.Commands[caller:lower()] or cmds.Aliases[caller:lower()]
		if command then
			command[1](unpack(arguments))
		else
			local closest = didYouMean(caller:lower())
			if closest and doPREDICTION then
				local commandFunc = cmds.Commands[closest] and cmds.Commands[closest][1] or cmds.Aliases[closest] and cmds.Aliases[closest][1]
				local requiresInput = cmds.Commands[closest] and cmds.Commands[closest][3] or cmds.Aliases[closest] and cmds.Aliases[closest][3]

				if requiresInput then
					Window({
						Title = adminName,
						Description = "Command [ "..caller.." ] doesn't exist\nDid you mean [ "..closest.." ]?",
						InputField = true,
						Buttons = {
							{
								Text = "Submit",
								Callback = function(input)
									local parsedArguments = ParseArguments(input)
									if parsedArguments then
										Spawn(function() commandFunc(unpack(parsedArguments)) end)
									else
										Spawn(function() commandFunc() end)
									end
								end
							}
						}
					})
				else
					Window({
						Title = adminName,
						Description = "Command [ "..caller.." ] doesn't exist\nDid you mean [ "..closest.." ]?",
						Buttons = {
							{
								Text = "Run Command",
								Callback = function()
									Spawn(function()
										commandFunc()
									end)
								end
							}
						}
					})
				end
			end
		end
	end)
end

cmd.loop = function(commandName, args)
	local command = cmds.Commands[commandName:lower()] or cmds.Aliases[commandName:lower()]
	if not command then
		DoNotif("Command '"..commandName.."' does not exist.", 3)
		return
	end

	local function GenerateLoopKey(name, arguments)
		return name:lower().." "..Concat(arguments or {}, " ")
	end

	local function FormatArgs(arguments)
		if not arguments or #arguments == 0 then
			return "(no args)"
		end
		return Concat(arguments, ", ")
	end

	Window({
		Title = "Set Loop Delay",
		Description = "Enter the delay (in seconds) for the loop of command: "..commandName,
		InputField = true,
		Buttons = {
			{
				Text = "Submit",
				Callback = function(input)
					local interval = tonumber(input) or 0
					if interval < 0 then
						DoNotif("Invalid delay. Loop not started.", 3)
						return
					end

					local loopKey = GenerateLoopKey(commandName, args)

					if Loops[loopKey] then
						DoNotif("A loop with these arguments is already running for '"..commandName.."'.", 3)
						return
					end

					Loops[loopKey] = {
						commandName = commandName,
						command = command[1],
						args = args or {},
						interval = interval,
						running = true
					}

					Spawn(function()
						while Loops[loopKey] and Loops[loopKey].running do
							pcall(function()
								Loops[loopKey].command(unpack(Loops[loopKey].args))
							end)
							Wait(Loops[loopKey].interval)
						end
					end)

					DoNotif("Loop started for '"..commandName.."' with delay: "..interval.."s. Args: "..FormatArgs(args), 3)
				end
			}
		}
	})
end

cmd.stopLoop = function()
	if next(Loops) == nil then
		DoNotif("No active loops to stop.", 2)
		return
	end

	local function FormatArgs(arguments)
		if not arguments or #arguments == 0 then
			return "(no args)"
		end
		return Concat(arguments, ", ")
	end

	local buttons = {}

	for loopKey, loopData in pairs(Loops) do
		local label = Format("'%s' | Args: %s | Delay: %ss", loopData.commandName, FormatArgs(loopData.args), loopData.interval)
		Insert(buttons, {
			Text = label,
			Callback = function()
				loopData.running = false
				Loops[loopKey] = nil
				DoNotif("Stopped loop: '"..loopData.commandName.."' with args: "..FormatArgs(loopData.args), 3)
			end
		})
	end

	Window({
		Title = "Stop a Loop",
		Description = "Select a loop to stop:",
		Buttons = buttons
	})
end

-- *** Now you can call cmd.add to register your commands ***
cmd.add({"debugtest","debugtest"},{"scripthub (hub)","Thanks to scriptblox api"},function()
	print("hiiiisaa$;&:&,$&:&;")
end)
cmd.add({"skibid","sdhdjdjjdjjd"},{"scripthub (hub)","Thanks to scriptblox api"},function()
	print("mango mango")
end)
cmd.add({"myhub","crappyhub"},{"myhub","worst script"},function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AzureEpic/orion/refs/heads/main/j"))()
end)
cmd.add({"invisbind","invisbutton"},{"invisbind","invisible button"},function()
	local key = Enum.KeyCode.X -- Key to toggle invisibility
	local invis_on = false

	-- Function to toggle invisibility
	local function toggleInvisibility()
		local chat = game:GetService("UserInputService"):GetFocusedTextBox()
		if chat then return end

		invis_on = not invis_on
		if invis_on then
			local savedpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			wait()
			game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-25.95, 84, 3537.55))
			wait(.15)
			local Seat = Instance.new('Seat', game.Workspace)
			Seat.Anchored = false
			Seat.CanCollide = false
			Seat.Name = 'invischair'
			Seat.Transparency = 1
			Seat.Position = Vector3.new(-25.95, 84, 3537.55)
			local Weld = Instance.new("Weld", Seat)
			Weld.Part0 = Seat
			Weld.Part1 = game.Players.LocalPlayer.Character:FindFirstChild("Torso") or game.Players.LocalPlayer.Character.UpperTorso
			wait()
			Seat.CFrame = savedpos
			game.StarterGui:SetCore("SendNotification", {
				Title = "Invis On";
				Duration = 1;
				Text = "";
			})
		else
			local chair = workspace:FindFirstChild('invischair')
			if chair then chair:Destroy() end
			game.StarterGui:SetCore("SendNotification", {
				Title = "Invis Off";
				Duration = 1;
				Text = "";
			})
		end
	end

	-- Setup ContextActionService (assumed global from origin script)
	local function onAction(_, inputState)
		if inputState == Enum.UserInputState.Begin then
			toggleInvisibility()
		end
	end
	ContextActionService:BindAction("ToggleInvisibility", onAction, true, key)
	ContextActionService:SetTitle("ToggleInvisibility", "Invis")
	ContextActionService:SetPosition("ToggleInvisibility", UDim2.new(0, 20, 0, 100))
end)
cmd.add({"vis","unbindinvid"},{"vis","removes invis bind"},function()
    -- ContextActionService (assumed global from origin script)
	ContextActionService:UnbindAction("ToggleInvisibility")
end)

cmd.add({"walkonwalls","gravcontrol"},{"wonw","gravity walk thing"},function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AzureEpic/noo/refs/heads/main/STOPP.lua"))()
end)

-- *** IMPORTANT: Return the 'cmd' table at the very end of the script ***
return cmd
