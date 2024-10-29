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
    "123daishinkan", "ItzSebaGod", "alexisetter2008", "AlejandroItzi", 
    "TheFinal126", "0oAKILESo0", "brxxn_sl", "GOKUVSJJJ", 
    "xxXDarknessRisingXxx", "ryu_krs", "mattz678", "FreireBG", 
    "Fernanflop093o", "Gotenks_129", "InFeRnUsKaSlO", "mattz678",
    "DEMONZTSB", "rodri2020proxd", "SAHID_YT6792", "FreireBG", 
    "Flux_chog", "robloxesmuymalo2020", "Freire69", "furia3476", 
    "SuperPato0319", "andygamer012345", "Crocrakxer246", 
    "fernando_snake", "R4T4TOPP0", "Gotenks_129", "juancarlosvillo", 
    "CR7_CHAMPIOSN", "FrivUpd", "kayoolicool", "wellington19800", 
    "maisde8milksks", "frandeli0101", "gokumalvado1234", 
    "cepeer_minecratf", "SEBAS_LAPAJ", "santiago123337pro",
    "Thamersad172", "yere0303", "Ocami7", "jesusxdgggg", 
    "JAVIER_ROBLOX", "angente6real6", "Jefflop2002", "leonardi4133", 
    "CRACKLITOS_ROBLOX", "luisgamey28267", "Turufo_1", 
    "aTUJUAN", "ALT_garou11", "BETOKILLER15", "frost123337", 
    "Kasenli", "FACHERITO_XD9"
}

local quests = {
    { name = "X Fighter Trainer", nickname = "X Fighter", requiredValue = 0, endRange = 20000 },
    { name = "Kid Nohag", nickname = "Kid Nohag", requiredValue = 20000, endRange = 1000000008867676089868 },
}

local function isPlayerAllowed(name)
    for _, allowedName in ipairs(allowedPlayers) do
        if name == allowedName then
            return true
        end
    end
    return false
end

local function target()
    local playerName = player.Name
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
        task.wait()
    until game.workspace.Living[targetted]

    local values = {
        Strength = data.Strength.Value,
        Energy = data.Energy.Value,
        Defense = data.Defense.Value,
        Speed = data.Speed.Value
    }

    local smallest = math.min(values.Strength, values.Energy, values.Defense, values.Speed)
    checkValue = smallest
    print("check value is " .. checkValue)
    print("The smallest number is: " .. smallest)

    for _, quest in ipairs(quests) do
        if checkValue >= quest.requiredValue and checkValue <= quest.endRange then
            print("Quest " .. quest.name .. " has a required value between " .. quest.requiredValue .. " and " .. quest.endRange)
            SelectedQuests = quest.name
            SelectedMobs = quest.nickname
        end
    end

    if firstquest then
        lastquest = SelectedQuests
        firstquest = false
    end

    if autostack and checkValue > 8000 then
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
    if game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value ~= SelectedQuests and isLoop6Active then
        player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Others.NPCs[SelectedQuests].HumanoidRootPart.CFrame
        repeat
            task.wait(0.1)
            events.Qaction:InvokeServer(game:GetService("Workspace").Others.NPCs[SelectedQuests])
        until game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value == SelectedQuests
    end
end

spawn(function()
    while true do
        pcall(function()
            autoquest(autostack)
            quest()
            task.wait(1)
        end)
    end
end)
