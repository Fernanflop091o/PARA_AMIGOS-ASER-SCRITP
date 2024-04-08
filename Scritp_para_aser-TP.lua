local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Variables para almacenar los TextLabels de la lista de jugadores
local nameLabelList = {}
local rebirthLabelList = {}
local strengthLabelList = {}
local transformationLabelList = {}

-- Función para crear un TextLabel en el ScrollingFrame
local function createTextLabel(parent, text, size, positionX, positionY)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(size, 0, 0.05, 0)
    label.Position = UDim2.new(positionX, 0, positionY, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 18
    label.Font = Enum.Font.SourceSansBold
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = parent
    return label
end

-- Función para actualizar la lista de jugadores
local function updatePlayerList(frame)
    local playerList = Players:GetPlayers()
    local yPos = 0
    local playerCount = #playerList
    for i, player in ipairs(playerList) do
        local statsFolder = game.Workspace.Living[player.Name].Stats
        local strength = statsFolder.Strength
        local rebirth = statsFolder.Rebirth
        local transformation = player.Status.Transformation.Value
        
        -- Crear TextLabels para mostrar la información del jugador si aún no existen
        if not nameLabelList[i] then
            nameLabelList[i] = createTextLabel(frame, player.Name, 0.3, 0, yPos + 0.1)
            rebirthLabelList[i] = createTextLabel(frame, tostring(rebirth.Value), 0.15, 0.33, yPos + 0.1)
            strengthLabelList[i] = createTextLabel(frame, tostring(strength.Value), 0.15, 0.5, yPos + 0.1)
            transformationLabelList[i] = createTextLabel(frame, tostring(transformation), 0.2, 0.65, yPos + 0.1)
        else
            -- Si los TextLabels ya existen, simplemente actualizar su texto
            nameLabelList[i].Text = player.Name
            rebirthLabelList[i].Text = tostring(rebirth.Value)
            strengthLabelList[i].Text = tostring(strength.Value)
            transformationLabelList[i].Text = tostring(transformation)
        end
        
        yPos = yPos + 0.05
    end
    
    return playerCount
end

-- Crear una función para destruir el panel anterior y crear uno nuevo
local function createPanel()
    local existingPanel = game.CoreGui:FindFirstChild("PlayerListPanel")
    if existingPanel then
        existingPanel:Destroy()
    end

    local panel = Instance.new("ScreenGui")
    panel.Name = "PlayerListPanel"
    panel.Parent = game.CoreGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.6, 0)
    frame.Position = UDim2.new(0.25, 0, 0.2, 0)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
    frame.Parent = panel
    frame.Active = true -- Hacer el frame interactivo para poder arrastrarlo
    frame.Draggable = true -- Hacer el frame arrastrable

    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Size = UDim2.new(1, 0, 0.9, 0)
    scrollingFrame.Position = UDim2.new(0, 0, 0.05, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollingFrame.ScrollBarThickness = 8
    scrollingFrame.Parent = frame

    local title = createTextLabel(frame, "Player List", 0.5, 0.25, 0)
    title.TextSize = 24

    local nameLabel = createTextLabel(frame, "Nombre", 0.3, 0, 0.05)
    nameLabel.TextSize = 18

    local rebirthLabel = createTextLabel(frame, "Rebirth", 0.15, 0.33, 0.05)
    rebirthLabel.TextSize = 18

    local strengthLabel = createTextLabel(frame, "Fuerza", 0.15, 0.5, 0.05)
    strengthLabel.TextSize = 18

    local transformationLabel = createTextLabel(frame, "Transformación", 0.2, 0.65, 0.05)
    transformationLabel.TextSize = 18

    local playerCountLabel = createTextLabel(frame, "", 0.5, 0.25, 0.95)
    playerCountLabel.TextSize = 16

    -- Función para actualizar la tabla cada 3 segundos
    local function updateTable()
        while true do
            local playerCount = updatePlayerList(scrollingFrame)
            playerCountLabel.Text = "Jugadores En Partida: " .. playerCount
            wait(3)  -- Actualizar cada 3 segundos
        end
    end

    -- Lanzar la función para actualizar la tabla
    spawn(updateTable)
end

-- Llamar a la función para crear el panel al inicio
createPanel()
