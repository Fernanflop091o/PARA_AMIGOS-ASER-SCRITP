	loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Prueba3.lua"))()

local Players = game:GetService("Players")

-- Función para proteger el Character del jugador
local function protectCharacter(player)
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        -- Redefinir el método de ajuste de salud para prevenir la muerte
        local originalHealth = humanoid.Health
        function humanoid:SetStateEnabled(state, enabled)
            if state == Enum.HumanoidStateType.Dead and not enabled then
                -- Prevenir la muerte
                humanoid.Health = originalHealth
            else
                humanoide:SetStateEnabled(state, enabled)
            end
        end
    end
    
    -- Redefinir el método de destrucción del Character
    character.AncestryChanged:Connect(function(_, parent)
        if parent == nil then
            -- Prevenir la destrucción del Character
            player.Character = Instance.new("Model")
        end
    end)
end

-- Aplicar la protección a todos los jugadores al unirse al juego
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        protectCharacter(player)
    end)
end)

-- Aplicar la protección a los jugadores que ya están en el juego
for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        protectCharacter(player)
    end
end
