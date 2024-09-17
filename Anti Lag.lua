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

local Stuff = {}
local function processAsset(v)
    if ToDisable.Parts and (v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart")) then
        v.Material = Enum.Material.SmoothPlastic
        table.insert(Stuff, 1, v)
    end

    if ToDisable.Particles and (v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire")) then
        v.Enabled = false
        table.insert(Stuff, 1, v)
    end

    if ToDisable.VisualEffects and (v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect")) then
        v.Enabled = false
        table.insert(Stuff, 1, v)
    end

    if ToDisable.Textures and (v:IsA("Decal") or v:IsA("Texture")) then
        v.Texture = ""
        table.insert(Stuff, 1, v)
    end

    if ToDisable.Sky and v:IsA("Sky") then
        v.Parent = nil
        table.insert(Stuff, 1, v)
    end
end

-- Process each descendant
for _, v in next, game:GetDescendants() do
    processAsset(v)
end

game:GetService("TestService"):Message("Effects Disabler Script : Successfully disabled " .. #Stuff .. " assets / effects. Settings :")

for i, v in next, ToDisable do
    print(tostring(i) .. ": " .. tostring(v))
end

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