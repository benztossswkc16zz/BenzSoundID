local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = playerGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.Size = UDim2.new(0, 350, 0, 250)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Active = true
MainFrame.Draggable = true

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Text = "SOUND ID PLAYER"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold

local IDBox = Instance.new("TextBox")
IDBox.Parent = MainFrame
IDBox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
IDBox.Position = UDim2.new(0.08, 0, 0.2, 0)
IDBox.Size = UDim2.new(0.84, 0, 0, 35)
IDBox.PlaceholderText = "Enter Sound ID"
IDBox.Text = ""
IDBox.TextColor3 = Color3.fromRGB(255, 255, 255)
IDBox.TextSize = 14
IDBox.Font = Enum.Font.Gotham

local PlayBtn = Instance.new("TextButton")
PlayBtn.Parent = MainFrame
PlayBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
PlayBtn.Position = UDim2.new(0.08, 0, 0.55, 0)
PlayBtn.Size = UDim2.new(0.4, 0, 0, 35)
PlayBtn.Text = "PLAY"
PlayBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayBtn.TextSize = 14
PlayBtn.Font = Enum.Font.GothamBold

local StopBtn = Instance.new("TextButton")
StopBtn.Parent = MainFrame
StopBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
StopBtn.Position = UDim2.new(0.52, 0, 0.55, 0)
StopBtn.Size = UDim2.new(0.4, 0, 0, 35)
StopBtn.Text = "STOP"
StopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StopBtn.TextSize = 14
StopBtn.Font = Enum.Font.GothamBold

local currentSound = nil

PlayBtn.MouseButton1Click:Connect(function()
    local soundID = IDBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
    if soundID == "" or not tonumber(soundID) then
        PlayBtn.Text = "ERROR"
        task.wait(1)
        PlayBtn.Text = "PLAY"
        return
    end
    if currentSound then
        currentSound:Stop()
        currentSound:Destroy()
    end
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        currentSound = Instance.new("Sound")
        currentSound.SoundId = "rbxassetid://" .. soundID
        currentSound.Volume = 0.5
        currentSound.Parent = character.HumanoidRootPart
        currentSound:Play()
        PlayBtn.Text = "PLAYING"
    end
end)

StopBtn.MouseButton1Click:Connect(function()
    if currentSound then
        currentSound:Stop()
        currentSound:Destroy()
        currentSound = nil
    end
    PlayBtn.Text = "PLAY"
end)
