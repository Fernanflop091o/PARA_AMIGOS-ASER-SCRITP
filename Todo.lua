-- Cargar scripts externos
loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/CONNOMETRO.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/refs/heads/main/Anti%20Lag.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local hasPrintedError = false

-- Crear GUI para el botón
local guiButton = Instance.new("ScreenGui")
guiButton.Name = "ClickableButtonGui"
guiButton.Parent = game.CoreGui

local frameButton = Instance.new("Frame")
frameButton.Name = "ButtonFrame"
frameButton.Size = UDim2.new(0.100061566, 0, 0.100026964, 0)
frameButton.Position = UDim2.new(0.0116822431 + 0.77, 0, 0.0248226952, 0)
frameButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frameButton.BackgroundTransparency = 0.5
frameButton.ClipsDescendants = true
frameButton.Parent = guiButton

local cornerButton = Instance.new("UICorner")
cornerButton.CornerRadius = UDim.new(1, 0)
cornerButton.Parent = frameButton

local textButton = Instance.new("TextButton")
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
textButton.Parent = frameButton

-- Configuración del botón
local buttonActive = false
local taskHandle
local extraAmount = 5e9

local function getPlayerStrength()
    local folderData = ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
    return folderData:WaitForChild("Strength").Value
end

local function getNextRebirthPrice(currentRebirths)
    local basePrice = 3e6
    local additionalPrice = 2e6
    return (currentRebirths + 1) * basePrice + additionalPrice
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

textButton.MouseButton1Click:Connect(onClick)

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
            for _, obj in pairs(character:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                    if not obj.Name:lower():find("line") then
                        print("Eliminando: " .. obj.Name .. " de tipo: " .. obj.ClassName)
                        obj:Destroy()
                    end
                elseif obj:IsA("Sound") then
                    print("Eliminando: " .. obj.Name .. " de tipo: " .. obj.ClassName)
                    obj:Destroy()
                end
            end
        end
    end)
end

local function convertToDuck(character)
    safeCall(function()
        if character and character:FindFirstChild("HumanoidRootPart") then
            -- Eliminar sombreros o accesorios
            for _, v in pairs(character:GetChildren()) do
                if v:IsA("Hat") or v:IsA("Accessory") then
                    v:Destroy()
                end
            end

            local duckMesh = Instance.new("SpecialMesh")
            duckMesh.MeshType = Enum.MeshType.FileMesh
            duckMesh.MeshId = "http://www.roblox.com/asset/?id=9419831" -- ID del mesh del pato
            duckMesh.TextureId = "http://www.roblox.com/asset/?id=9419827" -- ID de la textura del pato
            duckMesh.Scale = Vector3.new(5, 5, 5) -- Escala del pato
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

-- Mover questGui a ReplicatedStorage si cumple las condiciones
local function moveQuestGui()
    local questGui = player.PlayerGui:FindFirstChild("Main")
                    and player.PlayerGui.Main:FindFirstChild("MainFrame")
                    and player.PlayerGui.Main.MainFrame:FindFirstChild("Frames")
                    and player.PlayerGui.Main.MainFrame.Frames:FindFirstChild("Quest")
    if questGui then
        safeCall(function()
            questGui.Parent = ReplicatedStorage
        end)
    end
end

-- Actualizar y mover questGui continuamente si el jugador cumple con las condiciones
spawn(function()
    while true do
        safeCall(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and player.Character:FindFirstChild("HumanoidRootPart") then
                clearEffects(player.Character)
                convertToDuck(player.Character)
                moveQuestGui() -- Mover el questGui solo si el jugador cumple con las condiciones
            end
        end)
        wait(.01)
    end
end)

initialCheck()
