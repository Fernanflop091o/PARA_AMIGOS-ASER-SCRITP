local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "Script hecho por",
    Text = "Por PvtinxD",
    Duration = 2.5,
})

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0.5
MainFrame.Position = UDim2.new(0.65, 0, 1.5, -43)
MainFrame.Size = UDim2.new(0.4, 0, 1.1, 0)
MainFrame.ClipsDescendants = true

local TextBox = Instance.new("TextBox")
TextBox.Parent = MainFrame
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.Position = UDim2.new(0.05, 0, 0.05, 0)
TextBox.Size = UDim2.new(0.9, 0, 0.1, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 18
TextBox.PlaceholderText = "Escribe el nombre del jugador..."
TextBox.ClearTextOnFocus = true

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
ScrollFrame.Size = UDim2.new(0.9, 0, 0.65, 0)
ScrollFrame.ScrollBarThickness = 10
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
ScrollFrame.ScrollBarImageTransparency = 0
ScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y  -- Solo permite el desplazamiento vertical

local PlayerCountLabel = Instance.new("TextLabel")
PlayerCountLabel.Parent = MainFrame
PlayerCountLabel.BackgroundTransparency = 1
PlayerCountLabel.Position = UDim2.new(0.05, 0, 0.875, 0)
PlayerCountLabel.Size = UDim2.new(0.9, 0, 0.05, 0)
PlayerCountLabel.Font = Enum.Font.SourceSans
PlayerCountLabel.TextSize = 18
PlayerCountLabel.TextColor3 = Color3.new(1, 1, 1)

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
ToggleButton.BackgroundTransparency = 0.5
ToggleButton.Position = UDim2.new(0.65, 0, 0.1, -66)
ToggleButton.Size = UDim2.new(0.4, 0, 0.03, 0)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Text = "Mostrar/Ocultar Panel"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.TextSize = 18

local panelHidden = true

local buttonStates = {}
local currentPlayer = nil

local function SlidePanelUp()
    if panelHidden then
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tweenProperties = {
            Position = UDim2.new(0.65, 0, 0.1, -66)
        }
        local tween = TweenService:Create(MainFrame, tweenInfo, tweenProperties)
        tween:Play()
        panelHidden = false
    end
end

local function SlidePanelDown()
    if not panelHidden then
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tweenProperties = {
            Position = UDim2.new(0.65, 0, 1.5, -43)
        }
        local tween = TweenService:Create(MainFrame, tweenInfo, tweenProperties)
        tween:Play()
        panelHidden = true
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    if panelHidden then
        SlidePanelUp()
    else
        SlidePanelDown()
    end
end)

local function TeleportPlayer(playerName)
    local player = game:GetService('Players')[playerName]
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = player.Character.HumanoidRootPart.Position
        local targetDirection = player.Character.HumanoidRootPart.CFrame.LookVector

        local offset = -targetDirection * 2
        local teleportPosition = targetPosition + offset

        game:GetService('Players').LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition, targetPosition))
    end
end

local function invokeEnergyVolley()
    game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")
end

local function invokeMelFunctions()
    local melAttacks = {
        "High Power Rush",
        "Mach Kick",
        "Wolf Fang Fist",
        "Super Dragon Fist",
        "Spirit Barrage",
        "God Slicer",
        "Flash Kick",
        "Spirit Breaking Cannon",
        "Meteor Strike",
        "Vanish Strike",
        "Bone Charge",
        "Uppercut",
        "Sledgehammer",
        "Vital Strike"
    }

    for _, attack in ipairs(melAttacks) do
        game.ReplicatedStorage.Package.Events.mel:InvokeServer(attack, "Blacknwhite27")
    end
end

local function CreatePlayerButton(player, index)
    local PlayerButton = Instance.new("TextButton")
    
    local icons = {
        [1] = "ðŸ˜Ž",  -- Primer puesto
        [2] = "2",  -- Segundo puesto
        [3] = "2",  -- Tercer puesto
    }
    
    local rankText = icons[index] or tostring(index)  -- Usar ÃƒÂ­conos o nÃƒÂºmero de puesto

    PlayerButton.Text = rankText .. " " .. player.Name
    PlayerButton.Parent = ScrollFrame
    PlayerButton.BackgroundColor3 = Color3.new(0, 0, 0)
    PlayerButton.TextColor3 = Color3.new(1, 1, 1)
    PlayerButton.Size = UDim2.new(0.9, 0, 0, 30)
    PlayerButton.Font = Enum.Font.SourceSans
    PlayerButton.TextSize = 18
    PlayerButton.BorderSizePixel = 0
    PlayerButton.AutoButtonColor = false
    PlayerButton.Position = UDim2.new(0, 0, 0, 30 * (index - 1))

    if not buttonStates[player.Name] then
        buttonStates[player.Name] = "paused"
    end

    PlayerButton.MouseButton1Click:Connect(function()
        if currentPlayer and currentPlayer ~= player.Name then
            buttonStates[currentPlayer] = "paused"
        end

        currentPlayer = player.Name

        if buttonStates[player.Name] == "paused" then
            buttonStates[player.Name] = "teleporting"
            local isLoop4Active = true

            task.spawn(function()
                while buttonStates[player.Name] == "teleporting" do
                    TeleportPlayer(player.Name)
                    if isLoop4Active then
                        pcall(function()
                            task.spawn(invokeEnergyVolley)
                            task.spawn(invokeMelFunctions)
                            task.spawn(function()
                                game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
                            end)
                        end)
                    end

                    task.wait()
                end
            end)
        else
            buttonStates[player.Name] = "paused"
        end
    end)
end

local function GetPlayerStrength(player)
    local userId = player.UserId
    local playerData = game.ReplicatedStorage.Datas[userId]
    return playerData and playerData.Strength and playerData.Strength.Value or 0
end

local function UpdatePlayerList(searchQuery)
    ScrollFrame:ClearAllChildren()
    local playerList = game:GetService("Players"):GetPlayers()
    local filteredPlayers = {}

    for _, player in ipairs(playerList) do
        if string.find(player.Name:lower(), searchQuery:lower()) then
            table.insert(filteredPlayers, player)
        elseif player.DisplayName and string.find(player.DisplayName:lower(), searchQuery:lower()) then
            table.insert(filteredPlayers, player)
        end
    end

    table.sort(filteredPlayers, function(a, b)
        return GetPlayerStrength(a) > GetPlayerStrength(b)
    end)

    for index, player in ipairs(filteredPlayers) do
        CreatePlayerButton(player, index)
        local Divider = Instance.new("Frame")
        Divider.Parent = ScrollFrame
        Divider.BackgroundColor3 = Color3.new(1, 1, 1)
        Divider.Size = UDim2.new(0.9, 0, 0, 1)
        Divider.Position = UDim2.new(0, 0, 0, 30 * index)
    end

    local totalPlayers = #game:GetService("Players"):GetPlayers()
    local playersInGame = #filteredPlayers

    PlayerCountLabel.Text = "Jugadores en la partida: " .. playersInGame .. "/" .. totalPlayers

    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, #filteredPlayers * 30)
    ScrollFrame.Visible = true
end

local function HandlePlayerChange()
    local currentStates = {}
    for playerName, state in pairs(buttonStates) do
        currentStates[playerName] = state
    end

    UpdatePlayerList(TextBox.Text)

    for playerName, state in pairs(currentStates) do
        if buttonStates[playerName] then
            buttonStates[playerName] = state
        end
    end
end

game.Players.PlayerAdded:Connect(HandlePlayerChange)
game.Players.PlayerRemoving:Connect(HandlePlayerChange)

TextBox:GetPropertyChangedSignal("Text"):Connect(HandlePlayerChange)

UpdatePlayerList("")

TextBox.FocusLost:Connect(function()
    if TextBox.Text == "" then
        UpdatePlayerList("")
    end
end)
    else
        local screenGuiName = "ScreenGui"
local scriptToDestroy = game.CoreGui:FindFirstChild(screenGuiName)

if scriptToDestroy then
    scriptToDestroy:Destroy()
    print("Script destruido exitosamente.")
else
    print("El ScreenGui a destruir no fue encontrado.")
end
    end
end

local function onFarmButtonClick()
    clickCount = clickCount + 1
    if clickCount % 2 == 1 then
        local function format_number(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end

    -- Redondear el nÃƒÂºmero a dos decimales si no es entero
    local formatted_number = string.format("%.2f", number)

    -- Convertir a formato entero si no tiene decimales
    if math.floor(number) == number then
        formatted_number = string.format("%d", number)
    end

    return formatted_number .. suffixes[suffix_index]
end

local function initMenu()
local player = game.Players.LocalPlayer

   local gui = Instance.new("ScreenGui")
    gui.Name = "PlayerListGui"
    gui.ResetOnSpawn = false  -- No reiniciar al reaparecer el jugador
    gui.Parent = player.PlayerGui

    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(0.4, 0, 0.6, 0)
    background.Position = UDim2.new(0, 0, 0.2, 0)
    background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    background.BorderSizePixel = 0
    background.Parent = gui

    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 8)
    bgCorner.Parent = background

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0.1, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BorderSizePixel = 0
    title.Text = "Lista de Jugadores"
    title.Font = Enum.Font.SourceSansBold
    title.TextColor3 = Color3.fromRGB(0, 0, 0)
    title.TextSize = 15
    title.Parent = background


    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = title

    local playerListContainer = Instance.new("ScrollingFrame")
    playerListContainer.Name = "PlayerListContainer"
    playerListContainer.Size = UDim2.new(1, -20, 0.9, -40)
    playerListContainer.Position = UDim2.new(0, 10, 0.1, 20)
    playerListContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    playerListContainer.BorderSizePixel = 0
    playerListContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    playerListContainer.ScrollBarThickness = 10
    playerListContainer.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    playerListContainer.Parent = background

    -- Agregar UICorner al contenedor de la lista de jugadores
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 8)
    containerCorner.Parent = playerListContainer

    local function createLabel(parent, text, position, size)
        local frame = Instance.new("Frame")
        frame.Size = size
        frame.Position = position
        frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        frame.BorderSizePixel = 0
        frame.Parent = parent

        -- Agregar UICorner a cada frame
        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 8)
        frameCorner.Parent = frame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 1, -10)
        label.Position = UDim2.new(0, 5, 0, 5)
        label.BackgroundTransparency = 1
        label.Text = text
        label.Font = Enum.Font.SourceSans
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 18
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextWrapped = true
        label.Parent = frame

        -- Ajuste de tamaÃƒÂ±o automÃƒÂ¡tico
        local textSizeConstraint = Instance.new("UITextSizeConstraint")
        textSizeConstraint.MaxTextSize = 18
        textSizeConstraint.Parent = label

        return frame
    end

    local function updatePlayerList()
        local players = game.Players:GetPlayers()
        table.sort(players, function(a, b)
            local forceA = game.ReplicatedStorage.Datas[a.UserId].Strength.Value
            local forceB = game.ReplicatedStorage.Datas[b.UserId].Strength.Value
            return forceA > forceB
        end)

        for _, child in ipairs(playerListContainer:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end

        local yPos = 5

        for i, player in ipairs(players) do
            local playerName = player.DisplayName .. "\n(" .. player.Name .. ")"
            local rebirthValue = game.ReplicatedStorage.Datas[player.UserId].Rebirth.Value
            local forceValue = game.ReplicatedStorage.Datas[player.UserId].Strength.Value
            local formattedForce = format_number(forceValue)

            local playerFrame = Instance.new("Frame")
            playerFrame.Name = "PlayerFrame"
            playerFrame.Size = UDim2.new(1, -10, 0, 60)
            playerFrame.Position = UDim2.new(0, 5, 0, yPos)
            playerFrame.BackgroundTransparency = 1
            playerFrame.Parent = playerListContainer

            createLabel(playerFrame, playerName, UDim2.new(0, 0, 0, 0), UDim2.new(0.4, -10, 1, 0))
            createLabel(playerFrame, tostring(rebirthValue), UDim2.new(0.455, 5, 0, 0), UDim2.new(0.2, -10, 1, 0))
            createLabel(playerFrame, formattedForce, UDim2.new(0.7, 9, 0, 0), UDim2.new(0.237, -10, 1, 0))

            yPos = yPos + playerFrame.Size.Y.Offset + 5
        end

        playerListContainer.CanvasSize = UDim2.new(0, 0, 0, yPos - 5)
    end

    updatePlayerList()

    game.Players.PlayerAdded:Connect(updatePlayerList)
    game.Players.PlayerRemoving:Connect(updatePlayerList)

    game.ReplicatedStorage.Datas.ChildAdded:Connect(updatePlayerList)
    game.ReplicatedStorage.Datas.ChildRemoved:Connect(updatePlayerList)

    for _, player in ipairs(game.Players:GetPlayers()) do
        local data = game.ReplicatedStorage.Datas:FindFirstChild(player.UserId)
        if data then
            data.Strength:GetPropertyChangedSignal("Value"):Connect(updatePlayerList)
            data.Rebirth:GetPropertyChangedSignal("Value"):Connect(updatePlayerList)
            data.Zeni:GetPropertyChangedSignal("Value"):Connect(updatePlayerList) -- Escuchar cambios en Zeni
        end
    end

    while true do
        wait(5)
        updatePlayerList()
    end
end

initMenu()
