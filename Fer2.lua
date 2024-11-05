local MenuPanel = game.CoreGui:FindFirstChild("Fernando")
local playerCount = #game.Players:GetPlayers()

if MenuPanel then
    return  
end

if playerCount > 3 then
    if MenuPanel then
        MenuPanel:Destroy()
    end
    wait(0.5)
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
formsLabel.Text = "F/A/MTR"
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
mle_extLabel.Text = "Meles[]"
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
            local nextColor = colorArray[currentIndex]

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
        warn("Error en el cambio de color: " .. tostring(err))
    end
end)

ButtonCorner.Parent = MinimizeButton
sound.SoundId = "rbxassetid://1293432192"

local menuExpanded = false
local expandTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local contractTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local expandSize = UDim2.new(0, 410, 0, 400)
local contractSize = UDim2.new(0, 410, 0, 0)

local expandTween = TweenService:Create(MenuPanel, expandTweenInfo, {Size = expandSize})
local contractTween = TweenService:Create(MenuPanel, contractTweenInfo, {Size = contractSize})

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
            wait(0.6)
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
        warn("Error al actualizar el ping: " .. tostring(err))
    end
end

local function updateMissionName()
    local success, err = pcall(function()
        missionTextLabel.Text = "Misión: " .. ReplicatedStorage.Datas[player.UserId].Quest.Value .. " | Forma: " .. player.Status.Transformation.Value
    end)

    if not success then
        warn("Error al actualizar el nombre de la misión: " .. tostring(err))
    end
end

updateMissionName()
ReplicatedStorage.Datas[Players.LocalPlayer.UserId].Quest:GetPropertyChangedSignal("Value"):Connect(function()
    updateMissionName()
    local success, err = pcall(function()
        Players.LocalPlayer.Status.Transformation:GetPropertyChangedSignal("Value"):Connect(updateText)
    end)
    if not success then
        warn("Error al conectar la señal de cambio de transformación: " .. tostring(err))
    end
end)

local function updateTime()
    local success, err = pcall(function()
        local currentTime = os.date("%H:%M:%S")
        timeTextLabel.Text = "Hora: " .. currentTime
    end)

    if not success then
        warn("Error al actualizar la hora: " .. tostring(err))
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
    local switchButton2, switchBall2 = createSwitchModel(MenuPanel, UDim2.new(0.6, 75, 0, 69), "Switch2")
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
    local isLoop2Active = LoadSwitchState("Switch2")
    local isLoop5Active = LoadSwitchState("Switch5")
    local isLoop6Active = LoadSwitchState("Switch6")
    local isLoop7Active = LoadSwitchState("Switch7")

    local function loop1()
        pcall(function()                     
local player = game.Players.LocalPlayer
local data = game.ReplicatedStorage.Datas[player.UserId]
local events = game:GetService("ReplicatedStorage").Package.Events

local missions = {
    { name = "Kid Nohag", bossName = "Kid Nohag", requiredValue = 0, endRange = 100001 },
    { name = "Radish", bossName = "Radish", requiredValue = 100001, endRange = 200000 },
    { name = "Mapa", bossName = "Mapa", requiredValue = 200001, endRange = 300000 },
    { name = "Citizen", bossName = "Evil Saya", requiredValue = 300001, endRange = 400000 },
    { name = "Top X Fighter", bossName = "X Fighter Master", requiredValue = 400001, endRange = 700000 },
    { name = "Super Vegetable", bossName = "Super Vegetable", requiredValue = 750001, endRange = 1200000 },
    { name = "Perfect Atom", bossName = "Perfect Atom", requiredValue = 3500000, endRange = 5000000 },
    { name = "SSJ2 Wukong", bossName = "SSJ2 Wukong", requiredValue = 5000001, endRange = 8000000 },
    { name = "SSJB Wukong", bossName = "SSJB Wukong", requiredValue = 8000000, endRange = 50000000 },
    { name = "Broccoli", bossName = "Broccoli", requiredValue = 50000001, endRange = 150000000 },
    { name = "SSJG Kakata", bossName = "SSJG Kakata", requiredValue = 150000001, endRange = 200000000 },
    { name = "Vegetable (GoD in-training)", bossName = "Vegetable (GoD in-training)", requiredValue = 200000001, endRange = 300000000 },
    { name = "Wukong (Omen)", bossName = "Wukong (Omen)", requiredValue = 300000001, endRange = 600000000 },
    { name = "Vills (50%)", bossName = "Vills (50%)", requiredValue = 600000001, endRange = 1200000000 },
    { name = "Vis (20%)", bossName = "Vis (20%)", requiredValue = 1200000001, endRange = 1800000000 },
    { name = "Vegetable (LBSSJ4)", bossName = "Vegetable (LBSSJ4)", requiredValue = 1800000001, endRange = 2700000000 },
    { name = "Wukong (LBSSJ4)", bossName = "Wukong (LBSSJ4)", requiredValue = 2700000001, endRange = 4200000000 },
    { name = "Vekuta (LBSSJ4)", bossName = "Vekuta (LBSSJ4)", requiredValue = 4200000001, endRange = 5000000000 },
    { name = "Wukong Rose", bossName = "Wukong Rose", requiredValue = 5000000001, endRange = 5500000000 },
    { name = "Vekuta (SSJBUI)", bossName = "Vekuta (SSJBUI)", requiredValue = 5500000001, endRange = math.huge },
}

local SelectedQuest
local SelectedMob
local firstQuest = true
local lastQuest
local rebirthRemote = events.reb

local function assignQuest()
    local checkValue = math.min(data.Strength.Value, data.Energy.Value, data.Defense.Value, data.Speed.Value)

    if checkValue >= 200000000 and game.placeId ~= 5151400895 and isLoop1Active then
        if data.Zeni.Value >= 15000 then
            local A_1 = "Vills Planet"
            local Event = events.TP
            Event:InvokeServer(A_1)
            return
        else 
            SelectedQuest = "SSJG Kakata"
            SelectedMob = "SSJG Kakata"
            return
        end
    end

    if firstQuest == true then
        lastQuest = SelectedQuest
        firstQuest = false
    end

    local lowestStat = math.min(data.Strength.Value, data.Energy.Value, data.Defense.Value, data.Speed.Value)
    for _, mission in ipairs(missions) do
        if lowestStat >= mission.requiredValue and lowestStat <= mission.endRange then
            SelectedQuest = mission.name
            SelectedMob = mission.bossName
            break
        end
    end
end

local function startMission()
    local npc = game:GetService("Workspace").Others.NPCs:FindFirstChild(SelectedQuest)
    
    if npc and npc:FindFirstChild("HumanoidRootPart") and isLoop1Active then
        player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
        local args = {npc}
        events.Qaction:InvokeServer(unpack(args))
    end
end

local function tpToMissionBoss()
    local boss = game:GetService("Workspace").Living:FindFirstChild(SelectedMob)

    if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and isLoop1Active then
        player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
        
        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 2)   
        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
    end
end

task.spawn(function()
    while true do
        local lag = game:GetService("RunService").Stepped:Wait()
        local success, errorMessage = pcall(function()
            assignQuest()

            local questValue = game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value
            if questValue ~= SelectedQuest then
                startMission()
            end

            tpToMissionBoss()
        end)

        if not success then
            warn("Error en el script: " .. errorMessage)
        end
    end
end)


task.spawn(function()
    while true do
        wait(1)
        pcall(function()
            if data.Strength.Value < 200000000 and game.PlaceId ~= 3311165597 and isLoop1Active then
                local A_1 = "Earth"
                local Event = events.TP
                Event:InvokeServer(A_1)
                wait(8)
            end
        end)
    end
end)


task.spawn(function()
    while true do
        wait()
        if isLoop5Active then
            pcall(function()
                game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()
            end)
        end
    end
end)
            task.wait(1)
        end)
    end

   local function loop2()
        while true do
            if isLoop2Active then
             local lplr = game.Players.LocalPlayer
local ldata = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)

local function formatNumber(num)
    if num >= 1e6 then
        return string.format("%.1fm", num / 1e6)
    elseif num >= 1e3 then
        return string.format("%dk", num / 1e3)
    else
        return tostring(num)
    end
end

local function updateStatsGui()
    local success, err = pcall(function()
        local MainFrame = lplr.PlayerGui:WaitForChild("Main"):WaitForChild("MainFrame")
        local StatsFrame = MainFrame:WaitForChild("Frames"):WaitForChild("Stats")
        local ZeniLabel = MainFrame.Indicator:FindFirstChild("Zeni")
        local Bars = MainFrame:WaitForChild("Bars")
        local HPText = Bars.Health:FindFirstChild("TextLabel")
        local EnergyText = Bars.Energy:FindFirstChild("TextLabel")
        
        local health = lplr.Character and lplr.Character:FindFirstChild("Humanoid") and lplr.Character.Humanoid.Health or 0
        local maxHealth = lplr.Character and lplr.Character:FindFirstChild("Humanoid") and lplr.Character.Humanoid.MaxHealth or 0
        local ki = lplr.Character and lplr.Character:FindFirstChild("Stats") and lplr.Character.Stats.Ki.Value or 0
        local maxKi = lplr.Character and lplr.Character:FindFirstChild("Stats") and lplr.Character.Stats.Ki.MaxValue or 0
        
        HPText.Text = "SALUD: " .. formatNumber(health) .. " / " .. formatNumber(maxHealth)
        EnergyText.Text = "ENERGÍA: " .. formatNumber(ki) .. " / " .. formatNumber(maxKi)
        ZeniLabel.Text = formatNumber(ldata.Zeni.Value) .. " Zeni"

        for _, stat in pairs({"Strength", "Speed", "Defense", "Energy"}) do
            local statLabel = StatsFrame:FindFirstChild(stat)
            if statLabel then
                statLabel.Text = stat .. ": " .. formatNumber(ldata[stat].Value)
            end
        end
    end)
    
    if not success then
        warn("Error al actualizar GUI de estadísticas:", err)
    end
end

updateStatsGui()

game:GetService("RunService").Heartbeat:Connect(function()
    if lplr.Character and lplr.Character:FindFirstChild("Humanoid") and isLoop2Active then
        pcall(updateStatsGui)
    end
end)
            end
            task.wait(.5)
        end
    end


    local function loop5()
        while true do
            pcall(function()
                if isLoop5Active then
                
                local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local lplr = Players.LocalPlayer

if lplr.PlayerGui:FindFirstChild("Start") then
    ReplicatedStorage.Package.Events.Start:InvokeServer()

    if Workspace.Others:FindFirstChild("Title") then
        Workspace.Others.Title:Destroy()
    end

    local cam = Workspace.CurrentCamera
    cam.CameraType = Enum.CameraType.Custom
    cam.CameraSubject = lplr.Character.Humanoid

    _G.Ready = true
    game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)

    lplr.PlayerGui.Main.Enabled = true

    if lplr.PlayerGui:FindFirstChild("Start") then
        lplr.PlayerGui.Start:Destroy()
    end

    lplr.PlayerGui.Main.bruh.Enabled = false
    lplr.PlayerGui.Main.bruh.Enabled = true
end
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
                                warn("Error en loop5: " .. err)
                            end
                            task.wait()
                        end
                    end)
                end
            end)
            task.wait(0.5)
        end
    end

    local function loop6()
        pcall(function()
firstquest = true
autostack = false

local Settings = {Tables = {Forms = {}}; Variables = {Farm = false}}
setmetatable(Settings, {__index = function() warn('Dumbass') end})

local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
local player = game.Players.LocalPlayer
local data = game.ReplicatedStorage.Datas[player.UserId]
local events = game:GetService("ReplicatedStorage").Package.Events
local rs = game:GetService("RunService")

local quests = {
    { name = "X Fighter Trainer", nickname = "X Fighter", requiredValue = 0, endRange = 25000 },
    { name = "Oozaru", nickname = "Oozaru", requiredValue = 25000, endRange = math.huge },
}

function target()
    targetted = game:GetService("Players").LocalPlayer.Name
end

target()

local function autoquest()
    repeat
        task.wait()
    until game.workspace.Living[targetted]

    local a, b, c, d = data.Strength.Value, data.Energy.Value, data.Defense.Value, data.Speed.Value
    local smallest = math.min(a, b, c, d)

    for _, quest in ipairs(quests) do
        if smallest >= quest.requiredValue and smallest <= quest.endRange then
            SelectedQuests = quest.name
            SelectedMobs = quest.nickname
            break
        end
    end

    if firstquest then
        lastquest = SelectedQuests
        firstquest = false
    end

    if autostack and smallest > 8000 then
        if lastquest ~= SelectedQuests and isLoop6Active then
            game.workspace.Living[targetted].UpperTorso:Destroy()
            getgenv().stacked = false
            repeat
                task.wait()
            until player.Character.Humanoid.Health > 0
        end
        lastquest = SelectedQuests
    end
end

getgenv().stacked = false

local function quest()
    local npc = game:GetService("Workspace").Others.NPCs:FindFirstChild(SelectedQuests)
    
    if game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value ~= SelectedQuests and isLoop6Active then
        if npc and npc:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
            local args = {npc} -- Se pasa el NPC encontrado como argumento
            game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(unpack(args))
        end
    end
end

task.spawn(autoquest)
task.spawn(quest)

local function tpToBoss(boss)
    if player.Character:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
    end
end

task.spawn(function()
    while true do
        task.wait()
        pcall(function()
            while true do
                task.wait()
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
                        autoquest()
                        if v.Name:lower() == SelectedMobs:lower() and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and isLoop6Active then
                            quest()
                            getgenv().farm = true
                            repeat
                                task.wait()
                                player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
                            until getgenv().farm == false or v == nil or v.Humanoid.Health <= 0 or player.Character.Humanoid.Health <= 0
                            if player.Character.Humanoid.Health <= 0 then
                                getgenv().farm = false
                                getgenv().stacked = false
                                repeat
                                    task.wait()
                                until player.Character.Humanoid.Health >= 0
                                task.wait()
                            end
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while true do
        task.wait()
        pcall(function()
            if data.Strength.Value >= 25000 and game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value == "" and isLoop6Active then
                local kidNohag = game:GetService("Workspace").Others.NPCs["Kid Nohag"]
                if kidNohag and kidNohag:FindFirstChild("HumanoidRootPart") and isLoop6Active then
                    player.Character.HumanoidRootPart.CFrame = kidNohag.HumanoidRootPart.CFrame
                    local args = { kidNohag }
                    game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(unpack(args)) -- Inicia la misión
                end
            end
        end)
    end
end)

task.spawn(function()
    local lastGameHour = math.floor(game.Lighting.ClockTime)
    while true do
        task.wait()
        pcall(function()
            local currentGameHour = math.floor(game.Lighting.ClockTime)
            local playerCount = #game.Players:GetPlayers()
            if currentGameHour < lastGameHour or currentGameHour < 3 or currentGameHour == 0 then
                game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
            elseif currentGameHour >= 3 and currentGameHour < 12 then
                game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
            elseif playerCount > 1 then
                game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
            end            
            lastGameHour = currentGameHour
        end)
    end
end)



            task.wait(.1)
    end)
end

local function loop7()
pcall(function()
            local player = game.Players.LocalPlayer
local events = game:GetService("ReplicatedStorage").Package.Events
local target = "Blacknwhite27"

local actions = {
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
    "Vital Strike",
}

local invokeDelay = 1
local lastInvokeTime = 0

local function invokeAction(action)
    pcall(function()
        events.mel:InvokeServer(action, target)
        events.cha:InvokeServer(target)
    end)
end

local function getClosestBoss()
    local closestBoss, closestDistance = nil, math.huge
    local playerPos = player.Character.HumanoidRootPart.Position

    for _, v in ipairs(game.Workspace.Living:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
            local distance = (playerPos - v.HumanoidRootPart.Position).magnitude
            if distance < closestDistance and v.Humanoid.Health > 0 and v.Name ~= player.Character.Name then
                closestDistance, closestBoss = distance, v
            end
        end
    end
    return closestBoss
end

local function invokeAll()
    for _, action in ipairs(actions) do
        task.spawn(invokeAction, action)
    end

    events.voleys:InvokeServer("Energy Volley", { FaceMouse = false, MouseHit = CFrame.new() }, target)
end

local function loop7()
    while true do
        task.wait(.05)
        local currentTime = tick()
        local boss = getClosestBoss()

        if boss and (player.Character.HumanoidRootPart.Position - boss.HumanoidRootPart.Position).magnitude <= 5 then
            local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()

            if ping < 500 and currentTime - lastInvokeTime >= invokeDelay then
                pcall(function()
                    events.block:InvokeServer(true)
                end)

                invokeAll()
                events.p:FireServer(target, 1)
                events.p:FireServer(target, 2)
                lastInvokeTime = currentTime
            end
        end
    end
end

task.spawn(loop7)

spawn(function()
    while true do
        task.wait()
    end
end)

spawn(function()
    while true do
        local spam = 0
        repeat
            local success, err = pcall(function()
                spam = spam + 1
                task.wait(0.5)
            end)
        until spam == 12 or not success

        if not success then
            warn("Error en el spam:", err)
        end
    end
end)
            
        task.wait()
    end)
end
        task.wait() -- Aumentar la espera entre iteraciones principales para reducir la frecuencia de ejecuciÃ³n
    end)
end


    switchButton1.MouseButton1Click:Connect(function()
        pcall(function()
            isLoop1Active = not isLoop1Active
            toggleSwitch(isLoop1Active, switchBall1)
            SaveSwitchState(isLoop1Active, "Switch1")
        end)
    end)

    switchButton2.MouseButton1Click:Connect(function()
        pcall(function()
            isLoop2Active = not isLoop2Active
            toggleSwitch(isLoop2Active, switchBall2)
            SaveSwitchState(isLoop2Active, "Switch2")
        end)
    end)

    switchButton5.MouseButton1Click:Connect(function()
        pcall(function()
            isLoop5Active = not isLoop5Active
            toggleSwitch(isLoop5Active, switchBall5)
            SaveSwitchState(isLoop5Active, "Switch5")
        end)
    end)

    switchButton6.MouseButton1Click:Connect(function()
        pcall(function()
            isLoop6Active = not isLoop6Active
            toggleSwitch(isLoop6Active, switchBall6)
            SaveSwitchState(isLoop6Active, "Switch6")
        end)
    end)

    switchButton7.MouseButton1Click:Connect(function()
        pcall(function()
            isLoop7Active = not isLoop7Active
            toggleSwitch(isLoop7Active, switchBall7)
            SaveSwitchState(isLoop7Active, "Switch7")
        end)
    end)

    toggleSwitch(isLoop1Active, switchBall1)
    toggleSwitch(isLoop2Active, switchBall2)
    toggleSwitch(isLoop5Active, switchBall5)
    toggleSwitch(isLoop6Active, switchBall6)
    toggleSwitch(isLoop7Active, switchBall7)

    coroutine.wrap(loop1)()
    coroutine.wrap(loop2)()
    coroutine.wrap(loop5)()
    coroutine.wrap(loop6)()
    coroutine.wrap(loop7)()
end

initSwitches(MenuPanel)

MainButton.MouseButton1Click:Connect(function()
    pcall(togglePanel)
end)

earthButton.MouseButton1Click:Connect(function()
    pcall(function()
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
    pcall(function()
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
    pcall(function() game.ReplicatedStorage.Package.Events.TP:InvokeServer("Hyperbolic Time Chamber") end)
end)

hbtgvButton.MouseButton1Click:Connect(function()
    pcall(function() game.ReplicatedStorage.Package.Events.TP:InvokeServer("Gravity Room") end)
end)

farmButton.MouseButton1Click:Connect(function()
    pcall(onFarmButtonClick)
end)

formsButton.MouseButton1Click:Connect(function()
    pcall(onFormsButtonClick)
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
        pcall(updateFPS)   
        pcall(updatePing)   
        pcall(updateTime)   
        button.Text = Serverping()        
        pcall(updateBallColor)   
        task.wait(1/60) 
    end
end

pcall(Cal)
pcall(showPlayerThumbnail)

 end)

if not success then
    warn("Error en la inicialización: " .. tostring(fail))
end
