local MenuPanel = game.CoreGui:FindFirstChild("Fernando")
local playerCount = #game.Players:GetPlayers()

if MenuPanel then
    return  
end

if playerCount > 3 then
    if MenuPanel then
        MenuPanel:Destroy()
    end
    wait(1)
    game:Shutdown()
    return  
end

if playerCount > 1 then
    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
end

local success, fail = pcall(function()
    local player = game.Players.LocalPlayer
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local ScreenGui = Instance.new("ScreenGui")
    local TextLabel = Instance.new("TextLabel")
    local farmLabel = Instance.new("TextLabel")
    local formsLabel = Instance.new("TextLabel")
    local meleeLabel = Instance.new("TextLabel")
    local tpLabel = Instance.new("TextLabel")
    local Reb = Instance.new("TextLabel")
    local destroyLabel = Instance.new("TextLabel")
    local farmButton = Instance.new("TextButton")
    local formsButton = Instance.new("TextButton")
    local playersButton = Instance.new("TextButton")
    local MinimizeButton = Instance.new("TextButton")
    local MainButton = Instance.new("TextButton")
    local billsButton = Instance.new("TextButton")
    local earthButton = Instance.new("TextButton")
    local leftLine = Instance.new("Frame")
    local rightLine = Instance.new("Frame")
    local topLine = Instance.new("Frame")
    local bottomLine = Instance.new("Frame")
    local centerLine = Instance.new("Frame")
    local upperLine = Instance.new("Frame")
    local middleLine = Instance.new("Frame")
    local frontSwitchLine = Instance.new("Frame")
    local MenuPanel = Instance.new("Frame")
    local ButtonCorner = Instance.new("UICorner")
    local Panel = Instance.new("ImageLabel")
    local panelExpanded = false
    local sound = Instance.new("Sound", game.Workspace)
    local imageLabel = Instance.new("ImageLabel")
    local billsImageLabel = Instance.new("ImageLabel")
    local earthImageLabel = Instance.new("ImageLabel")
    local hbtcButton = Instance.new("TextButton")
    local hbtcImageLabel = Instance.new("ImageLabel")
    local hbtgvButton = Instance.new("TextButton")
    local hbtgvImageLabel = Instance.new("ImageLabel")
    local mle_extLabel = Instance.new("TextLabel")
    local Stats = game:GetService("Stats")
    local RunService = game:GetService("RunService")
    local pingTextLabel = Instance.new("TextLabel")
    local fpsTextLabel = Instance.new("TextLabel")
    local missionTextLabel = Instance.new("TextLabel")
    local timeTextLabel = Instance.new("TextLabel")
    local button = Instance.new("TextButton", screenGui)
    local bestId
    local background = Instance.new("Frame")
    local playerListContainer = Instance.new("ScrollingFrame")
    local containerCorner = Instance.new("UICorner") 
    local corner = Instance.new("UICorner")
    local ballFrame = Instance.new("Frame")
   
    
local userId = player.UserId
local thumbnailType = Enum.ThumbnailType.HeadShot
local thumbnailSize = Enum.ThumbnailSize.Size48x48
local thumbnailUrl = Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)

local UICorner = Instance.new("UICorner")

-- ConfiguraciÃ³n de GUI
ScreenGui.Name = "Fernando"
ScreenGui.Parent = player.PlayerGui
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.5, -350, 0.4, -130)
TextLabel.Size = UDim2.new(0, 410, 0, 30)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "DBU                                                      "
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.TextStrokeTransparency = 0
TextLabel.Active = true
TextLabel.Draggable = true

MenuPanel.Parent = TextLabel
MenuPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MenuPanel.BorderSizePixel = 0
MenuPanel.Position = UDim2.new(0, 0, 1, 0)
MenuPanel.Size = UDim2.new(0, 410, 0, 400)
MenuPanel.Visible = false

MinimizeButton.Parent = TextLabel
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(0.9, 10, 0.5, -14)
MinimizeButton.Size = UDim2.new(0, 30, 0, 26)
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.Text = "X"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18


farmButton.Parent = MenuPanel
farmButton.Size = UDim2.new(1/3, -10, 0, 30)
farmButton.Position = UDim2.new(0, 5, 0, 5)
farmButton.Text = "List_Play"
farmButton.Font = Enum.Font.SourceSans
farmButton.TextSize = 18
farmButton.TextColor3 = Color3.fromRGB(0, 0, 0)
farmButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
farmButton.TextStrokeTransparency = 0
farmButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
farmButton.BorderSizePixel = 1
farmButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
farmButton.TextScaled = true



formsButton.Name = "FormsButton"
formsButton.Parent = MenuPanel
formsButton.Size = UDim2.new(1/3, -10, 0, 30)
formsButton.Position = UDim2.new(1/3, 5, 0, 5)
formsButton.Text = "Auto_Kill"
formsButton.Font = Enum.Font.SourceSans
formsButton.TextSize = 18
formsButton.TextColor3 = Color3.fromRGB(0, 0, 0)
formsButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
formsButton.TextStrokeTransparency = 0
formsButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
formsButton.BorderSizePixel = 1
formsButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
formsButton.TextScaled = true


playersButton.Parent = MenuPanel
playersButton.Size = UDim2.new(1/3, -10, 0, 30)
playersButton.Position = UDim2.new(2/3, 5, 0, 5)
playersButton.Text = "Players"
playersButton.Font = Enum.Font.SourceSans
playersButton.TextSize = 18
playersButton.TextColor3 = Color3.fromRGB(0, 0, 0)
playersButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
playersButton.TextStrokeTransparency = 0
playersButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
playersButton.BorderSizePixel = 1
playersButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
playersButton.TextScaled = true

leftLine.Parent = MenuPanel
leftLine.Size = UDim2.new(0, 3.3, 1, 0)
leftLine.Position = UDim2.new(0, 0, 0, 0)
leftLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
leftLine.BorderSizePixel = 0.6

rightLine.Parent = MenuPanel
rightLine.Size = UDim2.new(0, 3.3, 1, 0)
rightLine.Position = UDim2.new(1, -2, 0, 0)
rightLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
rightLine.BorderSizePixel = 0.6

topLine.Parent = MenuPanel
topLine.Size = UDim2.new(1, 0, 0, 3)
topLine.Position = UDim2.new(0, 0, 0, 0)
topLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
topLine.BorderSizePixel = 0.6

bottomLine.Parent = MenuPanel
bottomLine.Size = UDim2.new(1, 0, 0, 3)
bottomLine.Position = UDim2.new(0, 0, 1, -2)
bottomLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
bottomLine.BorderSizePixel = 0.6

centerLine.Parent = MenuPanel
centerLine.Size = UDim2.new(1, 0, 0, 3)
centerLine.Position = UDim2.new(0.5, -205, 0, 60)
centerLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
centerLine.BorderSizePixel = 0

upperLine.Parent = MenuPanel
upperLine.Size = UDim2.new(1, 0, 0, 3)
upperLine.Position = UDim2.new(0.5, -205, 0, 105)
upperLine.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
upperLine.BorderSizePixel = 0

middleLine.Parent = MenuPanel
middleLine.Size = UDim2.new(0, 3, 1, -110)
middleLine.Position = UDim2.new(0.5, -1.5, 0, 108)
middleLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
middleLine.BorderSizePixel = 0

frontSwitchLine.Parent = MenuPanel
frontSwitchLine.Size = UDim2.new(0, 3, 0, 43)
frontSwitchLine.Position = UDim2.new(0.4, 40, 0, 63)
frontSwitchLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frontSwitchLine.BorderSizePixel = 0


farmLabel.Parent = MenuPanel
farmLabel.BackgroundTransparency = 1
farmLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
farmLabel.BorderSizePixel = 0
farmLabel.Position = UDim2.new(0.1, -30, 0, 53)
farmLabel.Size = UDim2.new(0, 89, 0, 60)
farmLabel.Font = Enum.Font.SourceSans
farmLabel.Text = "Quest‽"
farmLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
farmLabel.TextScaled = true
farmLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
farmLabel.TextStrokeTransparency = 0


formsLabel.Parent = MenuPanel
formsLabel.BackgroundTransparency = 1
formsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
formsLabel.BorderSizePixel = 0
formsLabel.Position = UDim2.new(0.6, -30, 0, 53)
formsLabel.Size = UDim2.new(0, 89, 0, 60)
formsLabel.Font = Enum.Font.SourceSans
formsLabel.Text = "...."
formsLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
formsLabel.TextScaled = true
formsLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
formsLabel.TextStrokeTransparency = 0


meleeLabel.Parent = MenuPanel
meleeLabel.BackgroundTransparency = 1
meleeLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
meleeLabel.BorderSizePixel = 0
meleeLabel.Position = UDim2.new(0.01, 5, 0.2,22)
meleeLabel.Size = UDim2.new(0, 89, 0, 60)
meleeLabel.Font = Enum.Font.SourceSans
meleeLabel.Text = "...."
meleeLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
meleeLabel.TextScaled = true
meleeLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
meleeLabel.TextStrokeTransparency = 0


tpLabel.Parent = MenuPanel
tpLabel.BackgroundTransparency = 1
tpLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
tpLabel.BorderSizePixel = 0
tpLabel.Position = UDim2.new(0.392, 30, 0.2,22)
tpLabel.Size = UDim2.new(0, 89, 0, 60)
tpLabel.Font = Enum.Font.SourceSans
tpLabel.Text = "..."
tpLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
tpLabel.TextScaled = true
tpLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
tpLabel.TextStrokeTransparency = 0

Reb.Parent = MenuPanel
Reb.BackgroundTransparency = 1
Reb.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Reb.BorderSizePixel = 0
Reb.Position = UDim2.new(0.01, 5, 0.3,24)
Reb.Size = UDim2.new(0, 89, 0, 60)
Reb.Font = Enum.Font.SourceSans
Reb.Text = "Reb-Stats"
Reb.TextColor3 = Color3.fromRGB(0, 0, 0)
Reb.TextScaled = true
Reb.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Reb.TextStrokeTransparency = 0


destroyLabel.Parent = MenuPanel
destroyLabel.BackgroundTransparency = 1
destroyLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
destroyLabel.BorderSizePixel = 0
destroyLabel.Position = UDim2.new(0.01, 5, 0.3,66)
destroyLabel.Size = UDim2.new(0, 99, 0, 60)
destroyLabel.Font = Enum.Font.SourceSans
destroyLabel.Text = "Quet(M)"
destroyLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
destroyLabel.TextScaled = true
destroyLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
destroyLabel.TextStrokeTransparency = 0


mle_extLabel.Parent = MenuPanel
mle_extLabel.BackgroundTransparency = 1
mle_extLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mle_extLabel.BorderSizePixel = 0
mle_extLabel.Position = UDim2.new(0.4, 69, 0.4, 35)
mle_extLabel.Size = UDim2.new(0, 39, 0, 40)
mle_extLabel.Font = Enum.Font.SourceSans
mle_extLabel.Text = "Tp[]"
mle_extLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
mle_extLabel.TextScaled = true
mle_extLabel.TextStrokeColor3 = Color3.fromRGB(205, 255, 255)
mle_extLabel.TextStrokeTransparency = 0

Panel.Parent = ScreenGui
Panel.BackgroundTransparency = 1
Panel.Position = UDim2.new(0.1, 39, 0, 60)
Panel.Size = UDim2.new(0, 70, 0, 0)
Panel.SizeConstraint = Enum.SizeConstraint.RelativeYY 
Panel.ImageColor3 = Color3.fromRGB(255, 255, 255)
Panel.ScaleType = Enum.ScaleType.Fit 
Panel.SliceCenter = Rect.new(10, 10, 10, 10)


imageLabel.Parent = MenuPanel
imageLabel.Size = UDim2.new(0, 48, 0, 48) 
imageLabel.Position = UDim2.new(1, -58, 0.8, 30) 
imageLabel.BackgroundTransparency = 1 
imageLabel.Image = thumbnailUrl





UICorner.CornerRadius = UDim.new(0, 5.5)
billsButton.Size = UDim2.new(0, 31, 0, 31)
billsButton.Position = UDim2.new(0.55275332428457, 39, 0.4, 7)
billsButton.BackgroundColor3 = Color3.new(0, 0, 0)
billsButton.BackgroundTransparency = 0.5
billsButton.Text = ""  
billsButton.Name = "Bills"  
billsButton.Parent = MenuPanel
UICorner:Clone().Parent = billsButton


billsImageLabel.Size = UDim2.new(1, 0, 1, 0)
billsImageLabel.Position = UDim2.new(0, 0, 0, 0)
billsImageLabel.BackgroundTransparency = 1
billsImageLabel.Image = "rbxassetid://17345700746"
billsImageLabel.Name = "BillsImage"  -- Nombre de la etiqueta de imagen
billsImageLabel.Parent = billsButton


earthButton.Size = UDim2.new(0, 31, 0, 31)
earthButton.Position = UDim2.new(0.47875332428457, 20, 0.4, 7)
earthButton.BackgroundColor3 = Color3.new(0, 0, 0)
earthButton.BackgroundTransparency = 0.5
earthButton.Text = ""  -- Sin texto
earthButton.Name = "Earth"  
earthButton.Parent = MenuPanel
UICorner:Clone().Parent = earthButton

earthImageLabel.Size = UDim2.new(1, 0, 1, 0)
earthImageLabel.Position = UDim2.new(0, 0, 0, 0)
earthImageLabel.BackgroundTransparency = 1
earthImageLabel.Image = "rbxassetid://105319560378349"
earthImageLabel.Name = "EarthImage"  
earthImageLabel.Parent = earthButton  

hbtcButton.Size = UDim2.new(0, 31, 0, 31)
hbtcButton.Position = UDim2.new(0.68875332428457, 39, 0.4, 7)
hbtcButton.BackgroundColor3 = Color3.new(0, 0, 0)  
hbtcButton.BackgroundTransparency = 0.5  
hbtcButton.Text = ""  -- Sin texto
hbtcButton.Name = "HBTC"  
hbtcButton.Parent = MenuPanel  
UICorner:Clone().Parent = hbtcButton  

hbtcImageLabel.Size = UDim2.new(1, 0, 1, 0)
hbtcImageLabel.Position = UDim2.new(0, 0, 0, 0)
hbtcImageLabel.BackgroundTransparency = 1 
hbtcImageLabel.Image = "rbxassetid://126015597245029"  
hbtcImageLabel.Name = "HBTC"  
hbtcImageLabel.Parent = hbtcButton  



hbtgvButton.Size = UDim2.new(0, 31, 0, 31)
hbtgvButton.Position = UDim2.new(0.85875332428457, 20, 0.4, 7)  
hbtgvButton.BackgroundColor3 = Color3.new(0, 0, 0)  
hbtgvButton.BackgroundTransparency = 0.5  
hbtgvButton.Text = ""  -- Sin texto
hbtgvButton.Name = "HBTGV"  
hbtgvButton.Parent = MenuPanel  
UICorner:Clone().Parent = hbtgvButton  

hbtgvImageLabel.Size = UDim2.new(1, 0, 1, 0)
hbtgvImageLabel.Position = UDim2.new(0, 0, 0, 0)
hbtgvImageLabel.BackgroundTransparency = 1  
hbtgvImageLabel.Image = "rbxassetid://129453529806060" 
hbtgvImageLabel.Name = "HBTGVImage"  
hbtgvImageLabel.Parent = hbtgvButton  


pingTextLabel.Name = "PingTextLabel"
pingTextLabel.Position = UDim2.new(0, 32, 0.1, 14)
pingTextLabel.AnchorPoint = Vector2.new(0.5, 0)
pingTextLabel.BackgroundTransparency = 1
pingTextLabel.Font = Enum.Font.SourceSans
pingTextLabel.TextSize = 13
pingTextLabel.TextColor3 = Color3.fromRGB(144, 238, 104)
pingTextLabel.TextStrokeTransparency = 0
pingTextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
pingTextLabel.Text = "Ping:"
pingTextLabel.Parent = MenuPanel

fpsTextLabel.Name = "FPSTextLabel"
fpsTextLabel.Position = UDim2.new(0, 20, 0.1, 3)
fpsTextLabel.AnchorPoint = Vector2.new(0.5, 0)
fpsTextLabel.BackgroundTransparency = 1
fpsTextLabel.Font = Enum.Font.SourceSans
fpsTextLabel.TextSize = 13
fpsTextLabel.TextColor3 = Color3.fromRGB(0, 0, 255)
fpsTextLabel.TextStrokeTransparency = 0
fpsTextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
fpsTextLabel.Text = "Fps:"
fpsTextLabel.Parent = MenuPanel


missionTextLabel.Name = "MissionTextLabel"
missionTextLabel.Size = UDim2.new(0, 200, 0, 30)
missionTextLabel.Position = UDim2.new(0.5, 60, 0, 0)
missionTextLabel.AnchorPoint = Vector2.new(0.5, 0)
missionTextLabel.BackgroundTransparency = 1
missionTextLabel.Font = Enum.Font.SourceSans
missionTextLabel.TextSize = 15
missionTextLabel.TextColor3 = Color3.fromRGB(128, 128, 128)
missionTextLabel.TextStrokeTransparency = 0
missionTextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)
missionTextLabel.Text = "Misión: Cargando... | Forma: Cargando..."
missionTextLabel.Parent = TextLabel


timeTextLabel.Name = "TimeTextLabel"
timeTextLabel.Position = UDim2.new(0, 70, 0.1, 3)
timeTextLabel.AnchorPoint = Vector2.new(0.5, 0)
timeTextLabel.BackgroundTransparency = 1
timeTextLabel.Font = Enum.Font.SourceSans
timeTextLabel.TextSize = 13
timeTextLabel.TextColor3 = Color3.fromRGB(128, 128, 128)
timeTextLabel.TextStrokeTransparency = 0
timeTextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)
timeTextLabel.Text = "Hora actual: Cargando..."
timeTextLabel.Parent = MenuPanel


button.Position = UDim2.new(0, 83, 0.1, 14)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.Size = UDim2.new(0, 26, 0, 9)
button.BackgroundTransparency = 1
button.TextSize = 9.30
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextStrokeTransparency = 0
button.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)
button.Text = "Cargando..."
button.Parent = MenuPanel


ballFrame.Size = UDim2.new(0.01592638372826266, 0, 0.22392638372826266, 0) -- Tamaño de la bola
ballFrame.Position = UDim2.new(0.9796319186413133, 0, 0.7796319186413133, 0) -- Centro de la pantalla
ballFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- Amarillo brillante
ballFrame.BackgroundTransparency = 0 -- Totalmente opaco
ballFrame.Parent = TextLabel 

corner.CornerRadius = UDim.new(0.9, 0)
corner.Parent = ballFrame

   

local function SafeCall(func, ...)
    local success, result = pcall(func, ...)
    if not success then
        warn("Error capturado: ", result)
    end
    return success, result
end
   

local TweenService = game:GetService("TweenService")
local colorArray = {
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 165, 0),
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(255, 0, 255),
    Color3.fromRGB(144, 238, 144),
    Color3.fromRGB(255, 105, 180),
    Color3.fromRGB(75, 0, 130),
    Color3.fromRGB(72, 209, 204),
    Color3.fromRGB(255, 69, 0)
}

local colorChangeTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 5
blurEffect.Parent = game.Lighting

-- Capturar errores en el cambio de color
task.spawn(function()
    local success, err = pcall(function()
        local currentIndex = 1
        while true do
            local nextColor = Color3.new(
                colorArray[currentIndex].R,
                colorArray[currentIndex].G,
                colorArray[currentIndex].B
            )

            local leftLineTween = TweenService:Create(leftLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
            local rightLineTween = TweenService:Create(rightLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
            local topLineTween = TweenService:Create(topLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
            local bottomLineTween = TweenService:Create(bottomLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
            local centerLineTween = TweenService:Create(centerLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
            local upperLineTween = TweenService:Create(upperLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
            local middleLineTween = TweenService:Create(middleLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
            local frontSwitchLineTween = TweenService:Create(frontSwitchLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
            leftLineTween:Play()
            rightLineTween:Play()
            topLineTween:Play()
            bottomLineTween:Play()
            centerLineTween:Play()
            upperLineTween:Play()
            middleLineTween:Play()
            frontSwitchLineTween:Play()
            wait(0.7)
            currentIndex = currentIndex % #colorArray + 1
        end
    end)

    if not success then
        warn("Error en el cambio de color: " .. err)
    end
end)


ButtonCorner.Parent = MinimizeButton
ButtonCorner.CornerRadius = UDim.new(0.5, 0)
sound.SoundId = "rbxassetid://1293432192"

local menuExpanded = false
local expandTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local contractTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local expandSize = UDim2.new(0, 410, 0, 400)
local contractSize = UDim2.new(0, 410, 0, 0)

local expandTween = TweenService:Create(MenuPanel, expandTweenInfo, {Size = expandSize})
local contractTween = TweenService:Create(MenuPanel, contractTweenInfo, {Size = contractSize})

-- Función para guardar el estado
local function SaveMenuState(isExpanded)
    local stateInfo = {
        IsExpanded = isExpanded,
        LastModified = os.time()
    }
    writefile("MenuState.json", HttpService:JSONEncode(stateInfo))
end

-- Función para cargar el estado
local function LoadMenuState()
    if isfile("MenuState.json") then
        local fileContents = readfile("MenuState.json")
        local stateData = HttpService:JSONDecode(fileContents)
        if stateData and stateData.IsExpanded ~= nil then
            return stateData.IsExpanded
        end
    end
    return false -- Valor predeterminado si no hay archivo
end

-- Cargar el estado al inicio
menuExpanded = LoadMenuState()
MenuPanel.Visible = menuExpanded

if menuExpanded then
    MenuPanel.Size = expandSize
    MinimizeButton.Text = "X"
else
    MenuPanel.Size = contractSize
    MinimizeButton.Text = "+"
end


MinimizeButton.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        if menuExpanded then
            contractTween:Play()
            MinimizeButton.Text = "+"
            sound:Play()
            wait(0.5)
            MenuPanel.Visible = false
        else
            MenuPanel.Visible = true
            expandTween:Play()
            MinimizeButton.Text = "X"
            sound:Play()
        end
        menuExpanded = not menuExpanded
        SaveMenuState(menuExpanded) -- Guardar el nuevo estado
    end)

    if not success then
        warn("Error al minimizar/expandir el menú: " .. err)
    end
end)
    

local function updatePing()
    local success, err = pcall(function()
        local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        ping = math.floor(ping)
        pingTextLabel.Text = "Ping: " .. ping .. " ms"
    end)

    if not success then
        warn("Error al actualizar el ping: " .. err)
    end
end

local function updateMissionName()
    local success, err = pcall(function()
        missionTextLabel.Text = "Misión: " .. ReplicatedStorage.Datas[player.UserId].Quest.Value .. " | Forma: " .. player.Status.Transformation.Value
    end)

    if not success then
        warn("Error al actualizar el nombre de la misión: " .. err)
    end
end

updateMissionName()
ReplicatedStorage.Datas[Players.LocalPlayer.UserId].Quest:GetPropertyChangedSignal("Value"):Connect(function()
updateMissionName()
SafeCall(Players.LocalPlayer.Status.Transformation:GetPropertyChangedSignal("Value"):Connect(updateText))
end)


local function updateTime()
    local success, err = pcall(function()
        local currentTime = os.date("%H:%M:%S")
        timeTextLabel.Text = "Hora:" .. currentTime
    end)

    if not success then
        warn("Error al actualizar la hora: " .. err)
    end
end

local function initSwitches(MenuPanel)
local function createSwitchModel(parent, position, switchName)
    local switchButton = Instance.new("TextButton")
    switchButton.Parent = parent
    switchButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    switchButton.BorderSizePixel = 0
    switchButton.Position = position
    switchButton.Size = UDim2.new(0, 84, 0, 30)
    switchButton.Text = ""

    local switchButtonCorner = Instance.new("UICorner")
    switchButtonCorner.Parent = switchButton
    switchButtonCorner.CornerRadius = UDim.new(0.4, 0)

    local switchBall = Instance.new("Frame")
    switchBall.Parent = switchButton
    switchBall.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    switchBall.Size = UDim2.new(0, 30, 0, 30)
    switchBall.Position = UDim2.new(0, 5, 0.5, -15)
    switchBall.BorderSizePixel = 0

    local switchBallCorner = Instance.new("UICorner")
    switchBallCorner.Parent = switchBall
    switchBallCorner.CornerRadius = UDim.new(0.5, 0)

    return switchButton, switchBall
end

local switchButton1, switchBall1 = createSwitchModel(MenuPanel, UDim2.new(0.1, 75, 0, 69), "Switch1")
local switchButton5, switchBall5 = createSwitchModel(MenuPanel, UDim2.new(0.220, 19, 0.2, 81), "Switch5")
local switchButton6, switchBall6 = createSwitchModel(MenuPanel, UDim2.new(0.239, 19, 0.2, 125), "Switch6")
local switchButton7, switchBall7 = createSwitchModel(MenuPanel, UDim2.new(0.4, 49, 0.242, 125), "Switch7")

local function SaveSwitchState(isActive, switchName)
    local SwitchInfo = {
        SwitchOn = isActive,
        LastModified = os.time()
    }
    writefile(switchName.."_SwitchState.json", game:GetService("HttpService"):JSONEncode(SwitchInfo))
end

local function LoadSwitchState(switchName)
    if isfile(switchName.."_SwitchState.json") then
        local fileContents = readfile(switchName.."_SwitchState.json")
        if fileContents then
            local switchData = game:GetService("HttpService"):JSONDecode(fileContents)
            if switchData and switchData.SwitchOn ~= nil then
                return switchData.SwitchOn
            end
        end
    end
    return false
end

local function toggleSwitch(isActive, switchBall)
    if isActive then
        switchBall.Position = UDim2.new(1, -35, 0.5, -15)
        switchBall.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        switchBall.Position = UDim2.new(0, 5, 0.5, -15)
        switchBall.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end

local isLoop1Active = LoadSwitchState("Switch1")
local isLoop5Active = LoadSwitchState("Switch5")
local isLoop6Active = LoadSwitchState("Switch6")
local isLoop7Active = LoadSwitchState("Switch7")


local function loop1()
        SafeCall(function()                     
                            getgenv().Stats = {}

local lplr = game.Players.LocalPlayer
local ldata = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)

local stats = getgenv().Stats

local planet = "Earth"

-- Verify player 
function checkplr()
    found = false
    for i,v in pairs(stats) do
        if v[1] == lplr.Name then
            found = false
            return v
        end
    end
    local table = {lplr.Name, math.huge, math.huge, }
    if not found then return table end
end

function getrebprice()
    return (ldata.Rebirth.Value * 3e6) + 2e6
end

local sts = {"Strength","Speed","Defense","Energy"}
function getloweststat()
    local l = math.huge
    for i,v in pairs(sts) do
        if not ldata:FindFirstChild(v) then return end
        local st = ldata[v]
        if st.Value < l then l = st.Value end
    end
    return l
end




if lplr.PlayerGui:FindFirstChild("Start") then
    game:GetService("ReplicatedStorage").Package.Events.Start:InvokeServer()
    if workspace.Others:FindFirstChild("Title") then
        workspace.Others.Title:Destroy();
    end;
    local cam = game.Workspace.CurrentCamera;
    cam.CameraType = Enum.CameraType.Custom;
    cam.CameraSubject = lplr.Character.Humanoid;
    _G.Ready = true
    game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true);
    lplr.PlayerGui:WaitForChild("Main").Enabled = true
    if lplr.PlayerGui:FindFirstChild("Start") then
        lplr.PlayerGui.Start:Destroy()
    end
    lplr.PlayerGui.Main.bruh.Enabled = false
    lplr.PlayerGui.Main.bruh.Enabled = true
end

-- New Script
function FindChar()
    while (not lplr.Character) and (not lplr.Character:FindFirstChild("Humanoid")) and (not lplr.Character.Humanoid.Health > 0) do task.wait() end
    return lplr.Character
end



local r = math.random(1,1e9)
_G.Key = r
pcall(function()game.ReplicatedStorage.BossMaps.Parent = game.Workspace.Others end)
local bm = game.Workspace.Others:WaitForChild("BossMaps")-- or game.ReplicatedStorage:FindFirstChild("BossMaps")
bm.Parent = game.ReplicatedStorage
-- ResetOnSpawn, Name = "Autofarm", 



local Directory = lplr.PlayerGui
pcall(function() Directory.Autofarm:Destroy()end)
local ScGui = Instance.new("ScreenGui")
ScGui.ResetOnSpawn = false
ScGui.Name = "Autofarm"
ScGui.Parent = lplr.PlayerGui
-- Instances:


kick = false

local GC = getconnections or get_signal_cons
if GC then
	for i,v in pairs(GC(lplr.Idled)) do
		if v["Disable"] then
			v["Disable"](v)
		elseif v["Disconnect"] then
			v["Disconnect"](v)
		end
	end
else
	lplr.Idled:Connect(function()
		local VirtualUser = game:GetService("VirtualUser")
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end)
end

local kb_args = {
    [1] = 1,
    [2] = true,
    [3] = CFrame.new(Vector3.new(0,0,0), Vector3.new(-0.7386234402656555, -0.15270498394966125, -0.6565948128700256))
}


local questNPCs = game.Workspace.Others.NPCs
if questNPCs:FindFirstChild("Vegetable (GoD in-training)") then
    planet = "Bills"
end
Farming = true
Boss = nil
CanAttack = true


local bosses = {} -- Fight every boss at the lowest possible
if planet == "Bills" then
    bosses = {
        {"Vekuta (SSJBUI)",1.375e9},
        {"Wukong Rose",1.25e9},
        {"Vekuta (LBSSJ4)",1.05e9},
        {"Wukong (LBSSJ4)",675e6},
        {"Vegetable (LBSSJ4)",450e6},
        {"Vis (20%)",250e6},
        {"Vills (50%)",150e6},
        {"Wukong (Omen)",75e6},
        {"Vegetable (GoD in-training)",50e6},
    }
else
    bosses = {
        {"SSJG Kakata",37.5e6},
        {"Broccoli",35.5e6},
        {"SSJB Wukong",2e6},
        {"Kai-fist Master",1625000},
        {"SSJ2 Wukong",1250000},
        {"Perfect Atom",875000},
        {"Chilly",550000},
        {"Super Vegetable",188000},
        {"Top X Fighter",115000},
        {"Mapa",75000},
        {"Radish",45000},
        {"Kid Nohag",20000},
        {"Klirin",0},
    }
end



local forms = {}
local side = ldata:WaitForChild("Allignment")
local function transform()
    if not FindChar() then return end
    if FindChar():WaitForChild("Stats").Ki.Value < 200 then return end
    if getloweststat() < 34000 then return end
    while not lplr.Status:FindFirstChild("Transformation") and isLoop1Active do task.wait() end
    if not Boss then
    end
    if side.Value == "Good" and isLoop1Active then
        forms = {
	    {"Astral Instinct",120e6,"Blanco"},	
            {"Beast",120e6,"Blanco"},
            {"SSJBUI",120e6,"Blanco"},
            {"LBSSJ4",100e6},
            {"SSJB3",50e6,"SSJB4"},
            {"God of Creation",30e6,"True God of Creation"},
            {"Mastered Ultra Instinct",14e6},
            {"Godly SSJ2",8e6,"Super Broly"},
            {"Blue Evolution",3.5e6,"Super Broly"},
            {"Kefla SSJ2",3e6},
            {"SSJB Kaioken",2.2e6},
            {"SSJ Blue",1.2e6},
            {"SSJ Rage",700000},
            {"SSJG",450000},
            {"SSJ4",300000},
            {"Mystic",200000},
            {"LSSJ",140000},
            {"SSJ3",95000},
            {"Spirit SSJ",65000},
            {"SSJ2",34000},
            {"SSJ Kaioken",16000},
            {"SSJ",6000},
            {"FSSJ",2500},
            {"Kaioken",1000},
        }
    elseif side.Value == "Evil" and isLoop1Active then
        forms = {
          {"Astral Instinct",120e6,"Blanco"},	
            {"Beast",120e6,"Blanco"},
            {"Ultra Ego",120e6,"Blanco"},
            {"LBSSJ4",100e6},
            {"SSJR3",50e6,"SSJB4"},
            {"God of Destruction",30e6,"True God of Destruction"},
            {"Jiren Ultra Instinct",14e6},
            {"Godly SSJ2",8e6,"Super Broly"},
            {"Evil SSJ",4e6,"Super Broly"},
            {"Dark Rose",3.5e6,"Super Broly"},
            {"SSJ Berserker",3e6},
            {"True Rose",2.4e6},
            {"SSJ Rose",1.4e6},
            {"Corrupt SSJ",700000},
            {"SSJG",450000},
            {"SSJ4",300000},
            {"Mystic",200000},
            {"LSSJ",140000},
            {"SSJ3",95000},
            {"SSJ2 Majin",65000},
            {"SSJ2",34000},
            {"SSJ Kaioken",16000},
            {"SSJ",6000},
            {"FSSJ",2500},
            {"Kaioken",1000},
        }
    end
    -- Don't transform if stat grinding
    local lstatus = lplr.Status
    local currentform = lstatus.Transformation.Value
    if planet == "Earth" and ldata.Rebirth.Value >= 20000 then
        if getloweststat() < 30e6 and isLoop1Active then return end
        local useform = nil
        for i,form in pairs(forms) do
            if form[2] == 30e6 and isLoop1Active then useform = form[1] break end
        end
        while lplr.Status.Transformation.Value ~= useform and isLoop1Active do
            game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(useform)
            if lplr.Status.Transformation.Value == useform and isLoop1Active then return end
            pcall(function()
                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
            end)
            task.wait(.01)
        end
        return
    end
    if FindChar() then
        if getloweststat() < 1e12 then -- (ldata.Rebirth.Value*3e6)+2e6
            -- Under 1T stats, transform for efficiency
            for i,form in pairs(forms) do
                if currentform == form[1] or (form[3] and currentform == form[3]) and isLoop1Active then return end
                if getloweststat() >= form[2] and isLoop1Active then 
                    
                    game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form[1])
                    if form[3] ~= nil and isLoop1Active then
                        game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form[3])
                    end
                    CanAttack = true
                    pcall(function()                                  
                        game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                    end)
                    while FindChar().HumanoidRootPart.Anchored == true do wait() end
                    CanAttack = true
                    break
                end
            end
        else -- Transform for mastery, should be over 1T so no need to check for req
            for i,form in pairs(forms) do -- 5,767/332,526"
                if ldata[form[1]].Value < 5767 then
                    local useform = form[1] -- Name of the form you SHOULD use
                    if form[1] == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                    else
                        
                        game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                        CanAttack = false
                        killtarget = nil
                        while lplr.Status.Transformation.Value ~= useform do
                            game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                            pcall(function()
                                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                            end)
                            task.wait(.01)
                        end
                        while FindChar().HumanoidRootPart.Anchored == true do wait() end
                        CanAttack = true
                    end
                    Stacking = true
                    return
                end
            end
           
            useform = "Beast"
            if ldata[useform].Value < 332526 then
                if useform == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                else
                    game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(useform)
                    CanAttack = true
                    killtarget = nil
                    
                    while lplr.Status.Transformation.Value ~= useform do
                        pcall(function()
                            game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                        end)
                        task.wait(.01)
                    end
                    while FindChar().HumanoidRootPart.Anchored == true do wait() end
                    CanAttack = true
                end
                return
            end -- 332526
            for i,form in pairs(forms) do -- 5,767/332,526"
                if ldata[form[1]].Value < 332526 then
                    local useform = form[1] -- Name of the form you SHOULD use
                    if form[1] == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                    else
                        
                        game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                        CanAttack = true
                        killtarget = nil
                        while lplr.Status.Transformation.Value ~= useform do
                            pcall(function()
                                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                            end)
                            task.wait(0.01)
                        end
                       CanAttack = true
                                   
                    end
                    return
                end
            end
        end
    end
end

local questbosses = game.Workspace.Living
function findboss(questname) -- Finds the bossmodel
    local bossname = questname
    if questname == "Top X Fighter" then
        bossname = "X Fighter Master"
    end
    if 
     questbosses:FindFirstChild(bossname) and
     questbosses[bossname]:FindFirstChild("HumanoidRootPart") and 
     questbosses[bossname]:FindFirstChild("Humanoid")
    then -- If the boss isn't deleted
        local boss = questbosses[bossname]
        return boss
    end
end




Stacking = false
task.spawn(function() -- Auto Charge
   
    while ScGui do
    pcall(function()
                if lplr.Status.Blocking.Value ~= true and isLoop1Active then
                    task.spawn(function()
                        --pcall(function()
                            game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(true)
                        --end)
                    end)
                end
            end)
        if Farming  then
            pcall(function()
                local Ki = lplr.Character.Stats.Ki
                while _G.Key == r and ScGui and (not Stacking) and ((not Boss) or Ki.Value < 40 or Ki.Value < Ki.MaxValue/10) and lplr.Character.Humanoid.Health > 0 and isLoop1Active do
                    CanAttack = nil -- Only = nil if charging
                    game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer("Blacknwhite27")            
                end
                if CanAttack == nil then
                    CanAttack = true
                end
            end)
        end
        wait()
    end
end)


task.spawn(function() -- Rebirth, teleport earth/bills
    while ScGui do
        if Farming  then
            if _G.StatGrinding ~= true and isLoop5Active then
                --spawn(function()                
                game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()
            end
            if getloweststat() >= 150e6 and ldata.Zeni.Value >= 15000 and planet == "Earth" and isLoop1Active then                          
    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")
                wait(5)
            end
            -- If just rebirthed and in Beerus go to Earth
            if getloweststat() < 50e6 and planet == "Bills" and isLoop1Active then               
    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
                wait(5)
            end
        end
        task.wait()
    end
end)

game.Workspace.FallenPartsDestroyHeight = 0/0
local part = Instance.new("Part")
part.Parent = Workspace
part.Position = Vector3.new(0,20000,0)
part.Anchored = true
part.Transparency = .9



while not lplr:FindFirstChild("Status") do task.wait() print("Waiting for status") end -- staack
if planet == "Bills" and lplr.Status.Transformation.Value == "None" and getloweststat() < getrebprice()*1.2 then
    Stacking = true
    print("wait to stack")
    
    print("stacking now")
    local form = lplr:WaitForChild("Status"):WaitForChild("Transformation").Value
    --[[if form ~= "None" then
        game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form)
        game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
        -- unform
    end]]
    
   
    task.wait()
   Stacking = true
   Stacking = false
end

local mobs = {"X Fighter","Evil Saya"}
canvolley = true
task.spawn(function() -- Move/Attack
    while ScGui do
        if Farming and isLoop1Active then
            if _G.Key ~= r then
                return
            end
            task.spawn(function() 
            	pcall(function()
	                lplr.Character.Humanoid:ChangeState(11)
	                lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
	                if (not Boss) and #game.Players:GetChildren() > 1  then 
	                    pcall(function()
	                        lplr.Character.HumanidoRootPart.CFrame = part.CFrame
	                    end)
	                end
	                pcall(function()
	                    lplr.Character.HumanoidRootPart.CFrame = CFrame.new(Boss.HumanoidRootPart.CFrame * CFrame.new(0,0,4.5).p, Boss.HumanoidRootPart.Position)
	                end)
	                if Boss then
	                    task.spawn(function()
	                        for i,blast in pairs(FindChar().Effects:GetChildren()) do
	                            if blast.Name == "Blast" then
	                                blast.CFrame = Boss.HumanoidRootPart.CFrame
	                            end
	                        end
	                    end)
	                end
	                if Boss and lplr.Character.Humanoid.Health > 0 and Boss.Humanoid.Health > 0 then
	                    if CanAttack and not Stacking then
	                        CanAttack = false
	                        task.spawn(function()
	                            task.wait(.01) -- Wait for the char to tp back in
                                if getloweststat() >= 40000 and ldata.Quest.Value ~= "" and not lplr.Status:FindFirstChild("Invincible")  and isLoop1Active then
                                    
                                    local thrp = Boss:WaitForChild("HumanoidRootPart",1)
                                    local stats = getloweststat()
                                    local moves = {}
                                    local attacked = false
                                    if stats >= 5000 then
                                        table.insert(moves, "Wolf Fang Fist")
                                    end
                                    if stats >= 40000 then
                                        table.insert(moves, "Meteor Crash")
                                    end
                                    if stats >= 100000 and not table.find({"Evil Saya","X Fighter"},Boss.Name)then
                                        table.insert(moves, "High Power Rush")
                                    end
                                    if stats >= 125000 then
                                        table.insert(moves, "Mach Kick")
                                    end
                                    if stats >= 60e6 then
                                        if ldata.Allignment.Value == "Good" then
                                            table.insert(moves, "Spirit Barrage")
                                        else
                                            table.insert(moves, "God Slicer")
                                        end
                                    end
                                    for i,move in pairs(moves) do
                                        if not lplr.Status:FindFirstChild(move)  and isLoop1Active then
                                            spawn(function()
                                                game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(move,"Blacknwhite27")
                                                
                                            end)
                                            attacked = true
                                        end
                                    end
                                    local args = {
                                        [1] = "Energy Volley",
                                        [2] = {
                                            ["MouseHit"] = CFrame.new(6905.29883, 4005.75342, -6207.93164, 0,0,0, -7.45058149e-09, 0.984732807, -0.174073309, 0.772913337, 0.110451572, 0.624824405),
                                            ["FaceMouse"] = true
                                        },
                                        [3] = "Blacknwhite27"
                                    }
                                    if getloweststat() > 10000 and canvolley then
                                        canvolley = false
                                        game.ReplicatedStorage.Package.Events.voleys:InvokeServer(unpack(args))
                                        
                                        attacked = true
                                        spawn(function()
                                            wait(.01)
                                            canvolley = true
                                        end)
                                    end
                                    if not attacked  and isLoop1Active then
                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",1)
                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",2)
                                    end
                                else
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",1)
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",2)
                                end
                                CanAttack = true
	                        end)
	                    end
                    elseif table.find(mobs,Boss.Name) and isLoop1Active then
                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",1)
                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",2)
                        
	               	end
                end)
            end)
        end
        task.wait()
    end
end)

task.spawn(function() -- Pick quest
    while ScGui and getloweststat() < checkplr()[3] do
        if Farming  and isLoop1Active then
            transform()
            --while not CanAttack do wait() end
            if ldata.Quest.Value == "" or not Boss  and isLoop1Active then
                for i,boss in pairs(bosses) do
                    if ldata.Rebirth.Value >= 2000 and boss[1] == "Mapa" then
                        boss[2] = 0
                    end
                    if getloweststat()/2 >= boss[2] and game.Workspace.Living:FindFirstChild(boss[1]) and game.Workspace.Living[boss[1]]:FindFirstChild("Humanoid") and game.Workspace.Living[boss[1]].Humanoid.Health > 0  and isLoop1Active then
                        if ldata.Quest.Value ~= boss[1] then
              local npc = game.Workspace.Others.NPCs:FindFirstChild(boss[1])  -- Cambié Boss por boss[1] para encontrar el NPC correcto
                 if npc then
                     lplr.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
        wait() 
    end

    pcall(function()
        game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(questNPCs[boss[1]])
    end) 
end
                        if ldata.Quest.Value == boss[1] then
                            Boss = game.Workspace.Living[boss[1]]
                            if CanAttack ~= false then -- Sets if it's not nil                            
                                CanAttack = true
                            end
                        else
                            task.wait(.01)
                            Boss = nil
                        end
                        task.wait(.01)
                        break 
                    end
                end
            elseif game.Workspace.Living:FindFirstChild(ldata.Quest.Value)  then
                Boss = game.Workspace.Living[ldata.Quest.Value]
            else ldata.Quest.Value = ""
                wait(.01)
            end
        end
        task.wait()
    end
end)  
                
        wait() 
    end)
end


local function loop5()
    while true do
        SafeCall(function()
            if isLoop5Active then
                local s = game.Players.LocalPlayer.PlayerGui.Main.MainFrame.Frames.Quest
s.Visible = false
s.Position = UDim2.new(0.01, 0, 0.4, 0)

spawn(function()
    while true do
        local success, err = pcall(function()
            s.Position = UDim2.new(2, 0, 0, 0)
            task.wait()
        end)
        
        if not success then
            warn("Error: " .. err)
        end
        task.wait()
    end
end)
            end
        end)
        wait()
    end
end

local function loop6()
    SafeCall(function()
firstquest = true
autostack = false

local Settings = {Tables = {Forms = {}}; Variables = {Farm = false}}
setmetatable(Settings, {__index = function() warn('Dumbass') end})

local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
local plr = game.Players.LocalPlayer
local player = game:GetService("Players").LocalPlayer
local events = game:GetService("ReplicatedStorage").Package.Events
local rs = game:GetService("RunService")
local data = game.ReplicatedStorage.Datas[player.UserId]
local rebirthRemote = game:GetService("ReplicatedStorage").Package.Events.reb

local allowedPlayers = {
        "fernanfloP091o", "armijosfernando2178", "azeldex", "elmegafer",
    "123daishinkan", "ItzSebaGod", "alexisetter2008",
     "AlejandroItzi", "TheFinal126",
    "0oAKILESo0", "brxxn_sl", "GOKUVSJJJ", 
    "xxXDarknessRisingXxx", "ryu_krs", "mattz678", "FreireBG", "Fernanflop093o", 
    "Gotenks_129", "InFeRnUsKaSlO", "mattz678",
    "DEMONZTSB", "rodri2020proxd", "SAHID_YT6792", "FreireBG", "Flux_chog",
    "robloxesmuymalo2020", "Freire69", "furia3476", "SuperPato0319",
    "andygamer012345", "Crocrakxer246", "fernando_snake", "R4T4TOPP0",
    "Gotenks_129", "juancarlosvillo", "CR7_CHAMPIOSN", "FrivUpd",
    "kayoolicool", "wellington19800", "maisde8milksks"
   
}

local quests = {
    { name = "X Fighter Trainer", nickname = "X Fighter", requiredValue = 0, endRange = 20000 },
    { name = "Kid Nohag", nickname = "Kid Nohag", requiredValue = 20000, endRange = 1000000008867676089868 },
}

function isPlayerAllowed(name)
    for _, allowedName in ipairs(allowedPlayers) do
        if name == allowedName then
            return true
        end
    end
    return false
end

function target()
    local playerName = game:GetService("Players").LocalPlayer.Name
    if isPlayerAllowed(playerName) then
        print("Player is allowed: " .. playerName)
        targetted = playerName
    else
        warn("Player not allowed: " .. playerName)
        return
    end
end

print(game.PlaceId)
target()

local function autoquest(boolean)
    if not isPlayerAllowed(targetted) then return end
    
    repeat
        -- Esperar hasta que el objetivo esté en el espacio de trabajo
    until game.workspace.Living[targetted]

    local a = data.Strength.Value
    local b = data.Energy.Value
    local c = data.Defense.Value
    local d = data.Speed.Value
    print(a, b, c, d)

    local smallest = a
    if b < smallest then
        smallest = b
    end
    if c < smallest then
        smallest = c
    end
    if d < smallest then
        smallest = d
    end

    checkValue = smallest
    print("check value is " .. checkValue)
    print("The smallest number is: " .. smallest)

    for i, quest in ipairs(quests) do
        if checkValue >= quest.requiredValue and checkValue <= quest.endRange then
            print("Quest " .. quest.name .. " has a required value between " .. quest.requiredValue .. " and " .. quest.endRange)
            SelectedQuests = quest.name
            SelectedMobs = quest.nickname
        end
    end

    if firstquest == true then
        lastquest = SelectedQuests
        firstquest = false
    end

    if autostack == true and checkValue > 8000 then
        if lastquest ~= SelectedQuests and isLoop6Active then
            game.workspace.Living[targetted].UpperTorso:Destroy()
            getgenv().stacked = false
            repeat
                print("in auto loop died check")
                task.wait()
            until plr.Character.Humanoid.Health >= 0
            task.wait()
        end
        lastquest = SelectedQuests
    end
end

getgenv().stacked = false

local function quest()
    if not isPlayerAllowed(player.Name) then return end
    
    print(SelectedQuests)
    if game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value ~= SelectedQuests  and isLoop6Active then
        player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Others.NPCs[SelectedQuests].HumanoidRootPart.CFrame
        repeat
            task.wait(0.2)
            events.Qaction:InvokeServer(game:GetService("Workspace").Others.NPCs[SelectedQuests])
        until game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value == SelectedQuests
    end
end

spawn(function()
    local isFlying = false
    local debounce = false

    local function activateFlight()
        if not isPlayerAllowed(player.Name) then return end

        local character = game.Players.LocalPlayer.Character
        local root = character:WaitForChild("HumanoidRootPart")

        local bv = root:FindFirstChildOfClass("BodyVelocity") or Instance.new("BodyVelocity", root)
        local bg = root:FindFirstChildOfClass("BodyGyro") or Instance.new("BodyGyro", root)

        bg.P = 1
        bg.MaxTorque = Vector3.new(500000, 500000, 500000)
        bv.P = 1
        bv.MaxForce = Vector3.new(100000, 100000, 100000)

        isFlying = true
        bv.Velocity = Vector3.new(0, 50, 0) -- Eleva al jugador
    end

    local function deactivateFlight()
        local character = game.Players.LocalPlayer.Character
        local root = character:WaitForChild("HumanoidRootPart")

        local bv = root:FindFirstChildOfClass("BodyVelocity")
        if bv then
            bv.Velocity = Vector3.new(0, 0, 0) -- Detiene el vuelo
        end

        isFlying = false
    end

    while true  do
        task.wait()
        pcall(function()
            while true  do
                task.wait()
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
                        autoquest()
                        if v.Name:lower() == SelectedMobs:lower() and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and isLoop6Active then
                            quest()
                            getgenv().farm = true
                            activateFlight()
                            repeat
                             spawn(function()
                                while getgenv().farm and v and v.Humanoid.Health > 0 do
                                    player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
                                    task.wait()
                                end
                            end)
                                  task.wait(0.1)
                                spawn(function()
                                while getgenv().farm and v and v.Humanoid.Health > 0 do
                                    if not attacked then
                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 2)
                                                     game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(true)
                                    else
                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 2)
                                                     game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(true)
                                    end
                                    
                                    CanAttack = true
                                    task.wait()
                                end
                            end)
                            if table.find(mobs, v.Name) then
                                spawn(function()
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 2)
                                    game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(true)
                                    if game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId].Rebirth.Value <= 2800 then
                                        game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27") end
                                end)
                            end
                            until getgenv().farm == false or v == nil or v.Humanoid.Health <= 0 or player.Character.Humanoid.Health <= 0
                            if player.Character.Humanoid.Health <= 0 then
                                getgenv().farm = false
                                getgenv().stacked = false
                                deactivateFlight()
                                repeat
                                    task.wait()
                                until player.Character.Humanoid.Health >= 0
                                task.wait(0.2)
                            end
                            deactivateFlight()
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while true and wait() and isLoop6Active do
        pcall(function()
            while getgenv().stacked == true and wait() do 
                -- Sin transformaciones
            end
        end)
    end
end)


spawn(function()
    while true and wait() do
        pcall(function()
            if data.Strength.Value < 20000000009880000000 then
                while game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value ~= SelectedQuests do
                    local npc = game:GetService("Workspace").Others.NPCs[SelectedQuests]
                    if npc and npc:FindFirstChild("HumanoidRootPart") and isLoop6Active then
                        player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                    end
                    task.wait(0.3) -- Esperar 5 segundos antes de verificar nuevamente
                end
            end
        end)
    end
end)


spawn(function()
    local lastHour = math.floor(game.Lighting.ClockTime)
    while true do
        task.wait(0.5)
        pcall(function()
            local currentHour = math.floor(game.Lighting.ClockTime)
            if currentHour < lastHour or currentHour < 3 or currentHour == 0 then
                game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Earth")
            elseif currentHour >= 12 then
                return 
            end
            lastHour = currentHour
        end)
    end
end)
            task.wait(0.2)
    end)
end

local function loop7()
    while true do
        if isLoop7Active then
        local background = Instance.new("Frame")
local playerListContainer = Instance.new("ScrollingFrame")

local function format_number(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000
        suffix_index = suffix_index + 1
    end

    local formatted_number = math.floor(number + 0.5)
    return formatted_number .. suffixes[suffix_index]
end

background.Size = UDim2.new(0.877, 0, 0.15, 0)
background.Position = UDim2.new(0, -7, 0.613, 101)
background.BackgroundTransparency = 1
background.Parent = MenuPanel

playerListContainer.Size = UDim2.new(1, -20, 0.85, -10)
playerListContainer.Position = UDim2.new(0, 10, 0.1, 5)
playerListContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
playerListContainer.BorderSizePixel = 0
playerListContainer.ScrollBarThickness = 6
playerListContainer.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
playerListContainer.ScrollBarImageTransparency = 0.5
playerListContainer.Parent = background

local containerCorner = Instance.new("UICorner")
containerCorner.CornerRadius = UDim.new(0, 15)
containerCorner.Parent = playerListContainer

local function teleportToPlayer(targetPlayer)
    local success, err = pcall(function()
        if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position - targetPlayer.Character.HumanoidRootPart.CFrame.LookVector * 3 -- Teletransportar a 3 unidades detrás
            player.Character:MoveTo(targetPosition)
        end
    end)

    if not success then
        warn("Error teleporting to player: " .. err)
    end
end

local function createLabel(parent, text, position, size, playerToTeleport)
    local success, err = pcall(function()
        local frame = Instance.new("Frame")
        frame.Size = size
        frame.Position = position
        frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        frame.BorderSizePixel = 0
        frame.Parent = parent

        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 15)
        frameCorner.Parent = frame

        local label = Instance.new("TextButton")
        label.Size = UDim2.new(1, -10, 1, -10)
        label.Position = UDim2.new(0, 5, 0, 5)
        label.BackgroundTransparency = 1
        label.Text = text
        label.Font = Enum.Font.SourceSans
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextWrapped = true
        label.Parent = frame

        
        label.MouseButton1Click:Connect(function()
            -- Iniciar el teletransporte
            warn("Teleporting to: " .. playerToTeleport.DisplayName)

            -- Usar una función anónima para el teletransporte continuo
            spawn(function()
	while isLoop7Active do
                    teleportToPlayer(playerToTeleport)
             task.wait()
                end
            end)
        end)

        return frame
    end)

    if not success then
        warn("Error creating label: " .. err)
    end
end

local function isPlayerAlive(player)
    local success, result = pcall(function()
        return player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and player.Character:FindFirstChild("HumanoidRootPart")
    end)

    return success and result
end

local function updatePlayerList()
    local success, err = pcall(function()
        local players = Players:GetPlayers()
        table.sort(players, function(a, b)
            if isPlayerAlive(a) and isPlayerAlive(b) then
                return game.ReplicatedStorage.Datas[a.UserId].Strength.Value > game.ReplicatedStorage.Datas[b.UserId].Strength.Value
            elseif isPlayerAlive(a) then
                return true
            else
                return false
            end
        end)

        for _, child in ipairs(playerListContainer:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end

        local yPos = 5

        for _, player in ipairs(players) do
            if isPlayerAlive(player) then
                local playerData = game.ReplicatedStorage.Datas:FindFirstChild(player.UserId)
                if playerData then
                    local playerName = player.DisplayName .. "\n(" .. player.Name .. ")"
                    local rebirthValue = playerData.Rebirth.Value
                    local forceValue = playerData.Strength.Value
                    local formattedForce = format_number(forceValue)

                    local playerFrame = Instance.new("Frame")
                    playerFrame.Size = UDim2.new(1, -10, 0, 40)
                    playerFrame.Position = UDim2.new(0, 5, 0, yPos)
                    playerFrame.BackgroundTransparency = 0.3
                    playerFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                    playerFrame.BorderSizePixel = 0
                    playerFrame.Parent = playerListContainer

                    createLabel(playerFrame, playerName, UDim2.new(0, 0, 0, 0), UDim2.new(0.5, -5, 1, 0), player)
                    createLabel(playerFrame, tostring(rebirthValue), UDim2.new(0.5, 5, 0, 0), UDim2.new(0.25, -5, 1, 0), player)
                    createLabel(playerFrame, formattedForce, UDim2.new(0.75, 9, 0, 0), UDim2.new(0.25, -5, 1, 0), player)

                    yPos = yPos + playerFrame.Size.Y.Offset + 5
                end
            end
        end

        playerListContainer.CanvasSize = UDim2.new(0, 0, 0, yPos - 5)
    end)

    if not success then
        warn("Error updating player list: " .. err)
    end
end

Players.PlayerAdded:Connect(function()
    spawn(updatePlayerList)
end)

Players.PlayerRemoving:Connect(function()
    spawn(updatePlayerList)
end)

spawn(updatePlayerList)

while wait() do
    spawn(updatePlayerList)
end
            end
        task.wait(5)
    end
end

local function SafeCall(func, ...)
    local success, result = pcall(func, ...)
    if not success then
        warn("Error capturado: ", result)
    end
    return success, result
end

switchButton1.MouseButton1Click:Connect(function()
    SafeCall(function()
        isLoop1Active = not isLoop1Active
        toggleSwitch(isLoop1Active, switchBall1)
        SaveSwitchState(isLoop1Active, "Switch1")
    end)
end)



switchButton5.MouseButton1Click:Connect(function()
    SafeCall(function()
        isLoop5Active = not isLoop5Active
        toggleSwitch(isLoop5Active, switchBall5)
        SaveSwitchState(isLoop5Active, "Switch5")
    end)
end)

switchButton6.MouseButton1Click:Connect(function()
    SafeCall(function()
        isLoop6Active = not isLoop6Active
        toggleSwitch(isLoop6Active, switchBall6)
        SaveSwitchState(isLoop6Active, "Switch6")
    end)
end)

switchButton7.MouseButton1Click:Connect(function()
    SafeCall(function()
        isLoop7Active = not isLoop7Active
        toggleSwitch(isLoop7Active, switchBall7)
        SaveSwitchState(isLoop7Active, "Switch7")
    end)
end)

SafeCall(function() toggleSwitch(isLoop1Active, switchBall1) end)
SafeCall(function() toggleSwitch(isLoop5Active, switchBall5) end)
SafeCall(function() toggleSwitch(isLoop6Active, switchBall6) end)
SafeCall(function() toggleSwitch(isLoop7Active, switchBall7) end)

SafeCall(function() coroutine.wrap(loop1)() end)
SafeCall(function() coroutine.wrap(loop5)() end)
SafeCall(function() coroutine.wrap(loop6)() end)
SafeCall(function() coroutine.wrap(loop7)() end)
end

initSwitches(MenuPanel)

MainButton.MouseButton1Click:Connect(function()
    SafeCall(togglePanel)
end)

earthButton.MouseButton1Click:Connect(function()
    SafeCall(function()
        local playerCount = #game.Players:GetPlayers()
        print("Número de jugadores: " .. playerCount)  -- Para depuración
        if playerCount > 3 then
            game:GetService("TeleportService"):Teleport(3311165597, game.Players.LocalPlayer)
        elseif playerCount < 3 then
            game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
        end
    end)
end)

billsButton.MouseButton1Click:Connect(function()
  SafeCall(function()
        local playerCount = #game.Players:GetPlayers()
        print("Número de jugadores: " .. playerCount)  -- Para depuración
        if playerCount > 3 then
            game:GetService("TeleportService"):Teleport(5151400895, game.Players.LocalPlayer)
        elseif playerCount < 3 then
            game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")
        end
    end)
end)

hbtcButton.MouseButton1Click:Connect(function()
    SafeCall(function()
        pcall(function() game:GetService("TeleportService"):Teleport(3608495586) end)
    end)
end)

hbtgvButton.MouseButton1Click:Connect(function()
    SafeCall(function()
      pcall(function() game:GetService("TeleportService"):Teleport(3608496430) end)
    end)
end)

farmButton.MouseButton1Click:Connect(function()
    SafeCall(onFarmButtonClick)
end)

formsButton.MouseButton1Click:Connect(function()
    SafeCall(onFormsButtonClick)
end)

local function Cal()
    local function updateFPS()
    local count, lastUpdate = 0, tick()

    RunService.RenderStepped:Connect(function()
        count = count + 1
        if tick() - lastUpdate >= 1 then
            fpsTextLabel.Text = "FPS: " .. count
            count, lastUpdate = 0, tick()
        end
    end)
end

    local function Serverping()
        local success, servers = pcall(function()
            return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
        end)
        if not success then return "Error" end

        local bestPing = math.huge
        for _, server in ipairs(servers) do
            local ping = math.min((function() 
                local start = tick() 
                RunService.Stepped:wait() 
                return (tick() - start) * 1000 
            end)(), 1500)
            if ping < bestPing then 
                bestPing, bestId = ping, server.id 
            end
        end
        return bestPing < math.huge and math.floor(bestPing) .. "/Srv.." or "N/A"
    end

    button.MouseButton1Click:Connect(function()
    if bestId and #game.Players:GetPlayers() > 2 then
        pcall(function() 
            TeleportService:TeleportToPlaceInstance(game.PlaceId, bestId) 
        end) 
    end
end)

local function updateBallColor()
    local currentHour = math.floor(game.Lighting.ClockTime)
    local currentMinute = math.floor((game.Lighting.ClockTime % 1) * 60)

    if currentHour == 15 and currentMinute >= 40 then
        ballFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Morado brillante
    elseif currentHour == 15 and currentMinute >= 0 and currentMinute < 40 then
        if (tick() % 1) < 0.5 then
            ballFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255) -- Amarillo brillante
        else
            ballFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255) -- Morado brillante
        end
    else
        ballFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Amarillo brillante
    end
end
    

    while true do
        SafeCall(updateFPS)   
        SafeCall(updatePing)   
        SafeCall(updateTime())   
        button.Text = Serverping()        
        SafeCall(updateBallColor())   
          task.wait(1/60) 
    end
end


SafeCall(Cal)
SafeCall(showPlayerThumbnail)

 end)

if not success then
    warn("Error en la inicialización: " .. tostring(fail))
end
