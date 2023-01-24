local Tinkr = ...

local Bastion = {
    DebugMode = false
}
Bastion.__index = Bastion

function Bastion.require(class)
    return Tinkr:require("scripts/bastion/src/" .. class .. "/" .. class, Bastion)
end

Bastion.ClassMagic = Bastion.require("ClassMagic")
Bastion.List = Bastion.require("List")
Bastion.NotificationsList, Bastion.Notification = Bastion.require("NotificationsList")
Bastion.Vector3 = Bastion.require("Vector3")
Bastion.Command = Bastion.require("Command")
Bastion.Cache = Bastion.require("Cache")
Bastion.Cacheable = Bastion.require("Cacheable")
Bastion.Refreshable = Bastion.require("Refreshable")
Bastion.Unit = Bastion.require("Unit")
Bastion.Aura = Bastion.require("Aura")
Bastion.APL, Bastion.APLActor, Bastion.APLTrait = Bastion.require("APL")
Bastion.Module = Bastion.require("Module")
Bastion.UnitManager = Bastion.require("UnitManager"):New()
Bastion.ObjectManager = Bastion.require("ObjectManager"):New()
Bastion.EventManager = Bastion.require("EventManager"):New()
Bastion.Spell = Bastion.require("Spell")
Bastion.SpellBook = Bastion.require("SpellBook"):New()
Bastion.Item = Bastion.require("Item")
Bastion.ItemBook = Bastion.require("ItemBook"):New()
Bastion.AuraTable = Bastion.require("AuraTable")
Bastion.Class = Bastion.require("Class")
Bastion.Timer = Bastion.require("Timer")
Bastion.CombatTimer = Bastion.Timer:New('combat')
Bastion.MythicPlusUtils = Bastion.require("MythicPlusUtils"):New()
Bastion.Notifications = Bastion.NotificationsList:New()

Bastion.modules = {}
Bastion.Enabled = false

Bastion.EventManager:RegisterWoWEvent('UNIT_AURA', function(unit, auras)
    local u = Bastion.UnitManager[unit]

    u:GetAuras():OnUpdate(auras)
end)

Bastion.EventManager:RegisterWoWEvent("UNIT_SPELLCAST_SUCCEEDED", function(...)
    local unit, castGUID, spellID = ...

    local spell = Bastion.SpellBook:GetIfRegistered(spellID)

    if unit == "player" and spell then
        spell.lastCastAt = GetTime()

        if spell:GetPostCastFunction() then
            spell:GetPostCastFunction()(spell)
        end
    end
end)

Bastion.Ticker = C_Timer.NewTicker(0.1, function()
    if not Bastion.CombatTimer:IsRunning() and UnitAffectingCombat("player") then
        Bastion.CombatTimer:Start()
    elseif Bastion.CombatTimer:IsRunning() and not UnitAffectingCombat("player") then
        Bastion.CombatTimer:Reset()
    end

    if Bastion.Enabled then
        Bastion.ObjectManager:Refresh()
        for i = 1, #Bastion.modules do
            Bastion.modules[i]:Tick()
        end
    end
end)

function Bastion:Register(module)
    table.insert(Bastion.modules, module)
    Bastion:Print("Registered", module)
end

-- Find a module by name
function Bastion:FindModule(name)
    for i = 1, #Bastion.modules do
        if Bastion.modules[i].name == name then
            return Bastion.modules[i]
        end
    end

    return nil
end

function Bastion:Print(...)
    local args = { ... }
    local str = "|cFFDF362D[Bastion]|r |cFFFFFFFF"
    for i = 1, #args do
        str = str .. tostring(args[i]) .. " "
    end
    print(str)
end

function Bastion:Debug(...)
    if not Bastion.DebugMode then
        return
    end
    local args = { ... }
    local str = "|cFFDF6520[Bastion]|r |cFFFFFFFF"
    for i = 1, #args do
        str = str .. tostring(args[i]) .. " "
    end
    print(str)
end

local Command = Bastion.Command:New('bastion')

Command:Register('toggle', 'Toggle bastion on/off', function()
    Bastion.Enabled = not Bastion.Enabled
    if Bastion.Enabled then
        Bastion:Print("Enabled")
    else
        Bastion:Print("Disabled")
    end
end)

Command:Register('debug', 'Toggle debug mode on/off', function()
    Bastion.DebugMode = not Bastion.DebugMode
    if Bastion.DebugMode then
        Bastion:Print("Debug mode enabled")
    else
        Bastion:Print("Debug mode disabled")
    end
end)

Command:Register('dumpspells', 'Dump spells to a file', function()
    local i = 1
    local rand = math.random(100000, 999999)
    while true do
        local spellName, spellSubName = GetSpellBookItemName(i, BOOKTYPE_SPELL)
        if not spellName then
            do break end
        end

        -- use spellName and spellSubName here
        local spellID = select(7, GetSpellInfo(spellName))

        if spellID then
            WriteFile('bastion-' .. UnitClass('player') .. '-' .. rand .. '.lua',
                "local " .. spellName .. " = Bastion.SpellBook:GetSpell(" .. spellID .. ")", true)
        end
        i = i + 1
    end
end)

Command:Register('module', 'Toggle a module on/off', function(args)
    local module = Bastion:FindModule(args[2])
    if module then
        module:Toggle()
        if module.enabled then
            Bastion:Print("Enabled", module.name)
        else
            Bastion:Print("Disabled", module.name)
        end
    else
        Bastion:Print("Module not found")
    end
end)

Command:Register('mplus', 'Toggle m+ module on/off', function(args)
    local cmd = args[2]
    if cmd == 'debuffs' then
        Bastion.MythicPlusUtils:ToggleDebuffLogging()
        Bastion:Print("Debuff logging", Bastion.MythicPlusUtils.debuffLogging and "enabled" or "disabled")
        return
    end

    Bastion:Print("[MythicPlusUtils] Unknown command")
    Bastion:Print("Available commands:")
    Bastion:Print("debuffs")
end)

local files = ListFiles("scripts/bastion/scripts")

for i = 1, #files do
    local file = files[i]
    if file:sub(-4) == ".lua" or file:sub(-5) == '.luac' then
        Tinkr:require("scripts/bastion/scripts/" .. file:sub(1, -5), Bastion)
    end
end
