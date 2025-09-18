local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Debris = game:GetService("Debris")
local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

-- Xoá GUI cũ nếu tồn tại
if CoreGui:FindFirstChild("khoa-tapcode-warning") then
	CoreGui["khoa-tapcode-warning"]:Destroy()
end

-- Tạo ScreenGui mới
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "khoa-tapcode-warning"
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = CoreGui
Debris:AddItem(ScreenGui, 30)

-- Tạo nền mờ
local Shade = Instance.new("Frame")
Shade.Size = UDim2.fromScale(1, 1)
Shade.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Shade.BackgroundTransparency = 0.25
Shade.Parent = ScreenGui

-- Gradient nền
local Gradient = Instance.new("UIGradient")
Gradient.Rotation = 80
Gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0.0, Color3.fromRGB(200, 0, 0)),
	ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 0, 120)),
})
Gradient.Parent = Shade

-- Khung thông báo chính
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.fromScale(0.36, 0.16)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.fromScale(0.5, 0.45)
MainFrame.BackgroundColor3 = Color3.fromRGB(27, 27, 32)
MainFrame.Parent = Shade

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- Tiêu đề
local Title = Instance.new("TextLabel")
Title.Text = "THÔNG BÁO TỪ KHOA-TAPCODE"
Title.Size = UDim2.fromScale(1, 0.28)
Title.Position = UDim2.fromScale(0, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 188, 44)
Title.TextScaled = true
Title.Parent = MainFrame

-- Nội dung cảnh báo
local Message = Instance.new("TextLabel")
Message.Text = "Script bảo trì tạm thời!\nVào Discord để cập nhật thông tin mới nhất."
Message.Size = UDim2.fromScale(0.93, 0.38)
Message.Position = UDim2.fromScale(0.035, 0.29)
Message.BackgroundTransparency = 1
Message.Font = Enum.Font.Gotham
Message.TextColor3 = Color3.fromRGB(230, 230, 230)
Message.TextScaled = true
Message.TextWrapped = true
Message.Parent = MainFrame

-- Nút copy Discord
local DiscordLink = "discord.gg/khoa-tapcode"
local CopyBtn = Instance.new("TextButton")
CopyBtn.Text = DiscordLink
CopyBtn.Size = UDim2.fromScale(0.68, 0.21)
CopyBtn.Position = UDim2.fromScale(0.05, 0.7)
CopyBtn.AnchorPoint = Vector2.new(0, 0)
CopyBtn.BackgroundColor3 = Color3.fromRGB(44, 62, 120)
CopyBtn.Font = Enum.Font.GothamSemibold
CopyBtn.TextColor3 = Color3.fromRGB(180, 220, 255)
CopyBtn.TextScaled = true
CopyBtn.BackgroundTransparency = 0.15
CopyBtn.Parent = MainFrame

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0,8)
CopyCorner.Parent = CopyBtn

CopyBtn.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(DiscordLink)
		CopyBtn.Text = "Đã Copy Link!"
		wait(1.5)
		CopyBtn.Text = DiscordLink
	end
end)

-- Nút Đóng
local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "Đóng"
CloseBtn.Size = UDim2.fromScale(0.21, 0.21)
CloseBtn.Position = UDim2.fromScale(0.75, 0.7)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 45)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextScaled = true
CloseBtn.BackgroundTransparency = 0.08
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0,8)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
