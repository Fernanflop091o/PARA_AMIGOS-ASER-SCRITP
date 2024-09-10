local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local hasPrintedError = false

local function safeCall(func)
    local success, err = pcall(func)
    if not success and not hasPrintedError then
        warn("Error: " .. tostring(err))
        hasPrintedError = true
    end
end

local function clearEffects(character)
    safeCall(function()
        if character then
            local effects = character:FindFirstChild("Effects")
            if effects then
                effects:Destroy()
            end            
            for _, obj in pairs(character:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Sound") or
               obj:IsA("Beam") or obj:IsA("Trail") or
               obj:IsA("BillboardGui") or obj:IsA("SurfaceGui") or
               obj:IsA("Animation") or obj:IsA("AnimationTrack") then
                obj:Destroy()
                end
            end
        end
    end)
end


local function convertToDuck(character)
    safeCall(function()
        if character and character:FindFirstChild("HumanoidRootPart") then
            for _, v in pairs(character:GetChildren()) do
                if v:IsA("Hat") or v:IsA("Accessory") then
                    v:Destroy()
                end
            end

            local duckMesh = Instance.new("SpecialMesh")
            duckMesh.MeshType = Enum.MeshType.FileMesh
            duckMesh.MeshId = "http://www.roblox.com/asset/?id=9419831"
            duckMesh.TextureId = "http://www.roblox.com/asset/?id=9419827"
            duckMesh.Scale = Vector3.new(5, 5, 5)
            duckMesh.Parent = character.HumanoidRootPart

            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = 1
                end
            end
            character.HumanoidRootPart.Transparency = 0
        end
    end)
end

local function onCharacterAdded(character)
    clearEffects(character)
    setWalkingAnimation(character)
    convertToDuck(character)
end

if player.Character then
    safeCall(function()
        onCharacterAdded(player.Character)
    end)
end
player.CharacterAdded:Connect(onCharacterAdded)

if player and player.Character then
    safeCall(function()
        local forceField = Instance.new("ForceField")
        forceField.Parent = player.Character
    end)
end

local questGui = player.PlayerGui:FindFirstChild("Main")
                and player.PlayerGui.Main:FindFirstChild("MainFrame")
                and player.PlayerGui.Main.MainFrame:FindFirstChild("Frames")
                and player.PlayerGui.Main.MainFrame.Frames:FindFirstChild("Quest")
if questGui then
    safeCall(function()
        questGui.Parent = ReplicatedStorage
    end)
end

local function format_number(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end

    local formatted_number = string.format("%.2f", number)

    if math.floor(number) == number then
        formatted_number = string.format("%d", number)
    end

    return formatted_number .. suffixes[suffix_index]
end

local playerData = ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
local rebirthValue = playerData:WaitForChild("Rebirth")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RebirthDisplay"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 100, 0, 50)
frame.Position = UDim2.new(0.4547352431, 0, 0.129187226992, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 25)
uiCorner.Parent = frame

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.Text = format_number(rebirthValue.Value)
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.BackgroundTransparency = 1
textLabel.TextScaled = true
textLabel.Parent = frame

rebirthValue.Changed:Connect(function()
    safeCall(function()
        textLabel.Text = format_number(rebirthValue.Value)
    end)
end)

spawn(function()
    while true do
        safeCall(function()
            if player.Character then
                clearEffects(player.Character)
            end
        end)
        wait(0.5)
    end
end)




