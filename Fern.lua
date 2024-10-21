-- Utility Functions
local function safeCall(func)
    local success, err = pcall(func)
    if not success then
        warn("Error: " .. tostring(err))
    end
end

local function saveToJSON(fileName, data)
    safeCall(function()
        local jsonData = game:GetService("HttpService"):JSONEncode(data)
        writefile(fileName, jsonData)
    end)
end

local function loadFromJSON(fileName)
    local result = nil
    safeCall(function()
        if isfile(fileName) then
            local jsonData = readfile(fileName)
            result = game:GetService("HttpService"):JSONDecode(jsonData)
        end
    end)
    return result
end

local function deleteJSON(fileName)
    safeCall(function()
        if isfile(fileName) then
            delfile(fileName)
        end
    end)
end

-- Configuration Settings
local settingsFileName = "WaitTimeConfig.json"
local waitTime = 4
local savedSettings = loadFromJSON(settingsFileName)
if savedSettings and savedSettings.waitTime then
    waitTime = savedSettings.waitTime
end

-- Show Configuration Menu
local function showConfigMenu()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local PlayerGui = player:WaitForChild("PlayerGui")

    local screenGui = Instance.new("ScreenGui", PlayerGui)
    screenGui.Name = "ConfigMenu"
    screenGui.ResetOnSpawn = false

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 200, 0, 150)
    frame.Position = UDim2.new(0.5, -100, 0.5, -75)
    frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    frame.BackgroundTransparency = 0.3
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.new(1, 1, 1)

    local titleLabel = Instance.new("TextLabel", frame)
    titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Tiempo de Espera al llegar ah bills recomendado 3.5/3.9/4/3.8/3.3] dependiendo cuanto demora  tu esploit en aparecer :3"
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 9

    local inputBox = Instance.new("TextBox", frame)
    inputBox.Size = UDim2.new(0.8, 0, 0.2, 0)
    inputBox.Position = UDim2.new(0.1, 0, 0.4, 0)
    inputBox.PlaceholderText = "Tiempo de Espera (segundos)"
    inputBox.Text = tostring(waitTime)
    inputBox.TextColor3 = Color3.new(0, 0, 0)
    inputBox.BackgroundColor3 = Color3.new(1, 1, 1)
    inputBox.Font = Enum.Font.SourceSans
    inputBox.TextSize = 14

    local confirmButton = Instance.new("TextButton", frame)
    confirmButton.Size = UDim2.new(0.6, 0, 0.2, 0)
    confirmButton.Position = UDim2.new(0.2, 0, 0.7, 0)
    confirmButton.Text = "Confirmar"
    confirmButton.TextColor3 = Color3.new(1, 1, 1)
    confirmButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    confirmButton.Font = Enum.Font.SourceSansBold
    confirmButton.TextSize = 14

    confirmButton.MouseButton1Click:Connect(function()
        local userInput = tonumber(inputBox.Text)
        if userInput and userInput > 0 then
        
            waitTime = userInput
            saveToJSON(settingsFileName, {waitTime = waitTime})
            screenGui:Destroy()
            print("Tiempo de espera configurado a: " .. waitTime .. " segundos.")
            safeCall(executeScript)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Fer2.lua"))() 
        else
            print("Por favor, ingresa un número válido mayor que 0.")
        end
    end)
end

-- Create Reset Button
local function createResetButton()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local PlayerGui = player:WaitForChild("PlayerGui")
    local existingGui = PlayerGui:FindFirstChild("ResetConfigMenu")
    
    if not existingGui then
        local resetGui = Instance.new("ScreenGui", PlayerGui)
        resetGui.Name = "ResetConfigMenu"
        resetGui.ResetOnSpawn = false

        local resetButton = Instance.new("TextButton", resetGui)
        resetButton.Size = UDim2.new(0, 100, 0, 40)
        resetButton.Position = UDim2.new(0.5, -50, 0.5, 100)
        resetButton.Text = "Time.Godly: " .. tostring(waitTime) .. "s"
        resetButton.TextColor3 = Color3.new(1, 1, 1)
        resetButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        resetButton.Font = Enum.Font.SourceSansBold
        resetButton.TextSize = 14

        local uicorner = Instance.new("UICorner", resetButton)
        uicorner.CornerRadius = UDim.new(0, 20)

        resetButton.MouseButton1Click:Connect(function()
            safeCall(function()
                deleteJSON(settingsFileName)
                resetGui:Destroy()
                print("Tiempo de espera eliminado. Por favor, configura un nuevo tiempo.")
                showConfigMenu()
            end)
        end)
    end
end

-- Execute Script
local function executeScript()
    -- Crear el botón de reset antes de ejecutar el script principal
    createResetButton()

    safeCall(function()
        if game.PlaceId == 5151400895 then
            local player = game.Players.LocalPlayer
            local data = game.ReplicatedStorage.Datas[player.UserId]
            if data.Strength.Value >= 8000000 then
                wait(waitTime)
                game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Godly SSJ2")
                wait(1)
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            end
            wait(.01)
        end
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Fer2.lua"))()
    end)
end

-- Main Execution
safeCall(function()
    if savedSettings and savedSettings.waitTime then
        print("Tiempo de espera cargado: " .. waitTime .. " segundos.")
        executeScript()
    else
        showConfigMenu()
    end
end)
