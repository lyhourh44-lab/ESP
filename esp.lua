 -- esp.lua

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function createBox(part, color)
    local box = Instance.new("BoxHandleAdornment")
    box.Size = Vector3.new(4, 6, 1)
    box.Color3 = color
    box.Transparency = 0.3
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Adornee = part
    box.Parent = part
    return box
end

local function addESP(player)
    if player == LocalPlayer then return end
    player.CharacterAdded:Connect(function(char)
        local root = char:WaitForChild("HumanoidRootPart")
        createBox(root, Color3.fromRGB(0, 255, 0))
    end)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        createBox(player.Character.HumanoidRootPart, Color3.fromRGB(0, 255, 0))
    end
end

for _, p in ipairs(Players:GetPlayers()) do
    addESP(p)
end
Players.PlayerAdded:Connect(addESP)
