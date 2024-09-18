-- Load external scripts
local success1, err1 = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/CONNOMETRO.lua"))()
end)

local success2, err2 = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/refs/heads/main/Anti%20Lag.lua"))()
end)

if not success1 then warn("Error loading CONNOMETRO.lua: " .. tostring(err1)) end
if not success2 then warn("Error loading Anti Lag.lua: " .. tostring(err2)) end

-- Services and variables
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local taskHandle = nil
local extraAmount = 5e9
local buttonActive = false

-- GUI Setup
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

-- Utility Functions
local function safeCall(func)
    local success, err = pcall(func)
    if not success then warn("Error: " .. tostring(err)) end
end

local function getPlayerStrength()
    local success, result = pcall(function()
        local folderData = ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
        return folderData:WaitForChild("Strength").Value
    end)
    if not success then
        warn("Error getting player strength: " .. tostring(result))
        return 0
    end
    return result
end

local function getNextRebirthPrice(currentRebirths)
    return (currentRebirths + 1) * 3e6 + 2e6
end

local function startLoop()
    if taskHandle then return end -- Evita iniciar múltiples bucles
    local success, result = pcall(function()
        local ldata = ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
        local currentRebirths = ldata:WaitForChild("Rebirth").Value
        local nextRebirthPrice = getNextRebirthPrice(currentRebirths)

        if getPlayerStrength() < nextRebirthPrice + extraAmount then
            textButton.Text = "Rebirth (ON)"
            taskHandle = RunService.Heartbeat:Connect(function()
                pcall(function()
                    ReplicatedStorage.Package.Events.reb:InvokeServer()
                end)
                wait(1) -- Reduce la carga con un tiempo de espera mayor
            end)
        else
            textButton.Text = "Stats (OFF)"
            stopLoop()
        end
    end)
    if not success then
        warn("Error in startLoop: " .. tostring(result))
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
    local success, result = pcall(function()
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
    end)
    if not success then
        warn("Error in initialCheck: " .. tostring(result))
    end
end

-- Character Functions
local function clearEffects(character)
    if not character then return end
    for _, obj in pairs(character:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
            if not obj.Name:lower():find("line") then
                pcall(function()
                    obj:Destroy()
                end)
            end
        elseif obj:IsA("Sound") then
            pcall(function()
                obj:Destroy()
            end)
        end
    end
end

local function convertToDuck(character)
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end

    for _, v in pairs(character:GetChildren()) do
        if v:IsA("Hat") or v:IsA("Accessory") then
            pcall(function()
                v:Destroy()
            end)
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
            pcall(function()
                part.Transparency = 1
            end)
        end
    end
    pcall(function()
        character.HumanoidRootPart.Transparency = 0
    end)
end

local function moveQuestGui()
    local questGui = player.PlayerGui:FindFirstChild("Main")
                and player.PlayerGui.Main:FindFirstChild("MainFrame")
                and player.PlayerGui.Main.MainFrame:FindFirstChild("Frames")
                and player.PlayerGui.Main.MainFrame.Frames:FindFirstChild("Quest")

    if questGui then
        pcall(function()
            questGui.Parent = ReplicatedStorage
        end)
    end
end

local function onCharacterAdded(character)
    clearEffects(character)
    convertToDuck(character)
    moveQuestGui() -- Mueve el GUI cuando el personaje cambia
end

if player.Character then
    onCharacterAdded(player.Character)
end

player.CharacterAdded:Connect(onCharacterAdded)

-- Continuous character update (Optimizado)
local char
local lastCharacterCheck = tick()
RunService.Heartbeat:Connect(function()
    if tick() - lastCharacterCheck > 1 then -- Reduce la frecuencia de comprobación a cada segundo
        lastCharacterCheck = tick()
        char = player.Character
        if char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 and char:FindFirstChild("HumanoidRootPart") then
            pcall(function()
                clearEffects(char)
                convertToDuck(char)
                moveQuestGui()
            end)
        end
    end
end)

-- Connect button click
textButton.MouseButton1Click:Connect(onClick)

-- Initial check
initialCheck()
