local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Debris = game:GetService("Debris")

local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

pcall(function()
    local old = CoreGui:FindFirstChild("skibidi-warning")
    if old then old:Destroy() end
end)

local GUI_NAME = "skibidi-ui"

if CoreGui:FindFirstChild(GUI_NAME) then
    return
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = GUI_NAME
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui
Debris:AddItem(ScreenGui, 25)

local Background = Instance.new("Frame")
Background.Name = "Background"
Background.BackgroundTransparency = 1
Background.Size = UDim2.fromScale(1, 1)
Background.BorderSizePixel = 0
Background.Parent = ScreenGui

local MiniBar = Instance.new("Frame")
MiniBar.Name = "MiniBar"
MiniBar.Size = UDim2.fromScale(0.18, 0.06)
MiniBar.AnchorPoint = Vector2.new(0.5, 1)
MiniBar.Position = UDim2.new(0.5, 0, 0.98, 0)
MiniBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MiniBar.BackgroundTransparency = 0
MiniBar.BorderSizePixel = 0
MiniBar.Parent = Background

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(0, 8)
MiniCorner.Parent = MiniBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.fromScale(0.18, 0.75)
CloseButton.AnchorPoint = Vector2.new(1, 0.5)
CloseButton.Position = UDim2.fromScale(0.98, 0.5)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "✕"
CloseButton.Font = Enum.Font.FredokaOne
CloseButton.TextScaled = true
CloseButton.TextColor3 = Color3.fromRGB(235, 20, 20)
CloseButton.Parent = MiniBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

CloseButton.Activated:Connect(function()
    pcall(function() ScreenGui:Destroy() end)
end)

pcall(function()
    local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local t = TweenService:Create(MiniBar, tweenInfo, { BackgroundTransparency = 0 })
    MiniBar.BackgroundTransparency = 1
    t:Play()
end)
