
wait(0.001)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local imageLabel = Instance.new("ImageLabel")
local button = Instance.new("TextButton")
local button1 = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
ScreenGui.ResetOnSpawn = false


button.Size = UDim2.new(0, 31, 0, 31)
button.Position = UDim2.new(0.5, -416, 0.5, -270)
button.BackgroundColor3 = Color3.new(0, 0, 0)  -- Cambiar a color negro
button.BackgroundTransparency = 0.5  -- Cambiar a 0.5 para hacerlo semi-transparente
button.Text = "" -- Oculta el texto del botón
button.Parent = ScreenGui


button1.Size = UDim2.new(0, 31, 0, 31)
button1.Position = UDim2.new(0.5, -374, 0.5, -270)
button1.BackgroundColor3 = Color3.new(0, 0, 0)  -- Cambiar a color negro
button1.BackgroundTransparency = 0.5  -- Cambiar a 0.5 para hacerlo semi-transparente
button1.Text = "" -- Oculta el texto del botón
button1.Parent = ScreenGui


UICorner.CornerRadius = UDim.new(0, 5.5)
UICorner.Parent = button

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5.5)
UICorner.Parent = button1

imageLabel.Size = UDim2.new(1, 0, 1, 0)  -- El tamaño de la imagen coincide con el tamaño del botón
imageLabel.Position = UDim2.new(0, 0, 0, 0)  -- La posición de la imagen en el botón
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://17085964685"  -- Reemplaza con el ID de la imagen proporcionado
imageLabel.Parent = button

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(1, 0, 1, 0)  -- El tamaño de la imagen coincide con el tamaño del botón
imageLabel.Position = UDim2.new(0, 0, 0, 0)  -- La posición de la imagen en el botón
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://17086473030"  -- Reemplaza con el ID de la imagen proporcionado
imageLabel.Parent = button1

button.MouseButton1Click:Connect(function()
    -- Copia el URL al hacer clic
    setclipboard("https://discord.com/invite/h4J9ZHqQ")
    print("¡URL copiado al portapapeles!")
end)

button1.MouseButton1Click:Connect(function()
    -- Copia el URL al hacer clic
    setclipboard("https://youtube.com/@user-ee2do7sz8m?si=clS1oGo4mfy4ifuZ")
    print("¡URL copiado al portapapeles!")
end) 
