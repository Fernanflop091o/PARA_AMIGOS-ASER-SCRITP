local success1, err1 = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/CONNOMETRO.lua"))()
end)

local success2, err2 = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/refs/heads/main/Anti%20Lag.lua"))()
end)

if not success1 then warn("Error loading CONNOMETRO.lua: " .. tostring(err1)) end
if not success2 then warn("Error loading Anti Lag.lua: " .. tostring(err2)) end


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local hasPrintedError = false


local guiButton = Instance.new("ScreenGui", game.CoreGui)
guiButton.Name = "ClickableButtonGui"

local frameButton = Instance.new("Frame", guiButton)
frameButton.Name = "ButtonFrame"
frameButton.Size = UDim2.new(0.100061566, 0, 0.100026964, 0)
frameButton.Position = UDim2.new(0.0116822431 + 0.77, 0, 0.0248226952, 0)
frameButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frameButton.BackgroundTransparency = 0.5
frameButton.ClipsDescendants = true

Instance.new("UICorner", frameButton).CornerRadius = UDim.new(1, 0)

local textButton = Instance.new("TextButton", frameButton)
textButton.Name = "ClickableButton"
textButton.Size = UDim2.new(1, -10, 1, -10)
textButton.Position = UDim2.new(0, 5, 0, 5)
textButton.BackgroundTransparency = 1
textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
textButton.TextStrokeTransparency = 0
textButton.Font = Enum.Font.SourceSans
textButton.TextSize = 18
textButton.TextWrapped = true
textButton.TextXAlignment = Enum.TextXAlignment.Center
textButton.TextYAlignment = Enum.TextYAlignment.Center
textButton.Text = "Click Me (OFF)"

local buttonActive = false
local taskHandle
local extraAmount = 5e9


local function safeCall(func)
    local success, err = pcall(func)
    if not success and not hasPrintedError then
        warn("Error: " .. tostring(err))
        hasPrintedError = true
    end
end

local function getPlayerStrength()
    local folderData = ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
    return folderData:WaitForChild("Strength").Value
end

local function getNextRebirthPrice(currentRebirths)
    return (currentRebirths + 1) * 3e6 + 2e6
end

local function startLoop()
    local ldata = ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
    local currentRebirths = ldata:WaitForChild("Rebirth").Value
    local nextRebirthPrice = getNextRebirthPrice(currentRebirths)

    if getPlayerStrength() < nextRebirthPrice + extraAmount then
        textButton.Text = "Rebirth (ON)"
        taskHandle = RunService.Heartbeat:Connect(function()
            ReplicatedStorage.Package.Events.reb:InvokeServer()
            wait(1)
        end)
    else
        textButton.Text = "Stats (OFF)"
        stopLoop()
    end
end

local function stopLoop()
    if taskHandle then
        taskHandle:Disconnect()
        taskHandle = nil
    end
end

local function onClick()
    buttonActive = not buttonActive
    if buttonActive then
        startLoop()
    else
        stopLoop()
    end
    textButton.Text = buttonActive and "Rebirth (ON)" or "Stats (OFF)"
end

local function initialCheck()
    local ldata = ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
    local currentRebirths = ldata:WaitForChild("Rebirth").Value
    local nextRebirthPrice = getNextRebirthPrice(currentRebirths)
    local playerStrength = getPlayerStrength()

    if playerStrength >= nextRebirthPrice + extraAmount then
        textButton.Text = "Click Me (OFF)"
        buttonActive = false
    else
        textButton.Text = "Click Me (ON)"
        buttonActive = true
        startLoop()
    end
end

local function clearEffects(character)
    safeCall(function()
        if character then
            for _, obj in pairs(character:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                    if not obj.Name:lower():find("line") then
                        obj:Destroy()
                    end
                elseif obj:IsA("Sound") then
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
    convertToDuck(character)
end

if player.Character then
    safeCall(function()
        onCharacterAdded(player.Character)
    end)
end

player.CharacterAdded:Connect(onCharacterAdded)

local questGui = player.PlayerGui:FindFirstChild("Main")
                and player.PlayerGui.Main:FindFirstChild("MainFrame")
                and player.PlayerGui.Main.MainFrame:FindFirstChild("Frames")
                and player.PlayerGui.Main.MainFrame.Frames:FindFirstChild("Quest")

if questGui then
    safeCall(function()
        questGui.Parent = ReplicatedStorage
    end)
end

spawn(function()
    while true do
        safeCall(function()
            local char = player.Character
            if char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 and char:FindFirstChild("HumanoidRootPart") then
                clearEffects(char)
                convertToDuck(char)
            end
        end)
        wait(0.01)
    end
end)


textButton.MouseButton1Click:Connect(onClick)

initialCheck()
