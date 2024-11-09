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
meleeLabel.Text = "Form"
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
        local loaded = false
 
   success, err = pcall(function()
       while not loaded do
    if game["loaded"] then
        
        loaded = true
        break
    end
    end
   end)
            if success then

                warn(" game loaded Function executed successfully")

             
                
            else
                warn("Error occurred:", err)
            
            end

print("game loaded")
local success, result = pcall(function()
    repeat
        task.wait()
    until game.Players.LocalPlayer ~= nil and game.Players.LocalPlayer.Name ~= nil and
        game.Players.LocalPlayer:GetMouse() ~= nil

    repeat
        task.wait()
    until game:IsLoaded()
    game:WaitForChild("ReplicatedStorage")
    game.ReplicatedStorage:WaitForChild("Datas")
    game.ReplicatedStorage.Datas:WaitForChild(game.Players.LocalPlayer.UserId)
end)
if success then



                warn(" game loaded Function executed successfully")

                
            else
                warn("Error occurred:", err)
            
            end

task.wait()


local stackneeded = true
local targetted;
local transformStatus = false
local autoFarmLoopRunning = false
local stacked = false
local flying = false

local charge = false
local checkValue;

getgenv().dead = false
getgenv().rebirthed = false

function format_number(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end

    return string.format("%.2f%s", number, suffixes[suffix_index])
end


function getCheckValue()
    data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
    local a = data.Strength.Value
    local b = data.Energy.Value
    local c = data.Defense.Value
    local d = data.Speed.Value

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
    return checkValue
end
local PaidFormsList = {
    Evil = {{
        name = "SSJ2 Kaioken",
        reqvalue = 50000,
        endrangevalue = 160000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "LSSJ Kaioken",
        reqvalue = 160001,
        endrangevalue = 250000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "Mystic Kaioken",
        reqvalue = 250001,
        endrangevalue = 550000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "SSJ5",
        reqvalue = 550001,
        endrangevalue = 800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950469
    }, {
        name = "LSSJ3",
        reqvalue = 800001,
        endrangevalue = 1000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "SSJG4",
        reqvalue = 1000001,
        endrangevalue = 1800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "LSSJ4",
        reqvalue = 1800001,
        endrangevalue = 3000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "LSSJG",
        reqvalue = 3000001,
        endrangevalue = 4000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "Super Broly",
        reqvalue = 4000000,
        endrangevalue = 30000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 7837022
    }, {
        name = "True God of Destruction",
        reqvalue = 30000001,
        endrangevalue = 50000000,
        alignment = "Evil",
        rebirthReq = 10,
        formOwned = false,
        GamePassID = 9848987
    }, {
        name = "SSJB4",
        reqvalue = 50000001,
        endrangevalue = 120000000,
        alignment = "Neutral",
        rebirthReq = 13,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "Blanco",
        reqvalue = 120000001,
        endrangevalue = 120000000986636346000000000,
        alignment = "Neutral",
        rebirthReq = 24,
        formOwned = false,
        GamePassID = 676684901
    }},

    Good = {{
        name = "SSJ2 Kaioken",
        reqvalue = 50000,
        endrangevalue = 160000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "LSSJ Kaioken",
        reqvalue = 160001,
        endrangevalue = 250000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "Mystic Kaioken",
        reqvalue = 250001,
        endrangevalue = 550000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "SSJ5",
        reqvalue = 550001,
        endrangevalue = 800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950469
    }, {
        name = "LSSJ3",
        reqvalue = 800001,
        endrangevalue = 1000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "SSJG4",
        reqvalue = 1000001,
        endrangevalue = 1800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "LSSJ4",
        reqvalue = 1800001,
        endrangevalue = 3000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "LSSJG",
        reqvalue = 3000001,
        endrangevalue = 4000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "Super Broly",
        reqvalue = 4000000,
        endrangevalue = 30000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 7837022
    }, {
        name = "SSJB4",
        reqvalue = 50000001,
        endrangevalue = 120000001,
        alignment = "Neutral",
        rebirthReq = 13,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "Blanco",
        reqvalue = 120000000,
        endrangevalue = 120000000986636346000000000,
        alignment = "Neutral",
        rebirthReq = 24,
        formOwned = false,
        GamePassID = 676684901
    }}
}

local FormsList = {

    Evil = {{
        name = "Kaioken",
        reqvalue = 1000,
        endrangevalue = 2500,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "FSSJ",
        reqvalue = 2501,
        endrangevalue = 6000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ",
        reqvalue = 6001,
        endrangevalue = 16000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ Kaioken",
        reqvalue = 16001,
        endrangevalue = 34000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ2",
        reqvalue = 34001,
        endrangevalue = 65000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ2 Majin",
        reqvalue = 65001,
        endrangevalue = 95000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "SSJ3",
        reqvalue = 95001,
        endrangevalue = 140000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "LSSJ",
        reqvalue = 140001,
        endrangevalue = 200000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Mystic",
        reqvalue = 200001,
        endrangevalue = 300000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ4",
        reqvalue = 300001,
        endrangevalue = 450000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJG",
        reqvalue = 450001,
        endrangevalue = 700000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Corrupt SSJ",
        reqvalue = 700001,
        endrangevalue = 1400000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "SSJ Rose",
        reqvalue = 1400001,
        endrangevalue = 2400000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "True Rose",
        reqvalue = 2400001,
        endrangevalue = 3000000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "SSJ Berserker",
        reqvalue = 3000001,
        endrangevalue = 3500000,
        alignment = "Evil",
        rebirthReq = 1
    }, {
        name = "Dark Rose",
        reqvalue = 3500001,
        endrangevalue = 4000000,
        alignment = "Evil",
        rebirthReq = 2
    }, {
        name = "Evil SSJ",
        reqvalue = 4000001,
        endrangevalue = 5000000,
        alignment = "Evil",
        rebirthReq = 3
    }, {
        name = "Ultra Instinct Omen",
        reqvalue = 5000001,
        endrangevalue = 8000000,
        alignment = "Neutral",
        rebirthReq = 3
    }, {
        name = "Godly SSJ2",
        reqvalue = 8000001,
        endrangevalue = 14000000,
        alignment = "Neutral",
        rebirthReq = 4
    }, {
        name = "Jiren Ultra Instinct",
        reqvalue = 14000001,
        endrangevalue = 30000000,
        alignment = "Evil",
        rebirthReq = 6
    }, {
        name = "God of Destruction",
        reqvalue = 30000001,
        endrangevalue = 50000000,
        alignment = "Evil",
        rebirthReq = 10
    }, {
        name = "SSJR3",
        reqvalue = 50000001,
        endrangevalue = 100000000,
        alignment = "Evil",
        rebirthReq = 12
    }, {
        name = "LBSSJ4",
        reqvalue = 100000001,
        endrangevalue = 120000000,
        alignment = "Good",
        rebirthReq = 18
    }, {
        name = "Ultra Ego",
        reqvalue = 120000001,
        endrangevalue = 120000002,
        alignment = "Evil",
        rebirthReq = 20
    },
{
        name = "Beast",
        reqvalue = 120000003,
        endrangevalue = 100000000000000000000000,
        alignment = "Evil",
        rebirthReq = 24
    }}, -- close evil

    Good = {{
        name = "Kaioken",
        reqvalue = 1000,
        endrangevalue = 2500,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "FSSJ",
        reqvalue = 2501,
        endrangevalue = 6000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ",
        reqvalue = 6001,
        endrangevalue = 16000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ Kaioken",
        reqvalue = 16001,
        endrangevalue = 34000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ2",
        reqvalue = 34001,
        endrangevalue = 65000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Spirit SSJ",
        reqvalue = 65001,
        endrangevalue = 95000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "SSJ3",
        reqvalue = 95001,
        endrangevalue = 140000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "LSSJ",
        reqvalue = 140001,
        endrangevalue = 200000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Mystic",
        reqvalue = 200001,
        endrangevalue = 300000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ4",
        reqvalue = 300001,
        endrangevalue = 450000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJG",
        reqvalue = 450001,
        endrangevalue = 700000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ Rage",
        reqvalue = 700001,
        endrangevalue = 1200000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "SSJ Blue",
        reqvalue = 1200001,
        endrangevalue = 2200000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "SSJB Kaioken",
        reqvalue = 2200001,
        endrangevalue = 3000000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "Kefla SSJ2",
        reqvalue = 3000001,
        endrangevalue = 3500000,
        alignment = "Good",
        rebirthReq = 1
    }, {
        name = "Blue Evolution",
        reqvalue = 3500001,
        endrangevalue = 5000000,
        alignment = "Good",
        rebirthReq = 2
    }, {
        name = "Ultra Instinct Omen",
        reqvalue = 5000001,
        endrangevalue = 8000000,
        alignment = "Neutral",
        rebirthReq = 3
    }, {
        name = "Godly SSJ2",
        reqvalue = 8000001,
        endrangevalue = 14000000,
        alignment = "Neutral",
        rebirthReq = 4
    }, {
        name = "Mastered Ultra Instinct",
        reqvalue = 14000001,
        endrangevalue = 30000000,
        alignment = "Good",
        rebirthReq = 6
    }, {
        name = "God of Creation",
        reqvalue = 30000001,
        endrangevalue = 50000000,
        alignment = "Good",
        rebirthReq = 10
    }, {
        name = "SSJB3",
        reqvalue = 50000001,
        endrangevalue = 100000000,
        alignment = "Good",
        rebirthReq = 12
    }, {
        name = "LBSSJ4",
        reqvalue = 100000001,
        endrangevalue = 120000001,
        alignment = "Good",
        rebirthReq = 18
    }, {
        name = "SSJBUI",
        reqvalue = 120000001,
        endrangevalue = 120000002,
        alignment = "Good",
        rebirthReq = 20
    },
{
        name = "Beast",
        reqvalue = 120000003,
        endrangevalue = 100000000000000000000000,
        alignment = "Good",
        rebirthReq = 24
    }}
}

local quests = {{
    name = "X Fighter Trainer",
    nickname = "X Fighter",
    requiredValue = 0,
    endRange = 30000,
    planet = "Earth"
}, {
    name = "Klirin",
    nickname = "Klirin",
    requiredValue = 30001,
    endRange = 60000,
    planet = "Earth"
}, {
    name = "Kid Nohag",
    nickname = "Kid Nohag",
    requiredValue = 60001,
    endRange = 80000,
    planet = "Earth"
}, {
    name = "Turtle Student",
    nickname = "Turtle Student",
    requiredValue = 80001,
    endRange = 100000,
    planet = "Earth"
}, {
    name = "Radish",
    nickname = "Radish",
    requiredValue = 100001,
    endRange = 200000,
    planet = "Earth"
}, {
    name = "Mapa",
    nickname = "Mapa",
    requiredValue = 200001,
    endRange = 300000,
    planet = "Earth"
}, {
    name = "Citizen",
    nickname = "Evil Saya",
    requiredValue = 300001,
    endRange = 400000,
    planet = "Earth"
}, {
    name = "Top X Fighter",
    nickname = "X Fighter Master",
    requiredValue = 400001,
    endRange = 750000,
    planet = "Earth"
}, {
    name = "Super Vegetable",
    nickname = "Super Vegetable",
    requiredValue = 750001,
    endRange = 1000000,
    planet = "Earth"
}, {
    name = "Chilly",
    nickname = "Chilly",
    requiredValue = 100001,
    endRange = 3000000,
    planet = "Earth"
}, {
    name = "Perfect Atom",
    nickname = "Perfect Atom",
    requiredValue = 3000001,
    endRange = 5100000,
    planet = "Earth"
}, {
    name = "SSJ2 Wukong",
    nickname = "SSJ2 Wukong",
    requiredValue = 5100001,
    endRange = 6000000,
    planet = "Earth"
}, {
    name = "SSJB Wukong",
    nickname = "SSJB Wukong",
    requiredValue = 6000001,
    endRange = 30500000,
    planet = "Earth"
}, {
    name = "Broccoli",
    nickname = "Broccoli",
    requiredValue = 30500001,
    endRange = 100000000,
    planet = "Earth"
}, {
    name = "SSJG Kakata",
    nickname = "SSJG Kakata",
    requiredValue = 100000000,
    endRange = 150000000,
    planet = "Earth"
}, {
    name = "Vegetable (GoD in-training)",
    nickname = "Vegetable (GoD in-training)",
    requiredValue = 150000001,
    endRange = 250000000,
    planet = "Bills"
}, {
    name = "Wukong (Omen)",
    nickname = "Wukong (Omen)",
    requiredValue = 250000001,
    endRange = 320000000,
    planet = "Bills"
}, {
    name = "Vills (50%)",
    nickname = "Vills (50%)",
    requiredValue = 320000001,
    endRange = 500000000,
    planet = "Bills"
}, {
    name = "Vis (20%)",
    nickname = "Vis (20%)",
    requiredValue = 500000001,
    endRange = 1000000000,
    planet = "Bills"
}, {
    name = "Vegetable (LBSSJ4)",
    nickname = "Vegetable (LBSSJ4)",
    requiredValue = 1000000001,
    endRange = 1900000000,
    planet = "Bills"
}, {
    name = "Wukong (LBSSJ4)",
    nickname = "Wukong (LBSSJ4)",
    requiredValue = 1500000001,
    endRange = 3000000000,
    planet = "Bills"
}, {
    name = "Vekuta (LBSSJ4)",
    nickname = "Vekuta (LBSSJ4)",
    requiredValue = 3000000001,
    endRange = 3500000000,
    planet = "Bills"
}, {
    name = "Wukong Rose",
    nickname = "Wukong Rose",
    requiredValue = 3500000001,
    endRange = 5250000000,
    planet = "Bills"
}, {
    name = "Vekuta (SSJBUI)",
    nickname = "Vekuta (SSJBUI)",
    requiredValue = 4450000001,
    endRange = 2000000000000000000,
    planet = "Bills"
}}



local function check1()
    pcall(function()
    local checkValue = getCheckValue()

    if checkValue >= 150000000 and game.placeId ~= 5151400895 then
        data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
        if data.Zeni.Value >= 15000 then

            local A_1 = "Vills Planet"
            local Event = game:GetService("ReplicatedStorage").Package.Events.TP
            Event:InvokeServer(A_1)
            tp = true
            return tp
        else
            SelectedQuests = "SSJG Kakata"
            SelectedMobs1 = "SSJG Kakata"

            tp = false
            return SelectedQuests, SelectedMobs, tp

        end
    end

    if checkValue <= 150000000 and game.placeId == 5151400895 then

        if checkValue < 150000000 and game.placeId ~= 3311165597 then
            local A_1 = "Earth"
            local Event = game:GetService("ReplicatedStorage").Package.Events.TP
            Event:InvokeServer(A_1)
            task.wait(8)
        end
    end
end)
end

function target()
    targetted = game.Players.LocalPlayer.name

end
pcall(function() target() end)
local function deadcheck(LDCheck)
    success, err = pcall(function()
        task.wait()
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
            getgenv().dead = true
            transformStatus = false
            autoFarmLoopRunning = false
            flying = false
            questneeded = true
            

        else
            autoFarmLoopRunning = true
            getgenv().dead = false
            
        end
    end)
    if LDCheck then
        getgenv().stackneeded = false
        autoFarmLoopRunning = true
        print("last dead check passed")
    end
    if success then
        warn("Stack loop Function executed successfully with a value of " .. tostring(getgenv().dead))
      
        
    else
        warn("Error occurred:", err)
        
    end
    return autoFarmLoopRunning, transformStatus, flying
end

function startgame()
    pcall(function()

        repeat

            if game.workspace[targetted] then
                task.wait()
                local Event = game:GetService("ReplicatedStorage").Package.Events.Start
                Event:InvokeServer()
                task.wait()

                local Event = game:GetService("ReplicatedStorage").Package.Events.Start
                Event:InvokeServer()

                task.wait()

                game.Players.LocalPlayer.PlayerGui.Main.bruh.Disabled = true

                game.Players.LocalPlayer.PlayerGui.Main.bruh.Disabled = false

                task.wait()
                local Event = game:GetService("ReplicatedStorage").Package.Events.Start
                Event:InvokeServer()

            end
        until game.workspace.Living[targetted]

    end)

end
repeat
 success, err = pcall(function() 
local function CheckGamePass(UserId, GamePassID)
    local MarketplaceService = game:GetService("MarketplaceService")
    return MarketplaceService:UserOwnsGamePassAsync(UserId, GamePassID)
end

local userId = game.Players.LocalPlayer.UserId 

for _, form in ipairs(PaidFormsList["Evil"]) do

    form.formOwned = CheckGamePass(userId, form.GamePassID)

end

for _, form in ipairs(PaidFormsList["Good"]) do
    form.formOwned = CheckGamePass(userId, form.GamePassID)
end

for _, form in ipairs(PaidFormsList["Good"]) do

    print(string.format("Name: %s, ReqValue: %d, EndRangeValue: %d, Alignment: %s, RebirthReq: %d, FormOwned: %s",
        form.name, form.reqvalue, form.endrangevalue, form.alignment, form.rebirthReq, tostring(form.formOwned)))

end
end)
task.wait()
until success


local function autostack(stack1)
    pcall(function()
        targetted = game.Players.LocalPlayer.name
        data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
        if stack1 == true and data.Energy.Value > 8000000 and getgenv().dead == false then
            task.wait(1)
          

            game.workspace.Living[targetted].UpperTorso:Destroy()
            task.wait(5)
            local Remote = game.ReplicatedStorage.Package.Events['equipskill']
            local Arguments = {
                [1] = "Godly SSJ2"
            }
            Remote:InvokeServer(unpack(Arguments))
            local Remote = game.ReplicatedStorage.Package.Events['ta']
            i = 0
            repeat
                Remote:InvokeServer(unpack(Arguments))
                i = i + 1
                task.wait(.1)
            until i == 8
            task.wait()
            getgenv().stackneeded = false
            transformStatus = true
            autoFarmLoopRunning = true
            flying = false
            return transformStatus, autoFarmLoopRunning, flying
        elseif stack1 == false then
            getgenv().stackneeded = false
            transformStatus = true
            autoFarmLoopRunning = true
            flying = false
            return  transformStatus, autoFarmLoopRunning, flying
        elseif stack1 == true and data.Energy.Value < 8000000 then
            task.wait()
            getgenv().stackneeded = false
            transformStatus = true
            autoFarmLoopRunning = true
            flying = false
            return  transformStatus, autoFarmLoopRunning, flying
        end
    end)
end

pcall(function()
    task.wait()
    check1()

    repeat

        startgame()

    until game.workspace.Living[targetted]

end)
task.spawn(function()
pcall(function()
    local bb = game:service 'VirtualUser'
    game:service 'Players'.LocalPlayer.Idled:connect(function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
        task.wait(2)

    end)
end)
end)
sameplanet = true
SelectedQuests = ""
SelectedMobs = ""
local planet1 = ""

local function getQuest(switch1)
    switch1 = getgenv().switch1

    local checkValue = getCheckValue()

    local previousQuestName -- Variable to keep track of the previous quest's name for switch == 1
  

    for i, quest in ipairs(quests) do
        if checkValue >= quest.requiredValue and checkValue <= quest.endRange then
            currentQuestIndex = i

            if switch1 == 1 then

                SelectedQuests = quest.name
                SelectedMobs = quest.nickname
                planet1 = quest.planet

                return SelectedQuests, SelectedMobs, planet1 -- exit the loop if a quest is found
            elseif switch1 == 2 then
                if currentQuestIndex >= 2 then

                    for j = i - 1, 1, -1 do -- search for the previous quest
                        local prevQuest = quests[j]

                        if planet1 == prevQuest.planet then

                            SelectedQuests = prevQuest.name
                            SelectedMobs = prevQuest.nickname
                            sameplanet = true

                            return SelectedQuests, SelectedMobs, sameplanet -- exit the loop once the previous quest is found
                        else
                            sameplanet = false

                            SelectedQuests = quest.name
                            SelectedMobs = quest.nickname
                            return SelectedQuests, SelectedMobs, switch1, sameplanet
                        end
                    end

                elseif currentQuestIndex <= 1 then
                    SelectedQuests = quest.name
                    SelectedMobs = quest.nickname

                    return SelectedQuests, SelectedMobs, switch1
                end
                break -- exit the loop if a quest is found (could also remove this line if the loop should continue searching for quests)
            end

        end
    end

end
questneeded = false
-- Function
local attacks2 = {""}

-- Function
local attacks = {""}

local RebValue = ""

local rebirthOnJoin = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId].Rebirth.Value


task.spawn(function()
    while true and task.wait() do
        pcall(function()
            data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
            while true and task.wait() do
                task.wait()
                RebValue = data.Rebirth.Value
                if rebirthOnJoin ~= RebValue then
                   

                    local A_1 = "Earth"
                    local Event = game:GetService("ReplicatedStorage").Package.Events.TP

                    Event:InvokeServer(A_1)

                    task.wait()
                end
            end
        end)
    end
end)

task.spawn(function()
    while true and task.wait() do
        pcall(function()
local args = {
                [1] = true
            }
            game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
  game.Players.LocalPlayer.Status.Blocking.Value = true
      end)
    end
end)


questneeded = true
SelectedMobs1 = ""
getgenv().autostackloop = true
getgenv().stackneeded = true
-- main loop

while true do
    warn("in main loop")
    success1, err1 = pcall(function()
        task.wait()
        deadcheck(false)
        if getgenv().stackneeded == true then
            deadcheck(false)
            repeat
                task.wait()
                deadcheck(false)
            until getgenv().dead == false
            if getgenv().stackneeded == true then

                stack1 = true
                --autostack(stack1)
                repeat
                    success, err = pcall(function()
                        targetted = game.Players.LocalPlayer.name
                        data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
                        if stack1 == true and data.Energy.Value > 8000000 and getgenv().dead == false then
                            task.wait(1)
                
                            game.workspace.Living[targetted].UpperTorso:Destroy()
                            task.wait(5)
                            local Remote = game.ReplicatedStorage.Package.Events['equipskill']
                            local Arguments = {
                                [1] = "Godly SSJ2"
                            }
                            Remote:InvokeServer(unpack(Arguments))
                            local Remote = game.ReplicatedStorage.Package.Events['ta']
                            i = 0
                            repeat
                                Remote:InvokeServer(unpack(Arguments))
                                i = i + 1
                                task.wait(.1)
                            until i == 3
                            task.wait()
                            getgenv().stackneeded = false
                            transformStatus = true
                            autoFarmLoopRunning = true
                            flying = false
                            
                        elseif stack1 == false then
                            getgenv().stackneeded = false
                            transformStatus = true
                            autoFarmLoopRunning = true
                            flying = false
                            
                        elseif stack1 == true and data.Energy.Value < 8000000 then
                            task.wait()
                            getgenv().stackneeded = false
                            transformStatus = true
                            autoFarmLoopRunning = true
                            flying = false
                            
                        end
                    end)
                    if success then
                        warn("(1)Stack loop Function executed successfully with a value of " .. tostring(getgenv().stackneeded))
                        -- Access the result returned by the function
                        getgenv().stackneeded = false
                    else
                        warn("Error occurred:", err)
                        
                    end
                    task.wait()
                until getgenv().stackneeded == false
                deadcheck(true)
                getgenv().stackneeded = false
                questneeded = true
                autoFarmLoopRunning = true
            end
            
        end
        autoFarmLoopRunning = true
        getgenv().stackneeded = false
    end)
    getgenv().stackneeded = false
    if success1 then
        warn("(2)Stack loop Function executed successfully with a value of " .. tostring(getgenv().stackneeded))
        -- Access the result returned by the function
        
    else
        warn("Error occurred:", err1)
        
    end

warn("line 1100 quest status = " .. tostring(questneeded))
warn("line 1100 enter loop status status = " .. tostring(autoFarmLoopRunning))
    checkstackreq = getCheckValue()
    if checkstackreq < 8000000 then
        autoFarmLoopRunning = true
    end

    if getgenv().rebirthed == true and game.placeId == 5151400895 then
        task.wait(10)
check1()
        return

    elseif getgenv().rebirthed == true and game.placeId ~= 5151400895 then
        task.wait(3)
check1()
    end

    pcall(function()

        game.Workspace.Living:WaitForChild(targetted)
        game.Workspace.Living[targetted]:WaitForChild("HumanoidRootPart")

    end)

    if charge == false and getgenv().dead == false and autoFarmLoopRunning == true then

        task.spawn(function()
            while autoFarmLoopRunning do
                pcall(function()
                
                task.wait()
            end)
            end
        end)
        task.spawn(function()
            while autoFarmLoopRunning do
                pcall(function()
                    data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
                    local formtouse;

                    if transformStatus == true and game.Workspace.Living[targetted].Stats.Ki.Value > 300 and
                        game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId].Quest.Value ~=
                        "X Fighter Trainer" then

                        local value = getCheckValue()
                        local alignment = data.Allignment.Value
                        local forms = FormsList[alignment]
                        local Paidforms = PaidFormsList[alignment]

                        local matchFound = false 
                        local paidmatchFound = false

                        for _, form in ipairs(Paidforms) do
                            if value >= form.reqvalue and value <= form.endrangevalue and form.reqvalue >=
                                data.Rebirth.Value and form.formOwned == true then

                                formtouse = form.name
                                paidmatchFound = true 
                                break 
                            end

                        end

                        if paidmatchFound == false and isLoop1Active then
                            for _, form in ipairs(forms) do
                                if value >= form.reqvalue and value <= form.endrangevalue and form.reqvalue >=
                                    data.Rebirth.Value then
                                    formtouse = form.name
                                    matchFound = true 

                                    break 
                                end
                            end
                        end

                        if not matchFound and not paidmatchFound and isLoop1Active then
                            for _, form in ipairs(forms) do
                                if form.rebirthReq >= data.Rebirth.Value then
                                    formtouse = form.name
                                    break
                                end
                            end

                        end
                        equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
                        equipRemote:InvokeServer(formtouse)
                        repeat
                            task.wait()
                            if game.Players.LocalPlayer.Status.SelectedTransformation.Value ~=
                                game.Players.LocalPlayer.Status.Transformation.Value then
                                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
                            end
                        until game.Players.LocalPlayer.Status.SelectedTransformation.Value ==
                            game.Players.LocalPlayer.Status.Transformation.Value or
                            game.Workspace.Living[targetted].Stats.Ki.Value < 300
                    end

                end)
                task.wait(.5)
            end
        end)
        charge = true
    end

    if flying == false and getgenv().dead == false and autoFarmLoopRunning == true then
        success, err = pcall(function()

            game.Workspace.Living:WaitForChild(targetted)
            game.Workspace.Living[targetted]:WaitForChild("HumanoidRootPart")
            local bv = game.Workspace.Living[targetted].HumanoidRootPart:WaitForChild("BodyVelocity")
            local bg = game.Workspace.Living[targetted].HumanoidRootPart:WaitForChild("BodyGyro")
            

            bg.P = 1
            bg.MaxTorque = Vector3.new(500000, 500000, 500000)
            bv.P = 1
            bv.MaxForce = Vector3.new(100000, 100000, 100000)
            flying = true
        end)
        if success then
            warn("Fly Function executed successfully")
            -- Access the result returned by the function
            
        else
            warn("Error occurred:", err)
            
        end
    end

    if getgenv().dead == false and autoFarmLoopRunning == true then
       warn("entered if for auto farm loop")
        task.wait()

        
             success, err = pcall(function()
                while autoFarmLoopRunning do
                    task.wait()
                    check1()
                    local SelectedQuests, SelectedMobs, sameplanet;
                     success1, err1 = pcall(function()

                        while autoFarmLoopRunning do
                            if breakagain == true then
                                breakagain = false
                                break
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
                                    task.wait()
                                    local q;
                                    getgenv().switch1 = 1
                                    q = getgenv().switch1
                                    SelectedQuests, SelectedMobs, sameplanet = getQuest(q)

                                    if v.Name:lower() == SelectedMobs:lower() then

                                        local humanoid = v.Humanoid

                                        if humanoid then
                                            local currentState = humanoid:GetState()

                                            if currentState == Enum.HumanoidStateType.Dead then
                                                getgenv().switch1 = 2
                                                q = getgenv().switch1
                                                SelectedQuests, SelectedMobs, sameplanet = getQuest(q)

                                            end
                                        end
                                        break
                                    end
                                end
                            end

                            if string.len(game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId]
                                              .Quest.Value) <= 0 or questneeded == true then
                                
                                SelectedMobs1 = SelectedMobs

                                checkValue = getCheckValue()
                                if checkValue >= 150000000 and game.placeId ~= 5151400895 then
                                    SelectedQuests, SelectedMobs1 = "SSJG Kakata", "SSJG Kakata"
                                    local A_1 = "Vills Planet"
                                    local Event = game:GetService("ReplicatedStorage").Package.Events.TP
                                    Event:InvokeServer(A_1)
                                end

                                if game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId].Quest
                                    .Value ~= SelectedQuests and  isLoop1Active then 
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService(
                                                                                                     "Workspace").Others
                                                                                                     .NPCs[SelectedQuests]
                                                                                                     .HumanoidRootPart
                                                                                                     .CFrame
                                    repeat
                                        task.wait()

                                        game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(game:GetService(
                                                                                                       "Workspace").Others
                                                                                                       .NPCs[SelectedQuests])
                                    until game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId]
                                        .Quest.Value == SelectedQuests or
                                        game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                end -- undefine
                                
                            end

                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
                                    task.wait()

                                    if v.Name:lower() == SelectedMobs1:lower() and isLoop1Active and game.Players.LocalPlayer.Character and
                                        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                                        v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 or v.Name:lower() == "ssjg kakata" and SelectedMobs1:lower() == "ssjg kakata" then
                                        task.wait()
                                        if v.Name:lower() == "ssjg kakata" then
                                            repeat
                                                pcall(function()
                                                    if v.Humanoid.Health > 0 then
                                                        ssjgalive = true
                                                    end
                                                    end)
                                            wait()
                                            until ssjgalive == true
end
                                        
                                        questneeded = false
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart
                                                                                                         .CFrame +
                                                                                                         Vector3.new(0,
                                                0, 0)
                                        

                                        local Echar = v
                                        task.spawn(function()
                                            repeat

                                                local myChar = game.Players.LocalPlayer.Character
                                                
                                                myChar.HumanoidRootPart.CFrame =
                                                    Echar:GetPrimaryPartCFrame() * CFrame.new(0, 0, 5)

                                                task.wait()
                                            until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                        end)

                                        task.wait(0.2)
                                        local alignment = data.Allignment.Value
                                        if alignment == "Evil" then
                                            puntype = "Soul Punisher"
                                        else
                                            puntype = "Destruction"

                                        end
                                        repeat
                                            task.wait()
                                            
                                            if checkValue > 2100000 and game.Workspace.Living[targetted].Stats.Ki.Value >
                                                10000 then -- op move stack 1

                                                repeat
                                                   
                                                   
                                                        task.wait()
                                                        A_2 = "Blacknwhite27"
                                                        local spam = 0
                                                        repeat
                                                            task.spawn(function()
                                                        
                                                               
                                                        
                                                        for _, A_1 in ipairs(attacks2) do
                                                                      if isLoop1Active then
                                                            task.spawn(function()                                            
                                                                task.wait()
                                                                game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(
                                                                    A_1, A_2)
                                                            end) 
                                                            end
                                                            
                                                         
                                                        end
                                                        spam = spam + 1
                                                        wait(.1)
                                                    end) 
                                                    until spam == 10 or
                                                    game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                                    
                                                    
                                                    
                                                    

                                                    task.wait(0.3)
                                                until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                    game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
                                                    game.Workspace.Living[targetted].Stats.Ki.Value < 10000
                                            else
                                                task.spawn(function()
                                                    repeat
                                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer(
                                                            "Blacknwhite27", 1)
                                                        task.wait()
                                                    until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                        game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
                                                        game.Workspace.Living[targetted].Stats.Ki.Value > 10000 and
                                                        checkValue > 2100000

                                                end)

                                                repeat
                                                    if game.Workspace.Living[targetted].Stats.Ki.Value > 400 then

                                                        task.wait()
                                                        local Event =
                                                            game:GetService("ReplicatedStorage").Package.Events.mel
                                                        local A_2 = "Blacknwhite27"
                                                        task.spawn(function()
                                                            local A_1 = "Mach Kick"
                                                            Event:InvokeServer(A_1, A_2)

                                                        end)
                                                        task.spawn(function()
                                                            A_1 = "Energy Volley"
                                                            A_2 = {
                                                                ["FaceMouse"] = false,
                                                                ["MouseHit"] = CFrame.new(15932.0273, -12.8115005,
                                                                    15540.2061, 0.983303905, -0.0826973468, 0.162094966,
                                                                    0, 0.89077127, 0.454452157, -0.181971505,
                                                                    -0.446864575, 0.875898659)
                                                            }
                                                            A_3 = "Blacknwhite27"
                                                            Event =
                                                                game:GetService("ReplicatedStorage").Package.Events
                                                                    .voleys
                                                            Event:InvokeServer(A_1, A_2, A_3)

                                                        end)
                                                        task.wait(.3)
                                                    else

                                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer(
                                                            "Blacknwhite27", 1)

                                                        task.wait()

                                                    end
                                                    task.wait()
                                                until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                    game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
                                                    game.Workspace.Living[targetted].Stats.Ki.Value > 10000 and
                                                    checkValue > 2100000

                                            end
                                            task.wait()
                                        until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                            game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                            
                                        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
                                            getgenv().stackneeded = true
                                            getgenv().dead = true
                                            autoFarmLoopRunning = false
                                            flying = false
                                            charge = false
                                            questneeded = true

                                        end
                                        breakagain = true
                                        break
                                    end

                                end
                            else
                                questneeded = true
                            end
                            task.wait()
                        end
                    end)
                    if success1 then
                        warn("Function executed successfully")
                       
                        
                    else
                        warn("Error occurred:", err1)
                        questneeded = true
                    end
                end
            
            end)
            if success then
                warn("Function executed successfully")
                
                
            else
                warn("Error occurred:", err)
                questneeded = true
            end
            task.wait()
        
        
    end
end
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
    task.wait()
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
            task.wait(.1)
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
            task.wait(0.4)
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
        task.wait(0.4)
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
        task.wait(0.3)
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
                        if ldata.Quest.Value ~= "" and ldata.Strength.Value > 40000 and ldata.Energy.Value > 40000 and ldata.Defense.Value > 40000 and ldata.Speed.Value > 40000 then
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
        task.wait(.1) -- Aumentar la espera entre iteraciones principales para reducir la frecuencia de ejecuciÃ³n
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
