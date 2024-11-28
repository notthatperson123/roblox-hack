local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "not a hack",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "nothing",
   LoadingSubtitle = "by Not a person",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = True, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "hHn3DyUU", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "use a key",
      Subtitle = "Key System",
      Note = "look in discord", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"uweafiwaefhiaefhwaeufwaenvwbfgghfuhnguiwnhfiuwefwaefoweniuhwaeiunhiweahgwmgwahiuawefwaeoufoaw"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "your hacked",
   Content = "your ratted",
   Duration = 60,
   Image = nil,
})

local Button = MainTab:CreateButton({
   Name = "inf jump key = F",
   Callback = function()
local Player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local InfiniteJumpEnabled = false -- Start with infinite jump disabled

-- Toggle infinite jump with "F" key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.F then
        InfiniteJumpEnabled = not InfiniteJumpEnabled -- Toggle the state
        if InfiniteJumpEnabled then
            print("Infinite Jump Enabled")
        else
            print("Infinite Jump Disabled")
        end
    end
end)

-- Infinite jump mechanic
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.Space and InfiniteJumpEnabled then
        local character = Player.Character or Player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "walk speed",
   Range = {0, 300},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Button = MainTab:CreateButton({
    Name = "reset walk speed",
   Callback = function()
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
   end,
})

local Button = Tab:CreateButton({
   Name = "admin",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
   end,
})       