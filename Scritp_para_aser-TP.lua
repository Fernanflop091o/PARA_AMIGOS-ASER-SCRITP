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
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextSize = 18
    label.Font = Enum.Font.SourceSansBold
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = parent
    
    -- Estilo de gradiente para las letras
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)  -- Rojo fosforescente
    label.TextTransparency = 0.5
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)  -- Azul fosforescente
    
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

-- Función para actualizar la lista de transformaciones y la fuerza en un bucle infinito
local function updateTransformationsAndStrength()
    while true do
        for i, player in ipairs(Players:GetPlayers()) do
            local statsFolder = game.Workspace.Living[player.Name].Stats
            local strength = statsFolder.Strength
            local transformation = player.Status.Transformation.Value
            
            -- Actualizar los TextLabels de transformaciones y fuerza
            if transformationLabelList[i] then
                transformationLabelList[i].Text = tostring(transformation)
            end
            if strengthLabelList[i] then
                strengthLabelList[i].Text = tostring(strength.Value)
            end
        end
        wait(1) -- Actualizar cada segundo
    end
end

-- Función para limpiar el panel anterior
local function clearPanel()
    local existingPanel = game.CoreGui:FindFirstChild("PlayerListPanel")
    if existingPanel then
        existingPanel:Destroy()
    end
end

-- Función para crear el panel
local function createPanel()
    -- Limpiar el panel anterior antes de crear uno nuevo
    clearPanel()
    
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

    -- Función para minimizar/restaurar el panel
    local function togglePanelSize()
        if frame.Size == UDim2.new(0.5, 0, 0.6, 0) then
            frame:TweenSizeAndPosition(UDim2.new(0.5, 0, 0.1, 0), UDim2.new(0.25, 0, 0.45, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
            scrollingFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
            minimizeButton.Text = "+"
        else
            frame:TweenSizeAndPosition(UDim2.new(0.5, 0, 0.6, 0), UDim2.new(0.25, 0, 0.2, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
            scrollingFrame:TweenSize(UDim2.new(1, 0, 0.9, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
            minimizeButton.Text = "-"
        end
    end

    -- Crear botón de minimizar
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0.05, 0, 0.05, 0)
    minimizeButton.Position = UDim2.new(0.95, 0, 0, 0)
    minimizeButton.Text = "-"
    minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Color rojo
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.Font = Enum.Font.SourceSansBold
    minimizeButton.TextSize = 18
    minimizeButton.Parent = frame

    -- Conectar la función de toggle al botón de minimizar
    minimizeButton.MouseButton1Click:Connect(togglePanelSize)

    -- Actualizar la lista de jugadores cuando se crea el panel
    local playerCount = updatePlayerList(scrollingFrame)
    playerCountLabel.Text = "Jugadores En Partida: " .. playerCount

    -- Lanzar la función para actualizar la lista de transformaciones y fuerza
    spawn(updateTransformationsAndStrength)
end

-- Llamar a la función para crear el panel al inicio
createPanel()
