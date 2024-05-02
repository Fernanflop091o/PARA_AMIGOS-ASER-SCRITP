-- Obtener el jugador local
local player = game.Players.LocalPlayer

-- Crear la interfaz principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false  -- La GUI no se reinicia al reaparecer

-- Crear botones
local button = Instance.new("TextButton")
local button1 = Instance.new("TextButton")

-- Crear esquinas redondeadas
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5.5)

-- Configurar propiedades del primer botón
button.Size = UDim2.new(0, 31, 0, 31)
button.Position = UDim2.new(0.1, 39, 0, -32)
button.BackgroundColor3 = Color3.new(0, 0, 0)  -- Color negro
button.BackgroundTransparency = 0.5  -- Semi-transparente
button.Text = ""  -- Sin texto
button.Parent = ScreenGui
UICorner:Clone().Parent = button  -- Añadir esquinas redondeadas

-- Agregar imagen al primer botón
local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(1, 0, 1, 0)  -- Tamaño de la imagen
imageLabel.Position = UDim2.new(0, 0, 0, 0)  -- Posición de la imagen
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://17345705488"  -- Reemplaza con el ID de tu imagen
imageLabel.Parent = button

-- Configurar propiedades del segundo botón
button1.Size = UDim2.new(0, 31, 0, 31)
button1.Position = UDim2.new(0.2, 20, 0, -32)
button1.BackgroundColor3 = Color3.new(0, 0, 0)  -- Color negro
button1.BackgroundTransparency = 0.5  -- Semi-transparente
button1.Text = ""  -- Sin texto
button1.Parent = ScreenGui
UICorner:Clone().Parent = button1  -- Añadir esquinas redondeadas

-- Agregar imagen al segundo botón
local imageLabel1 = Instance.new("ImageLabel")
imageLabel1.Size = UDim2.new(1, 0, 1, 0)  -- Tamaño de la imagen
imageLabel1.Position = UDim2.new(0, 0, 0, 0)  -- Posición de la imagen
imageLabel1.BackgroundTransparency = 1
imageLabel1.Image = "rbxassetid://17345700746"  -- Reemplaza con el ID de tu imagen
imageLabel1.Parent = button1

-- Conectar eventos para ejecutar acciones específicas al hacer clic

-- Al hacer clic en el primer botón, imprime un mensaje en la consola
button.MouseButton1Click:Connect(function()
  game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
end)


-- Al hacer clic en el segundo botón, inicia una animación
button1.MouseButton1Click:Connect(function()
game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")
end)
