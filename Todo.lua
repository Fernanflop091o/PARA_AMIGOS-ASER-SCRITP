loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/CONNOMETRO.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/refs/heads/main/Anti%20Lag.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local taskHandle = nil
local buttonActive = false
local fileName = "buttonState.json"

-- GUI del botón
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

-- Guardar el estado en un archivo JSON
local function saveState()
    local data = {
        buttonActive = buttonActive
    }
    writefile(fileName, HttpService:JSONEncode(data))
end

-- Cargar el estado desde un archivo JSON
local function loadState()
    if isfile(fileName) then
        local data = HttpService:JSONDecode(readfile(fileName))
        buttonActive = data.buttonActive
        textButton.Text = buttonActive and "Rebirth (ON)" or "Rebirth (OFF)"
    end
end

-- Transformación en pato
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
    duckMesh.MeshId = "http://www.roblox.com/asset/?id=9419831" -- Mesh del pato
    duckMesh.TextureId = "http://www.roblox.com/asset/?id=9419827" -- Textura del pato
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

-- Ejecutar la transformación en pato después de 9 segundos
local function startTransformationTimer()
    task.wait()
    convertToDuck(player.Character)
end

-- Iniciar/Reiniciar el ciclo de rebirth
local function startLoop()
    if taskHandle then return end
    taskHandle = RunService.Heartbeat:Connect(function()
        pcall(function()
            ReplicatedStorage:WaitForChild("Package"):WaitForChild("Events"):WaitForChild("reb"):InvokeServer()
        end)
        wait(1) -- Reducir la carga
    end)
    startTransformationTimer() -- Iniciar el temporizador de 9 segundos para transformarse en pato
end

-- Detener el ciclo de rebirth
local function stopLoop()
    if taskHandle then
        taskHandle:Disconnect()
        taskHandle = nil
    end
end

-- Manejo del clic en el botón
local function onClick()
    buttonActive = not buttonActive
    if buttonActive then
        startLoop()
    else
        stopLoop()
    end
    textButton.Text = buttonActive and "Rebirth (ON)" or "Rebirth (OFF)"
    saveState() -- Guardar el estado en el archivo JSON
end

-- Conectar el botón con la función de clic
textButton.MouseButton1Click:Connect(onClick)

-- Cargar el estado inicial
loadState()
if buttonActive then
    startLoop()
else
    stopLoop()
end

-- Hacer el botón siempre clickeable
textButton.TextButton.MouseButton1Click:Connect(onClick)
