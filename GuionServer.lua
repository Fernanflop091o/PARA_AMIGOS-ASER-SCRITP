
local TeleportService = game:GetService("TeleportService")

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


local menuGui = Instance.new("ScreenGui")
menuGui.Name = "ServerList"
menuGui.Parent = game.CoreGui


local serverListFrame = Instance.new("Frame")
serverListFrame.Name = "ServerListFrame"
serverListFrame.Size = UDim2.new(0.7, 0, 0.9, 0) -- Ajustar el tamaño del menú
serverListFrame.Position = UDim2.new(0.15, 0, 0.05, 0) -- Centrar el menú en la pantalla
serverListFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
serverListFrame.BorderSizePixel = 0
serverListFrame.Parent = menuGui


local initialTouchPos = nil
local initialFramePos = nil


local dragAreaSize = UDim2.new(1, 0, 0.05, 0) 


local function onInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local absolutePos = input.Position
        local menuAbsolutePos = serverListFrame.AbsolutePosition
        local menuSize = serverListFrame.AbsoluteSize
        
        
        if absolutePos.X >= menuAbsolutePos.X and absolutePos.X <= menuAbsolutePos.X + menuSize.X and
           absolutePos.Y >= menuAbsolutePos.Y and absolutePos.Y <= menuAbsolutePos.Y + menuSize.Y * dragAreaSize.Y.Scale then
            initialTouchPos = absolutePos
            initialFramePos = serverListFrame.Position
            serverListFrame.Draggable = true 
        end
    end
end


local function onInputEnded(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        initialTouchPos = nil
        initialFramePos = nil
        serverListFrame.Draggable = false 
    end
end


local function onInputChanged(input)
    if initialTouchPos then
        local currentTouchPos = input.Position
        local offset = currentTouchPos - initialTouchPos
        local newX = initialFramePos.X.Offset + offset.X
        local newY = initialFramePos.Y.Offset + offset.Y
        
        serverListFrame.Position = UDim2.new(0, newX, 0, newY)
    end
end


game:GetService("UserInputService").InputBegan:Connect(onInputBegan)
game:GetService("UserInputService").InputChanged:Connect(onInputChanged)
game:GetService("UserInputService").InputEnded:Connect(onInputEnded)



local scrollableAreaFrame = Instance.new("Frame")
scrollableAreaFrame.Name = "ScrollableAreaFrame"
scrollableAreaFrame.Size = UDim2.new(1, -4, 1, -154) -- Ajustar el tamaño para estar dentro de las líneas
scrollableAreaFrame.Position = UDim2.new(0, 2, 0, 74) -- Ajustar la posición para comenzar desde la tercera línea azul hacia abajo
scrollableAreaFrame.BackgroundTransparency = 1
scrollableAreaFrame.Parent = serverListFrame


local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1.2, 0) -- El tamaño del ScrollFrame coincide con el del Frame principal
scrollFrame.Position = UDim2.new(0, 0, 0, 0) -- El ScrollFrame comienza desde la tercera línea azul hacia abajo
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 3000) 
scrollFrame.BackgroundTransparency = 1 
scrollFrame.ScrollBarThickness = 2
scrollFrame.Parent = scrollableAreaFrame


local topLine = Instance.new("Frame")
topLine.Name = "TopLine"
topLine.Size = UDim2.new(1, 0, 0, 2) -- Tamaño de la línea
topLine.Position = UDim2.new(0, 0, 0, -2) -- Posición de la línea arriba del menú
topLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Color azul
topLine.BorderSizePixel = 0
topLine.Parent = serverListFrame


local bottomLine = Instance.new("Frame")
bottomLine.Name = "BottomLine"
bottomLine.Size = UDim2.new(1, 0, 0, 4) -- Tamaño de la línea
bottomLine.Position = UDim2.new(0, 0, 1, 0) -- Posición de la línea abajo del menú
bottomLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Color azul
bottomLine.BorderSizePixel = 0
bottomLine.Parent = serverListFrame

local bottomLine = Instance.new("Frame")
bottomLine.Name = "BottomLine"
bottomLine.Size = UDim2.new(1, 0, 0, 4) -- Tamaño de la línea
bottomLine.Position = UDim2.new(0, 0, 0, 70) -- Posición de la línea abajo del menú
bottomLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Color azul
bottomLine.BorderSizePixel = 0
bottomLine.Parent = serverListFrame

local bottomLine = Instance.new("Frame")
bottomLine.Name = "BottomLine"
bottomLine.Size = UDim2.new(1, 0, 0, 4) -- Tamaño de la línea
bottomLine.Position = UDim2.new(0, 0, 1, -44) -- Posición de la línea abajo del menú
bottomLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Color azul
bottomLine.BorderSizePixel = 0
bottomLine.Parent = serverListFrame

-- Crear una línea azul en el lado derecho del menú
local leftLine = Instance.new("Frame")
leftLine.Name = "LeftLine"
leftLine.Size = UDim2.new(0, 2, 1, 0) -- Tamaño de la línea
leftLine.Position = UDim2.new(0, 0, 0, 0) -- Posición de la línea en el lado izquierdo del menú
leftLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Color azul
leftLine.BorderSizePixel = 0
leftLine.Parent = serverListFrame


local leftLine = Instance.new("Frame")
leftLine.Name = "LeftLine"
leftLine.Size = UDim2.new(0, 2, 1, 0) -- Tamaño de la línea
leftLine.Position = UDim2.new(1, -2, 0, 0) -- Posición de la línea en el lado izquierdo del menú
leftLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Color azul
leftLine.BorderSizePixel = 0
leftLine.Parent = serverListFrame

local rightLine = Instance.new("Frame")
rightLine.Name = "RightLine"
rightLine.Size = UDim2.new(0, 2, 1, -113) -- Tamaño de la línea
rightLine.Position = UDim2.new(1, -8, 0, 74) -- Posición de la línea en el lado derecho del menú
rightLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Color azul
rightLine.BorderSizePixel = 0
rightLine.Parent = serverListFrame

local rightLine = Instance.new("Frame")
rightLine.Name = "RightLine"
rightLine.Size = UDim2.new(0, 2, 1, -113) -- Tamaño de la línea
rightLine.Position = UDim2.new(1, -658, 0, 74) -- Posición de la línea en el lado derecho del menú
rightLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255) -- Color azul
rightLine.BorderSizePixel = 0
rightLine.Parent = serverListFrame

local buttonSize = UDim2.new(0.25, 0, 0, 40) -- Tamaño de los botones
local buttonColor = Color3.fromRGB(30, 30, 30) -- Color de fondo de los botones
local buttonBorderColor = Color3.fromRGB(0, 0, 255) -- Color del borde de los botones
local textColor = Color3.fromRGB(255, 255, 255) -- Color del texto


local laterButton = Instance.new("TextButton")
laterButton.Name = "LaterButton"
laterButton.Size = buttonSize
laterButton.Position = UDim2.new(0.01, 0, 0.9, 0)
laterButton.BackgroundColor3 = buttonColor
laterButton.BorderColor3 = buttonBorderColor
laterButton.TextColor3 = textColor
laterButton.Text = "Más Tarde"
laterButton.Parent = serverListFrame


local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0.29, 0, 0, 40)
closeButton.Position = UDim2.new(0.7, 0, 0.9, 0)
closeButton.BackgroundColor3 = buttonColor
closeButton.BorderColor3 = buttonBorderColor
closeButton.TextColor3 = textColor
closeButton.Text = "Cerrar"
closeButton.Parent = serverListFrame


local textBox = Instance.new("TextBox")
textBox.Name = "TextBox"
textBox.Size = UDim2.new(0.5, 0, 0, 40)
textBox.Position = UDim2.new(0.25, 0, 0.9, 0)
textBox.BackgroundColor3 = buttonColor
textBox.BorderColor3 = buttonBorderColor
textBox.TextColor3 = textColor
textBox.PlaceholderText = "Escribe aquí"
textBox.Parent = serverListFrame



local idButton = Instance.new("TextButton") -- Cambiado el nombre a "idButton"
idButton.Name = "IDButton" -- Cambiado el nombre del botón a "IDButton"
idButton.Size = UDim2.new(0.609, 0, 0, 40)
idButton.Position = UDim2.new(0.008, 0, 0, 14) -- Posición del tercer botón
idButton.BackgroundColor3 = buttonColor
idButton.BorderColor3 = buttonBorderColor
idButton.TextColor3 = textColor
idButton.Text = "ID Button" -- Cambiado el texto del botón a "ID Button"
idButton.Parent = serverListFrame


local playerButton = Instance.new("TextButton") -- Cambiado el nombre a "playerButton"
playerButton.Name = "PlayerButton" -- Cambiado el nombre del botón a "PlayerButton"
playerButton.Size = UDim2.new(0.18, 0, 0, 40)
playerButton.Position = UDim2.new(0.6, 0, 0, 14) -- Posición del botón "Jugador"
playerButton.BackgroundColor3 = buttonColor
playerButton.BorderColor3 = buttonBorderColor
playerButton.TextColor3 = textColor
playerButton.Text = "Jugador" -- Cambiado el texto del botón a "Jugador"
playerButton.Parent = serverListFrame

local pingButton = Instance.new("TextButton") -- Cambiado el nombre a "pingButton"
pingButton.Name = "PingButton" -- Cambiado el nombre del botón a "PingButton"
pingButton.Size = UDim2.new(0.22, 0, 0, 40)
pingButton.Position = UDim2.new(0.78, 0, 0, 14) -- Posición del botón "Ping"
pingButton.BackgroundColor3 = buttonColor
pingButton.BorderColor3 = buttonBorderColor
pingButton.TextColor3 = textColor
pingButton.Text = "Ping" -- Cambiado el texto del botón a "Ping"
pingButton.Parent = serverListFrame



local idLabel = Instance.new("TextLabel")
idLabel.Name = "IDLabel"
idLabel.Size = UDim2.new(0.3, 0, 0, 20)
idLabel.Position = UDim2.new(0.01, 0, 0, 54) -- Posición de la etiqueta debajo del primer botón
idLabel.BackgroundColor3 = buttonColor
idLabel.BorderColor3 = buttonBorderColor
idLabel.TextColor3 = textColor
idLabel.Text = "ID del servidores"
idLabel.TextScaled = true
idLabel.Parent = serverListFrame



local playerLabel = Instance.new("TextLabel")
playerLabel.Name = "PlayerLabel"
playerLabel.Size = UDim2.new(0.3, 0, 0, 20)
playerLabel.Position = UDim2.new(0.35, 0, 0, 54) -- Posición de la etiqueta debajo del segundo botón
playerLabel.BackgroundColor3 = buttonColor
playerLabel.BorderColor3 = buttonBorderColor
playerLabel.TextColor3 = textColor
playerLabel.Text = "Lista de jugadores"
playerLabel.TextScaled = true
playerLabel.Parent = serverListFrame


local pingLabel = Instance.new("TextLabel")
pingLabel.Name = "PingLabel"
pingLabel.Size = UDim2.new(0.3, 0, 0, 20)
pingLabel.Position = UDim2.new(0.69, 0, 0, 54) -- Posición de la etiqueta debajo del tercer botón
pingLabel.BackgroundColor3 = buttonColor
pingLabel.BorderColor3 = buttonBorderColor
pingLabel.TextColor3 = textColor
pingLabel.Text = "Ping del servidor"
pingLabel.TextScaled = true
pingLabel.Parent = serverListFrame



local function closeMenu()
    menuGui:Destroy()
end

closeButton.MouseButton1Click:Connect(closeMenu)


local function getPing()
    local startTime = tick()
    game:GetService("RunService").Stepped:wait()
    local endTime = tick()
    local pingMilliseconds = (endTime - startTime) * 1000 -- Convertir a milisegundos
    return math.min(pingMilliseconds, 1500) -- Limitar el ping máximo a 1500 milisegundos (1500 ms)
end


local function onButtonClick(serverId)
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverId) -- Teleportar al jugador al servidor correspondiente
end


local function updateServerInfo(scrollFrame, serverButtons)
    local serverList = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    
    for i, server in ipairs(serverList.data) do
        local formattedPing = server.ping or "N/A" -- Suponiendo que la API devuelve el ping o lo manejas de otra forma

        -- Actualizar el texto del botón correspondiente
        if serverButtons[i] then
            serverButtons[i].Text = "" .. server.id .. "                                                            " .. server.playing .. "                                                                   " .. formattedPing .. " ms"
        end
    end
end

local function showServerInfoInScrollingFrame()
    local serverList = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    
    local scrollFrame = serverListFrame.ScrollableAreaFrame.ScrollingFrame -- Obtener el ScrollingFrame
    local serverButtons = {} 
    local yOffset = 15
    
    
    for i, server in ipairs(serverList.data) do
        local formattedPing = server.ping or "N/A" -- Suponiendo que la API devuelve el ping o lo manejas de otra forma

        local serverInfoButton = Instance.new("TextButton") -- Cambiado a TextButton para que sea clickeable
        serverInfoButton.Size = UDim2.new(1, 0, 0, 40) 
        serverInfoButton.Position = UDim2.new(0, 0, 0, yOffset) -- Posición del botón
        serverInfoButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Color de fondo del botón
        serverInfoButton.BorderColor3 = Color3.fromRGB(0, 0, 255) -- Color del borde del botón
        serverInfoButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Color del texto del botón
        serverInfoButton.Text = "" .. server.id .. "                                                            " .. server.playing .. "                                                                   " .. formattedPing .. " ms" 
        serverInfoButton.Parent = scrollFrame 

      
        table.insert(serverButtons, serverInfoButton)
        
        -- Conectar el clic del botón a la función para manejar el clic
        serverInfoButton.MouseButton1Click:Connect(function()
            onButtonClick(server.id) 
        end)
        
        yOffset = yOffset + 40 
    end
    
    
    while true do
        updateServerInfo(scrollFrame, serverButtons)
        task.wait()
    end
end

-- Llamar a la función para mostrar los IDs, la cantidad de jugadores y el ping de todos los servidores en el desplazamiento
showServerInfoInScrollingFrame()
