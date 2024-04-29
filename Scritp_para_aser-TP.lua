local TweenService = game:GetService("TweenService")

local UserInputService = game:GetService("UserInputService")



local CoreGui = game:GetService("StarterGui")



CoreGui:SetCore("SendNotification", {

    Title = "Script hecho por",

    Text = "Aedus (Suscríbete a su canal en yt)",

    Duration = 2.5,

})



local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Parent = game.CoreGui



local MainFrame = Instance.new("Frame")

MainFrame.Parent = ScreenGui

MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)

MainFrame.BackgroundTransparency = 0.5

MainFrame.Position = UDim2.new(0.65, 0, 1.5, -43) -- Ajustado el posicionamiento para que esté centrado en la pantalla y más bajo

MainFrame.Size = UDim2.new(0.4, 0, 1.1, 0) -- Ancho aumentado hacia la derecha, altura mantenida igual

MainFrame.ClipsDescendants = true



local TextBox = Instance.new("TextBox")

TextBox.Parent = MainFrame

TextBox.BackgroundColor3 = Color3.new(1, 1, 1)

TextBox.Position = UDim2.new(0.05, 0, 0.05, 0) -- Ajustado la posición del TextBox

TextBox.Size = UDim2.new(0.9, 0, 0.1, 0)

TextBox.Font = Enum.Font.SourceSans

TextBox.TextSize = 18

TextBox.PlaceholderText = "Escribe el nombre del jugador..."

TextBox.ClearTextOnFocus = true



local ScrollFrame = Instance.new("ScrollingFrame")

ScrollFrame.Parent = MainFrame

ScrollFrame.BackgroundColor3 = Color3.new(1, 1, 1)

ScrollFrame.Position = UDim2.new(0.05, 0, 0.2, 0) -- Ajustado la posición del ScrollFrame

ScrollFrame.Size = UDim2.new(0.9, 0, 0.65, 0)

ScrollFrame.ScrollBarThickness = 10



local PlayerCountLabel = Instance.new("TextLabel")

PlayerCountLabel.Parent = MainFrame

PlayerCountLabel.BackgroundTransparency = 1

PlayerCountLabel.Position = UDim2.new(0.05, 0, 0.875, 0) -- Ajustado la posición de PlayerCountLabel

PlayerCountLabel.Size = UDim2.new(0.9, 0, 0.05, 0)

PlayerCountLabel.Font = Enum.Font.SourceSans

PlayerCountLabel.TextSize = 18

PlayerCountLabel.TextColor3 = Color3.new(1, 1, 1)



local ToggleButton = Instance.new("TextButton") -- Botón para mostrar/ocultar el panel

ToggleButton.Parent = ScreenGui

ToggleButton.BackgroundColor3 = Color3.new(0, 0, 0)

ToggleButton.BackgroundTransparency = 0.5

ToggleButton.Position = UDim2.new(0.65, 0, 0.1, -66)

ToggleButton.Size = UDim2.new(0.4, 0, 0.03, 0) -- Ajustado el tamaño del botón

ToggleButton.Font = Enum.Font.SourceSans

ToggleButton.Text = "Mostrar/Ocultar Panel"

ToggleButton.TextColor3 = Color3.new(1, 1, 1)

ToggleButton.TextSize = 18



local panelHidden = true  -- Variable para rastrear si el panel está oculto o no



-- Variable para rastrear el estado de cada botón

local buttonStates = {}



-- Función para animar el panel hacia arriba

local function SlidePanelUp()

    if panelHidden then

        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

        local tweenProperties = {

            Position = UDim2.new(0.65, 0, 1.5, -43)  -- Mover el panel hacia abajo

        }

        local tween = TweenService:Create(MainFrame, tweenInfo, tweenProperties)

        tween:Play()



        panelHidden = false

    end

end



-- Función para animar el panel hacia abajo

local function SlidePanelDown()

    if not panelHidden then

        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

        local tweenProperties = {

            Position = UDim2.new(0.65, 0, 0.1, -66)  -- Mover el panel hacia arriba

        }

        local tween = TweenService:Create(MainFrame, tweenInfo, tweenProperties)

        tween:Play()



        panelHidden = true

    end

end







-- Conectar eventos al botón de alternancia

ToggleButton.MouseButton1Click:Connect(function()

    if panelHidden then

        SlidePanelUp()

    else

        SlidePanelDown()

    end

end)



-- Diccionario para almacenar el estado de cada jugador
local buttonStates = {}

-- Diccionario para rastrear el estado del bucle de acciones de combate
local combatLoopActive = {}

-- Función para teletransportar al jugador
local function TeleportPlayer(playerName)
    local player = game:GetService('Players')[playerName]
    local targetPosition = player.Character.HumanoidRootPart.Position
    local teleportDistance = 1 -- Distancia de teletransporte

    game:GetService('Players').LocalPlayer.Character:MoveTo(targetPosition - Vector3.new(2, 0, teleportDistance))
end

-- Función para acciones de combate
local function performMeleeActions()
    local player = game:GetService("Players").LocalPlayer
    local userId = player.UserId
    local Forms = {'Mach Kick', 'Wolf Fang Fist', 'Meteor Strike', 'Meteor Crash', 'Spirit Breaking Cannon', 'God Slicer'}
    if (game.ReplicatedStorage.Datas[userId].Strength.Value > 1000000) then
        for _, melee in ipairs(Forms) do
            game.ReplicatedStorage.Package.Events.mel:InvokeServer(melee, "Blacknwhite27")
            wait()
        end
    end
end

-- Crear un bucle que se ejecuta si el estado del bucle de combate está activo
local combatLoop = coroutine.create(function()
    while true do
        if combatLoopActive["combat"] then
            performMeleeActions()
        end
        wait()
    end
end)

coroutine.resume(combatLoop) -- Iniciar el bucle de combate

-- Función para crear un botón para el jugador
local function CreatePlayerButton(player, index)
    local PlayerButton = Instance.new("TextButton")
    PlayerButton.Text = player.Name
    PlayerButton.Parent = ScrollFrame
    PlayerButton.BackgroundColor3 = Color3.new(0, 0, 0)
    PlayerButton.TextColor3 = Color3.new(1, 1, 1)
    PlayerButton.Size = UDim2.new(0.9, 0, 0, 30)
    PlayerButton.Font = Enum.Font.SourceSans
    PlayerButton.TextSize = 18
    PlayerButton.BorderSizePixel = 0
    PlayerButton.AutoButtonColor = false
    PlayerButton.Position = UDim2.new(0, 0, 0, 30 * (index - 1))

    -- Iniciar el estado del botón como pausado
    buttonStates[player.Name] = "paused"
    combatLoopActive["combat"] = false

    PlayerButton.MouseButton1Click:Connect(function()
        if buttonStates[player.Name] == "paused" then
            -- Activar el bucle de teletransporte y acciones de combate
            buttonStates[player.Name] = "teleporting"
            combatLoopActive["combat"] = true
            while buttonStates[player.Name] == "teleporting" do
                TeleportPlayer(player.Name)
                wait(0.001)
            end
        else
            -- Pausar el bucle de teletransporte y acciones de combate
            buttonStates[player.Name] = "paused"
            combatLoopActive["combat"] = false
        end
    end)
end



local function UpdatePlayerList(searchQuery)

    ScrollFrame:ClearAllChildren()

    local playerList = game:GetService("Players"):GetPlayers()

    local filteredPlayers = {}



    -- Filtrar jugadores según la búsqueda

    for _, player in ipairs(playerList) do

        if string.find(player.Name:lower(), searchQuery:lower()) then

            table.insert(filteredPlayers, player)

        elseif player.DisplayName and string.find(player.DisplayName:lower(), searchQuery:lower()) then

            table.insert(filteredPlayers, player) -- Permitir la búsqueda por apodos

        end

    end



    -- Mostrar jugadores filtrados en la lista

    for index, player in ipairs(filteredPlayers) do

        CreatePlayerButton(player, index) -- Pasar el jugador en lugar del nombre

        local Divider = Instance.new("Frame")

        Divider.Parent = ScrollFrame

        Divider.BackgroundColor3 = Color3.new(1, 1, 1)

        Divider.Size = UDim2.new(0.9, 0, 0, 1)

        Divider.Position = UDim2.new(0, 0, 0, 30 * index)

    end



    -- Calcular el número total de jugadores en la partida

    local totalPlayers = #game:GetService("Players"):GetPlayers()

    local playersInGame = #filteredPlayers

    local playersNotInGame = totalPlayers - playersInGame



    -- Mostrar la cantidad de jugadores en la partida

    PlayerCountLabel.Text = "Jugadores en la partida: " .. playersInGame .. "/" .. totalPlayers



    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, #filteredPlayers * 30) -- Ajustar la altura del lienzo para permitir desplazamiento

end





game.Players.PlayerAdded:Connect(function()

    UpdatePlayerList(TextBox.Text)

end)

game.Players.PlayerRemoving:Connect(function()

    UpdatePlayerList(TextBox.Text)

end)



TextBox:GetPropertyChangedSignal("Text"):Connect(function()

    UpdatePlayerList(TextBox.Text)

end)



UpdatePlayerList("")
