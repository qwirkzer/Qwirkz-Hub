-- // Open-sourced, but please do not claim that this script is yours. Thank you.
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Qwirkz Hub - Eternal Towers of Hell",
   Icon = 81992215231772, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Qwirkz Hub",
   LoadingSubtitle = "by @qwirkzzy",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Qwirkz Hub [EToH]"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "qwirkzer", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Qwirkz Hub",
      Subtitle = "Key System",
      Note = "", -- Use this to tell the user how to get a key
      FileName = "QwirkzHubKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Admin"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- Tabs
local MainTab = Window:CreateTab("Main", "info")
local FarmingTab = Window:CreateTab("Farming", "tractor")
local ToolsTab = Window:CreateTab("Tools", "swords")
local OtherTab = Window:CreateTab("Other", "info")

-- Main Tab
-- Placeholder Label
MainTab:CreateLabel("Coming Soon", "circle-help")

-- Farming Tab
-- Autowin Section
FarmingTab:CreateSection("Autowin")

-- Tower Selection Input
local currentInput = ""
FarmingTab:CreateInput({
    Name = "Select Tower To Beat",
    CurrentValue = "",
    PlaceholderText = "Tower acronym here",
    RemoveTextAfterFocusLost = false,
    Flag = "TowerSelecion",
    Callback = function(Text)
        -- The function that takes place when the input is changed
        -- The variable (Text) is a string for the value in the text box
        currentInput = Text
    end,
})

-- Time Selection Input
local timeInput = 0
FarmingTab:CreateInput({
    Name = "Select Time To Beat",
    CurrentValue = "0",
    PlaceholderText = "Leave blank for 0 time",
    RemoveTextAfterFocusLost = false,
    Flag = "TimeSelection",
    Callback = function(Text)
         timeInput = tonumber(Text) or 0
         if string.find(Text, "inf") then
            timeInput = math.huge
         end
    end,
})

-- Beat all towers Button
FarmingTab:CreateButton({
    Name = "[NON-SCS] Beat All Towers With Time",
    Callback = function()
        -- The function that takes place when the button is pressed
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/jtohautowin.lua", true))()(nil, timeInput)
    end,
})

-- Beat Selected Tower Button
FarmingTab:CreateButton({
    Name = "[NON-SC] Beat Selected Tower With Time",
    Callback = function()
        -- The function that takes place when the button is pressed
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/jtohautowin.lua", true))()(currentInput, timeInput)
    end,
})

-- Manual Win Section
FarmingTab:CreateSection("Manual Win")

-- Placeholder Label
--FarmingTab:CreateLabel("Coming Soon", "circle-help")

-- Infinity Jump Button
FarmingTab:CreateButton({
    Name = "Jump Infinitely [Z]",
    Callback = function()
        -- The function that takes place when the button is pressed
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/infjump.lua", true))()("Z")
    end,
})

-- Tools Tab
-- Animation Section
ToolsTab:CreateSection("Animated Tools")

-- Helicopter Powers Button
ToolsTab:CreateButton({
   Name = "Helicopter Powers",
   Callback = function()
      -- The function that takes place when the button is pressed
      game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
         loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/helicopterpowers.lua", true))()
      end)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/helicopterpowers.lua", true))()
   end,
})

-- T-Pose Button
ToolsTab:CreateButton({
   Name = "T-Pose",
   Callback = function()
      -- The function that takes place when the button is pressed
      game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
         loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/tpose.lua", true))()
      end)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/tpose.lua", true))()
   end,
})

-- Boost Section
ToolsTab:CreateSection("Boost Items")

local connection = nil

-- Bypass Boost Item Detection Toggle
ToolsTab:CreateToggle({
   Name = "Bypass Boost Item Detection",
   CurrentValue = false,
   Flag = "BoostBypass", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      -- The function that takes place when the toggle is pressed
      -- The variable (Value) is a boolean on whether the toggle is true or false
      if Value == false then
         connection:Disconnect()
         connection = false
         for _, item in game.Players.LocalPlayer.Backpack:GetChildren() do
            item.Name = item.Name:gsub("-nodetect", "")
         end
      elseif Value == true then
         if connection then
            connection:Disconnect()
         end
         if connection ~= false then
            connection = game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
               for _, item in game.Players.LocalPlayer.Backpack:GetChildren() do
                  item.Name = item.Name .. "-nodetect"
               end
            end)
         end
         for _, item in game.Players.LocalPlayer.Backpack:GetChildren() do
            item.Name = item.Name .. "-nodetect"
         end
      end
   end,
})

-- Bootleg Coil Button
ToolsTab:CreateButton({
   Name = "Bootleg Coil",
   Callback = function()
      -- The function that takes place when the button is pressed
      game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
         loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/bootlegcoil.lua", true))()
      end)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/bootlegcoil.lua", true))()
   end,
})

-- Bootleg Speed Coil Button
ToolsTab:CreateButton({
   Name = "Bootleg Speed Coil",
   Callback = function()
      -- The function that takes place when the button is pressed
      game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
         loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/bootlegspeedcoil.lua", true))()
      end)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/bootlegspeedcoil.lua", true))()
   end,
})

-- Vertical Mobility Button
ToolsTab:CreateButton({
   Name = "Vertical Mobility",
   Callback = function()
      -- The function that takes place when the button is pressed
      game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
         loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/verticalmobility.lua", true))()
      end)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/verticalmobility.lua", true))()
   end,
})

-- Other Section
ToolsTab:CreateSection("Other Tools")

-- F3X Button
ToolsTab:CreateButton({
    Name = "F3X Building Tools",
    Callback = function()
        -- The function that takes place when the button is pressed
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/refs/heads/main/f3x.lua", true))()
    end,
})

-- Other Tab
OtherTab:CreateButton({
    Name = "Exit UI",
    Callback = function()
        Rayfield:Destroy()
    end,
})


Rayfield:LoadConfiguration()
