local MenuPanel = game.CoreGui:FindFirstChild("Fernando")
local playerCount = #game.Players:GetPlayers()

pcall(function()
    if MenuPanel then
        return  
    end

    if playerCount > 3 then
        pcall(function()
            if MenuPanel then
                MenuPanel:Destroy()
            end
        end)
        wait(0.5)
        pcall(function()
            game:Shutdown()
        end)
        return  
    end

    if playerCount > 1 then
        pcall(function()
            game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
        end)
    end
end)


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

            pcall(function()
                leftLineTween:Play()
                rightLineTween:Play()
                topLineTween:Play()
                bottomLineTween:Play()
                centerLineTween:Play()
                upperLineTween:Play()
                middleLineTween:Play()
                frontSwitchLineTween:Play()
            end)

            wait(0.7)
            currentIndex = currentIndex % #colorArray + 1
        end
    end)

    if not success then
        warn("Error en el cambio de color: " .. tostring(err))
    end
end)

pcall(function()
    ButtonCorner.Parent = MinimizeButton
    sound.SoundId = "rbxassetid://1293432192"
end)

local menuExpanded = false
local expandTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local contractTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local expandSize = UDim2.new(0, 410, 0, 400)
local contractSize = UDim2.new(0, 410, 0, 0)

local expandTween = TweenService:Create(MenuPanel, expandTweenInfo, {Size = expandSize})
local contractTween = TweenService:Create(MenuPanel, contractTweenInfo, {Size = contractSize})

local function SaveMenuState(isExpanded)
    local success, err = pcall(function()
        local stateInfo = {
            IsExpanded = isExpanded,
            LastModified = os.time()
        }
        writefile("MenuState.json", HttpService:JSONEncode(stateInfo))
    end)

    if not success then
        warn("Error al guardar el estado del menú: " .. tostring(err))
    end
end

local function LoadMenuState()
    local success, result = pcall(function()
        if isfile("MenuState.json") then
            local fileContents = readfile("MenuState.json")
            local stateData = HttpService:JSONDecode(fileContents)
            if stateData and stateData.IsExpanded ~= nil then
                return stateData.IsExpanded
            end
        end
        return false
    end)

    if not success then
        warn("Error al cargar el estado del menú: " .. tostring(result))
        return false
    end

    return result
end

menuExpanded = LoadMenuState()
MenuPanel.Visible = menuExpanded

pcall(function()
    if menuExpanded then
        MenuPanel.Size = expandSize
        MinimizeButton.Text = "X"
    else
        MenuPanel.Size = contractSize
        MinimizeButton.Text = "+"
    end
end)

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
        SaveMenuState(menuExpanded)
    end)

    if not success then
        warn("Error al minimizar/expandir el menú: " .. tostring(err))
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
        missionTextLabel.Text = "Misión: " .. ReplicatedStorage.Datas[player.UserId].Quest.Value
    end)

    if not success then
        warn("Error al actualizar el nombre de la misión: " .. tostring(err))
    end
end

updateMissionName()
ReplicatedStorage.Datas[Players.LocalPlayer.UserId].Quest:GetPropertyChangedSignal("Value"):Connect(function()
    updateMissionName()
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

    local function safeCreateSwitch(position, switchName)
    local success, button, ball = pcall(function() return createSwitchModel(MenuPanel, position, switchName) end)
    return success and button, ball or nil, nil
end

local switchButton1, switchBall1 = safeCreateSwitch(UDim2.new(0.1, 75, 0, 69), "Switch1")
local switchButton2, switchBall2 = safeCreateSwitch(UDim2.new(0.6, 75, 0, 69), "Switch2")
local switchButton3, switchBall3 = safeCreateSwitch(UDim2.new(0.285, 0, 0.2, 36), "Switch3")
local switchButton5, switchBall5 = safeCreateSwitch(UDim2.new(0.220, 19, 0.2, 81), "Switch5")
local switchButton6, switchBall6 = safeCreateSwitch(UDim2.new(0.239, 19, 0.2, 125), "Switch6")
local switchButton7, switchBall7 = safeCreateSwitch(UDim2.new(0.4, 49, 0.242, 125), "Switch7")

    local function SaveSwitchState(isActive, switchName)
    pcall(function()
        local SwitchInfo = {
            SwitchOn = isActive,
            LastModified = os.time()
        }
        writefile(switchName.."_SwitchState.json", game:GetService("HttpService"):JSONEncode(SwitchInfo))
    end)
end

local function LoadSwitchState(switchName)
    local success, result = pcall(function()
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
    end)

    if success then
        return result
    else
        return false
    end
end

    local function toggleSwitch(isActive, switchBall)
    pcall(function()
        if isActive then
            switchBall.Position = UDim2.new(1, -35, 0.5, -15)
            switchBall.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        else
            switchBall.Position = UDim2.new(0, 5, 0.5, -15)
            switchBall.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)
end

    local function safeLoadSwitchState(switchName)
    local success, result = pcall(function() return LoadSwitchState(switchName) end)
    return success and result or false
end

local isLoop1Active = safeLoadSwitchState("Switch1")
local isLoop2Active = safeLoadSwitchState("Switch2")
local isLoop3Active = safeLoadSwitchState("Switch3")
local isLoop5Active = safeLoadSwitchState("Switch5")
local isLoop6Active = safeLoadSwitchState("Switch6")
local isLoop7Active = safeLoadSwitchState("Switch7")

    local function loop1()
        pcall(function()                     
        local player = game.Players.LocalPlayer
local data = game.ReplicatedStorage.Datas[player.UserId]
local events = game:GetService("ReplicatedStorage").Package.Events

local missions = {
    { name = "Klirin", bossName = "Klirin", requiredValue = 0, endRange = 20000 },
    { name = "Kid Nohag", bossName = "Kid Nohag", requiredValue = 20000, endRange = 100001 },
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
        pcall(function()
            if data.Zeni.Value >= 15000 then
                local A_1 = "Vills Planet"
                local Event = events.TP
                Event:InvokeServer(A_1)
            else
                SelectedQuest = "SSJG Kakata"
                SelectedMob = "SSJG Kakata"
            end
        end)
        return
    end

    if firstQuest == true then
        lastQuest = SelectedQuest
        firstQuest = false
    end

    local lowestStat = math.min(data.Strength.Value, data.Energy.Value, data.Defense.Value, data.Speed.Value)
    for _, mission in ipairs(missions) do
        if lowestStat >= mission.requiredValue and lowestStat <= mission.endRange then
            pcall(function()
                SelectedQuest = mission.name
                SelectedMob = mission.bossName
            end)
            break
        end
    end
end

local function startMission()
    pcall(function()
        local npc = game:GetService("Workspace").Others.NPCs:FindFirstChild(SelectedQuest)
        if npc and npc:FindFirstChild("HumanoidRootPart") and isLoop1Active then
            player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
            local args = {npc}
            events.Qaction:InvokeServer(unpack(args))
        end
    end)
end

local function tpToMissionBoss()
    pcall(function()
        local boss = game:GetService("Workspace").Living:FindFirstChild(SelectedMob)
        if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and isLoop1Active then
            player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
            game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 2)   
            game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
        end
    end)
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
        task.wait(1)
        local success, fallo = pcall(function()
            if data.Strength.Value < 200000000 and game.PlaceId ~= 3311165597 and isLoop1Active then
                local A_1 = "Earth"
                local Event = events.TP
                Event:InvokeServer(A_1)
                task.wait(8)
            end
        end)

        if not success then
            warn("Error al ejecutar la teletransportación: " .. fallo)
        end
    end
end)

task.spawn(function()
    while true do
        task.wait()
        if isLoop5Active then
            local success, fallo = pcall(function()
                game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()
            end)

            if not success then
                warn("Error al invocar el evento rebirth: " .. fallo)
            end
        end
    end
end)

task.spawn(function() -- Auto Charge
    while true do
        local success, fallo = pcall(function()
            local args = {[1] = true}
            game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
        end)

        if not success then
            warn("Error al bloquear la acción de carga: " .. fallo)
        end
        task.wait(0.1)
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

local function format_number(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end

    return suffix_index > 1 and string.format("%.1f%s", number, suffixes[suffix_index]) or tostring(number)
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
        
        pcall(function()
            HPText.Text = "SALUD: " .. format_number(health) .. " / " .. format_number(maxHealth)
        end)
        pcall(function()
            EnergyText.Text = "ENERGÍA: " .. format_number(ki) .. " / " .. format_number(maxKi)
        end)
        pcall(function()
            ZeniLabel.Text = format_number(ldata.Zeni.Value) .. " Zeni"
        end)

        for _, stat in pairs({"Strength", "Speed", "Defense", "Energy"}) do
            local statLabel = StatsFrame:FindFirstChild(stat)
            if statLabel then
                pcall(function()
                    statLabel.Text = stat .. ": " .. format_number(ldata[stat].Value)
                end)
            end
        end
    end)
    
    if not success then
        warn("Error al actualizar GUI de estadísticas:", err)
    end
end

pcall(function()
    updateStatsGui()
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if lplr.Character and lplr.Character:FindFirstChild("Humanoid") and isLoop2Active then
        pcall(function()
            updateStatsGui()
        end)
    end
end)
            end
            task.wait(.5)
        end
    end

 local function loop3()
        pcall(function()                   
        local HttpService = game:GetService("HttpService")
local player = game:GetService("Players").LocalPlayer
local placeId = game.PlaceId

repeat
    wait()
until player.CharacterAdded
local character = player.Character
local stats = character:WaitForChild("Stats")

local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill

local Forms = {'Astral Instinct','Ultra Ego','SSJB4','True God of Creation','True God of Destruction','Super Broly', 
                'LSSJG','LSSJ4','SSJG4','LSSJ3','Mystic Kaioken','LSSJ Kaioken','SSJR3','SSJB3','God Of Destruction','God Of Creation',
                'Jiren Ultra Instinct', 'Mastered Ultra Instinct','Godly SSJ2', 'Ultra Instinct Omen', 'Evil SSJ','Blue Evolution',
                'Dark Rose','Kefla SSJ2','SSJ Berserker','True Rose', 'SSJB Kaioken','SSJ Rose', 'SSJ Blue','Corrupt SSJ',
                'SSJ Rage','SSJG','SSJ4','Mystic','LSSJ','SSJ3','Spirit SSJ','SSJ2 Majin','SSJ2','SSJ Kaioken','SSJ','FSSJ','Kaioken'}

local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.8, 0, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

local transformLabel = Instance.new("TextLabel")
transformLabel.Size = UDim2.new(1, 0, 1, 0)
transformLabel.BackgroundTransparency = 1
transformLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
transformLabel.TextScaled = true
transformLabel.Text = "Transformación seleccionada: Ninguna"
transformLabel.Parent = frame

local function updateMenu(selectedForm)
    transformLabel.Text = "Transformación seleccionada: " .. selectedForm
end

local alreadyEquipped = false

local function transform()
    pcall(function()
        for i, v in pairs(Forms) do
            if equipRemote:InvokeServer(v) then
                updateMenu(v)

                if placeId == 5151400895 then
                    if not alreadyEquipped then
                        game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
                        alreadyEquipped = true
                    end
                end

                break
            end
        end
        repeat
            wait()
            if player.Status.SelectedTransformation.Value ~= player.Status.Transformation.Value then
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            end
        until game.Players.LocalPlayer.Status.SelectedTransformation.Value ==
            game.Players.LocalPlayer.Status.Transformation.Value
    end)
end

player.CharacterAdded:Connect(function()
    alreadyEquipped = false
end)

while true and task.wait() do
    if (stats.Strength.Value > 5000 and stats.Defense.Value > 5000 and stats.Energy.Value > 5000 and stats.Speed.Value > 5000) then
        transform()
    end
end
  
        task.wait(1)
        end)
    end

    local function loop5()
        while true do
            pcall(function()
                if isLoop3Active then
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local lplr = Players.LocalPlayer

pcall(function()
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

        pcall(function()
            lplr.PlayerGui.Main.bruh.Enabled = false
        end)
        pcall(function()
            lplr.PlayerGui.Main.bruh.Enabled = true
        end)
    end
end)
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
            task.wait(1)
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
    local success, fallo = pcall(function()
        targetted = game:GetService("Players").LocalPlayer.Name
    end)

    if not success then
        warn("Error en target: " .. fallo)
    end
end

target()

local function autoquest()
    local success, fallo = pcall(function()
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
    end)

    if not success then
        warn("Error en autoquest: " .. fallo)
    end
end

getgenv().stacked = false

local function quest()
    local success, fallo = pcall(function()
        local npc = game:GetService("Workspace").Others.NPCs:FindFirstChild(SelectedQuests)
        
        if game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value ~= SelectedQuests and isLoop6Active then
            if npc and npc:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                local args = {npc} -- Se pasa el NPC encontrado como argumento
                game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(unpack(args))
            end
        end
    end)

    if not success then
        warn("Error en quest: " .. fallo)
    end
end

task.spawn(autoquest)
task.spawn(quest)

local function tpToBoss(boss)
    local success, fallo = pcall(function()
        if player.Character:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
        end
    end)

    if not success then
        warn("Error en tpToBoss: " .. fallo)
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
        local succes,fallo = pcall(function()
            if data.Strength.Value >= 25000 and game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value == "" and isLoop6Active then
                local kidNohag = game:GetService("Workspace").Others.NPCs["Kid Nohag"]
                if kidNohag and kidNohag:FindFirstChild("HumanoidRootPart") and isLoop6Active then
                    player.Character.HumanoidRootPart.CFrame = kidNohag.HumanoidRootPart.CFrame
                    local args = { kidNohag }
                    game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(unpack(args)) -- Inicia la misión
                end
            end
        end)
        if not succes then
            warn(fallo)
        end
    end
end)

task.spawn(function()
    local lastGameHour = math.floor(game.Lighting.ClockTime)
    while true do
        task.wait()
        local succes,fallo = pcall(function()
            if isLoop6Active then
                local currentGameHour = math.floor(game.Lighting.ClockTime)
                local playerCount = #game.Players:GetPlayers()                
                if currentGameHour < lastGameHour or (currentGameHour >= 2 and currentGameHour < 3) then
                    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
                elseif currentGameHour >= 3 and currentGameHour < 12 then
                    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
                elseif playerCount > 1 then
                    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
                end                
                lastGameHour = currentGameHour
            end
        end)
        if not succes then
            warn(fallo)
        end
    end
end)

            task.wait(.1)
    end)
end

local function loop7()
pcall(function()
    task.spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if isLoop7Active then
            pcall(function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    local ldata = game.ReplicatedStorage.Datas[player.UserId]
                    local lplr = game.Players.LocalPlayer
                    local Ki = lplr.Character:WaitForChild("Stats"):WaitForChild("Ki")
                    local humanoid = lplr.Character:WaitForChild("Humanoid")

                    pcall(function()
                        if ldata.Quest.Value ~= "" then
                            local successCha, errorCha = pcall(function()
                                game.ReplicatedStorage.Package.Events.cha:InvokeServer("Blacknwhite27")
                            end)
                            if not successCha then
                                warn("Error en cha: ", errorCha)
                            end
                        end
                    end)

                    pcall(function()
                        local successBlock, errorBlock = pcall(function()
                            local args = {[1] = true}
					game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
                        end)
                        if not successBlock then
                            warn("Error al intentar activar el bloqueo:", errorBlock)
                        end
                    end)

                    pcall(function()
                        if ldata.Quest.Value ~= "" and ldata.Strength.Value > 40000 then
                            local closestBoss, closestDistance = nil, math.huge
                            local playerPos = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position or nil

                            if playerPos then
                                for _, v in ipairs(game.Workspace.Living:GetChildren()) do
                                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                        local distance = (playerPos - v.HumanoidRootPart.Position).magnitude
                                        if distance < closestDistance and v.Humanoid.Health > 0 and v.Name ~= player.Character.Name then
                                            closestDistance, closestBoss = distance, v
                                        end
                                    end
                                end

                                pcall(function()
                                    if closestBoss and closestDistance <= 12 and closestBoss.Humanoid.Health > 0 then
                                        local attacks = {
                                            "Super Dragon Fist", "God Slicer", "Spirit Barrage", 
                                            "Mach Kick", "Wolf Fang Fist", "High Power Rush", 
                                            "Meteor Strike", "Meteor Charge", "Spirit Breaking Cannon", 
                                            "Vital Strike", "Flash Kick", "Vanish Strike", "Uppercut",
                                            function() 
                                                game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")
                                            end
                                        }

                                        for _, attackName in ipairs(attacks) do
                                            task.spawn(function() 
                                                pcall(function()
                                                    if type(attackName) == "string" then
                                                        game.ReplicatedStorage.Package.Events.mel:InvokeServer(attackName, "Blacknwhite27")
                                                    elseif type(attackName) == "function" then
                                                        attackName()
                                                    end
                                                end)
                                            end)
                                        end
                                    end
                                end)
                            else
                                warn("Error: No se pudo encontrar la posición del jugador.")
                            end
                        end
                    end)
                end
            end)
        end
    end)
end)
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
    
    switchButton3.MouseButton1Click:Connect(function()
    pcall(function()
    isLoop3Active = not isLoop3Active
    toggleSwitch(isLoop3Active, switchBall3)
    SaveSwitchState(isLoop3Active, "Switch3")
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
    toggleSwitch(isLoop3Active, switchBall3)
    toggleSwitch(isLoop5Active, switchBall5)
    toggleSwitch(isLoop6Active, switchBall6)
    toggleSwitch(isLoop7Active, switchBall7)

    coroutine.wrap(loop1)()
    coroutine.wrap(loop2)()
    coroutine.wrap(loop3)()
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
                pcall(function() 
                    fpsTextLabel.Text = "FPS: " .. count
                end)
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
        pcall(function() 
            if bestId and #game.Players:GetPlayers() > 2 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, bestId) 
            end
        end)
    end)

    local function updateBallColor()
        local currentHour = math.floor(game.Lighting.ClockTime)
        local currentMinute = math.floor((game.Lighting.ClockTime % 1) * 60)

        pcall(function()
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
        end)
    end

    while true do
        pcall(function() updateFPS() end)   
        pcall(function() updatePing() end)   
        pcall(function() updateTime() end)   
        pcall(function() button.Text = Serverping() end)        
        pcall(function() updateBallColor() end)   
        task.wait(1/60) 
    end
end

pcall(Cal)
pcall(showPlayerThumbnail)

 end)

if not success then
    warn("Error en la inicialización: " .. tostring(fail))
end
