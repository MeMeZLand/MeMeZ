if game:GetService("CoreGui"):FindFirstChild("MeMeZAnnouncement") then return end
local Supports = {
    ["128017651370280"] = "Grow Your Country!.lua",
    ["138804971020716"] = "Grow Your Country!.lua",
    ["18687417158"] = "Forsaken.lua"
}
local Scriptname = Supports[tostring(game.PlaceId)] or "Universal.lua"
getgenv().MeMeZStorage = "https://raw.githubusercontent.com/MeMeZLand/MeMeZ/refs/heads/main/"
local Announcement = loadstring(game:HttpGet(getgenv().MeMeZStorage.."Information.lua"))().Announcement
local MeMeZAnnouncement = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local Content = Instance.new("TextLabel")
local Confirm = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")

MeMeZAnnouncement.Name = "MeMeZAnnouncement"
MeMeZAnnouncement.Parent = game:GetService("CoreGui")

Main.Name = "Main"
Main.Parent = MeMeZAnnouncement
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0.633535683, 0, 0.788413107, 0)

Title.Name = "Title"
Title.Parent = Main
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.5, 0, 0.0399361029, 0)
Title.Size = UDim2.new(0.239520952, 0, 0.0798722059, 0)
Title.Font = Enum.Font.SourceSans
Title.Text = "公告"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextScaled = true
Title.TextSize = 45.000
Title.TextWrapped = true

UICorner.CornerRadius = UDim.new(0.0500000007, 0)
UICorner.Parent = Main

Content.Name = "Content"
Content.Parent = Main
Content.AnchorPoint = Vector2.new(0.5, 0.5)
Content.BackgroundColor3 = Color3.fromRGB(244, 244, 244)
Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
Content.BorderSizePixel = 0
Content.Position = UDim2.new(0.5, 0, 0.539936125, 0)
Content.Size = UDim2.new(1, 0, 0.920127809, 0)
Content.Font = Enum.Font.SourceSans
Content.Text = Announcement
Content.TextColor3 = Color3.fromRGB(0, 0, 0)
Content.TextScaled = true
Content.TextSize = 50.000
Content.TextWrapped = true
Content.TextXAlignment = Enum.TextXAlignment.Left
Content.TextYAlignment = Enum.TextYAlignment.Top

Confirm.Name = "Confirm"
Confirm.Parent = Main
Confirm.AnchorPoint = Vector2.new(0.5, 0.5)
Confirm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Confirm.BorderColor3 = Color3.fromRGB(0, 0, 0)
Confirm.BorderSizePixel = 0
Confirm.Position = UDim2.new(0.5, 0, 0.920127809, 0)
Confirm.Size = UDim2.new(0.330538929, 0, 0.127795532, 0)
Confirm.AutoButtonColor = false
Confirm.Font = Enum.Font.SourceSans
Confirm.Text = "我已知晓"
Confirm.TextColor3 = Color3.fromRGB(0, 0, 0)
Confirm.TextScaled = true
Confirm.TextSize = 14.000
Confirm.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0.0500000007, 0)
UICorner_2.Parent = Confirm

Confirm.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(Confirm, TweenInfo.new(0.25), {Transparency = 0.75}):Play()
end)

Confirm.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(Confirm, TweenInfo.new(0.25), {Transparency = 0}):Play()
end)

Confirm.MouseButton1Click:Connect(function()
    MeMeZAnnouncement:Destroy()
    loadstring(game:HttpGet(getgenv().MeMeZStorage.."Scripts/"..Scriptname))()
end)
