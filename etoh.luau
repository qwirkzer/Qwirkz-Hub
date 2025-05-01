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

-- Beat all towers Button
FarmingTab:CreateButton({
    Name = "Beat All Towers [Non-SCs]",
    Callback = function()
        -- The function that takes place when the button is pressed
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/jtohautowin.lua", true))()()
    end,
})

-- Beat Selected Tower Button
FarmingTab:CreateButton({
    Name = "Beat Selected Tower [Non-SC]",
    Callback = function()
        -- The function that takes place when the button is pressed
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/jtohautowin.lua", true))()(currentInput)
    end,
})

-- Manual Win Section
FarmingTab:CreateSection("Manual Win")

-- Placeholder Label
--FarmingTab:CreateLabel("Coming Soon", "circle-help")

-- Infinity Jump Button
FarmingTab:CreateButton({
    Name = "Infinite Jump [Z]",
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
      game.Players.LocalPlayer.Backpack.ChildRemoved:Connect(function(child)
         if child.Name == "Helicopter Powers" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/helicopterpowers.lua", true))()
         end
      end)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/helicopterpowers.lua", true))()
   end,
})

-- T-Pose Button
ToolsTab:CreateButton({
   Name = "T-Pose",
   Callback = function()
      -- The function that takes place when the button is pressed
      game.Players.LocalPlayer.Backpack.ChildRemoved:Connect(function(child)
         if child.Name == "T-Pose" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/tpose.lua", true))()
         end
      end)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/qwirkzer/scripts/refs/heads/main/etoh/tools/tpose.lua", true))()
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
