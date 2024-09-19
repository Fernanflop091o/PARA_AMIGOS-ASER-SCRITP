loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/CONNOMETRO.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/refs/heads/main/Anti%20Lag.lua"))()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local taskHandle = nil
local extraAmount = 5e9
local buttonActive = false

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
textButton.Text = "Rebirth (OFF)"

-- Función para obtener la fuerza del jugador
local function getPlayerStrength()
    local success, result = pcall(function()
        local folderData = ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
        return folderData:WaitForChild("Strength").Value
    end)
    if not success then
        warn("Error obteniendo fuerza del jugador: " .. tostring(result))
        return 0
    end
    return result
end

-- Función para obtener el precio del próximo Rebirth
local function getNextRebirthPrice(currentRebirths)
    return (currentRebirths + 1) * 3e6 + 2e6
end

-- Función para iniciar el bucle de Rebirth
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
                wait(1) -- Espera para reducir la carga
            end)
        else
            textButton.Text = "Stats (OFF)"
            stopLoop()
        end
    end)
    if not success then
        warn("Error en startLoop: " .. tostring(result))
    end
end

-- Función para detener el bucle
local function stopLoop()
    if taskHandle then
        taskHandle:Disconnect()
        taskHandle = nil
    end
end

-- Función para cuando se hace clic en el botón
local function onClick()
    buttonActive = not buttonActive
    if buttonActive then
        startLoop()
    else
        stopLoop()
    end
    textButton.Text = buttonActive and "Rebirth (ON)" or "Stats (OFF)"
end

-- Función para transformar al personaje en un pato
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

-- Función para manejar la transformación en pato tras 9 segundos
local function onCharacterAdded(character)
    wait(9) -- Espera 9 segundos antes de la transformación
    convertToDuck(character)
end

if player.Character then
    onCharacterAdded(player.Character)
end

player.CharacterAdded:Connect(onCharacterAdded)

-- Conectar el clic del botón
textButton.MouseButton1Click:Connect(onClick)
