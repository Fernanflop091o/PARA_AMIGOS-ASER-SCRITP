loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/CONNOMETRO.lua"))()
               
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local hasPrintedError = false

local function safeCall(func)
    local success, err = pcall(func)
    if not success and not hasPrintedError then
        warn("Error: " .. tostring(err))
        hasPrintedError = true
    end
end

local function clearEffects(character)
safeCall(function()
        if character then
            for _, obj in pairs(character:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                    if not obj.Name:lower():find("line") then
                        print("Eliminando: " .. obj.Name .. " de tipo: " .. obj.ClassName)
                        obj:Destroy()
                    end
                elseif obj:IsA("Sound") then
                    print("Eliminando: " .. obj.Name .. " de tipo: " .. obj.ClassName)
                    obj:Destroy()
                end
            end
        end
    end)
end

local function convertToDuck(character)
    safeCall(function()
        if character and character:FindFirstChild("HumanoidRootPart") then
            -- Eliminar sombreros o accesorios
            for _, v in pairs(character:GetChildren()) do
                if v:IsA("Hat") or v:IsA("Accessory") then
                    v:Destroy()
                end
            end

            
            local duckMesh = Instance.new("SpecialMesh")
            duckMesh.MeshType = Enum.MeshType.FileMesh
            duckMesh.MeshId = "http://www.roblox.com/asset/?id=9419831" -- ID del mesh del pato
            duckMesh.TextureId = "http://www.roblox.com/asset/?id=9419827" -- ID de la textura del pato
            duckMesh.Scale = Vector3.new(5, 5, 5) -- Escala del pato
            duckMesh.Parent = character.HumanoidRootPart

            
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = 1
                end
            end
            character.HumanoidRootPart.Transparency = 0
        end
    end)
end


local function onCharacterAdded(character)
    clearEffects(character)
    convertToDuck(character)
end

if player.Character then
    safeCall(function()
        onCharacterAdded(player.Character)
    end)
end


player.CharacterAdded:Connect(onCharacterAdded)


local questGui = player.PlayerGui:FindFirstChild("Main")
                and player.PlayerGui.Main:FindFirstChild("MainFrame")
                and player.PlayerGui.Main.MainFrame:FindFirstChild("Frames")
                and player.PlayerGui.Main.MainFrame.Frames:FindFirstChild("Quest")
if questGui then
    safeCall(function()
        questGui.Parent = ReplicatedStorage
    end)
end

spawn(function()
    while true do
        safeCall(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and player.Character:FindFirstChild("HumanoidRootPart") then
                clearEffects(player.Character)
                convertToDuck(player.Character)
            end
        end)
        wait(.01)
    end
end)
