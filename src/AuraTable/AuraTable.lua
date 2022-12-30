local Tinkr, Bastion = ...

-- Create a new AuraTable class
local AuraTable = {}
AuraTable.__index = AuraTable

-- Constructor
function AuraTable:New(unit)
    local self = setmetatable({}, AuraTable)

    self.unit = unit
    self.buffs = {}
    self.debuffs = {}
    self.auras = {}

    -- Our player is usually the most important unit, so we cache the auras for it
    self.playerAppliedBuffs = {}
    self.playerAppliedDebuffs = {}
    self.playerAuras = {}
    self.guid = unit:GetGUID()

    Bastion.EventManager:RegisterWoWEvent('UNIT_AURA', function(unit, auras)
        local u = Bastion.UnitManager[unit]

        if not self.unit:IsUnit(unit) then
            return
        end

        local addedAuras = auras.addedAuras

        if #addedAuras > 0 then
            for i = 1, #addedAuras do
                local aura = Bastion.Aura:CreateFromUnitAuraInfo(addedAuras[i])
                if aura:IsBuff() then
                    if aura:GetSource():Exists() and aura:GetSource():IsUnit(Bastion.UnitManager['player']) then
                        if not self.playerAppliedBuffs[aura:GetSpell():GetID()] then
                            self.playerAppliedBuffs[aura:GetSpell():GetID()] = {}
                        end
                        table.insert(self.playerAppliedBuffs[aura:GetSpell():GetID()], aura)
                    else
                        if not self.buffs[aura:GetSpell():GetID()] then
                            self.buffs[aura:GetSpell():GetID()] = {}
                        end
                        table.insert(self.buffs[aura:GetSpell():GetID()], aura)
                    end
                else
                    if aura:GetSource():Exists() and aura:GetSource():IsUnit(Bastion.UnitManager['player']) then
                        if not self.playerAppliedDebuffs[aura:GetSpell():GetID()] then
                            self.playerAppliedDebuffs[aura:GetSpell():GetID()] = {}
                        end
                        table.insert(self.playerAppliedDebuffs[aura:GetSpell():GetID()], aura)
                    else
                        if not self.debuffs[aura:GetSpell():GetID()] then
                            self.debuffs[aura:GetSpell():GetID()] = {}
                        end
                        table.insert(self.debuffs[aura:GetSpell():GetID()], aura)
                    end
                end
            end
        end
    end)

    return self
end

-- Get a units buffs
function AuraTable:GetUnitBuffs()
    for i = 1, 40 do
        local aura = Bastion.Aura:New(self.unit, i, 'HELPFUL')
        if aura:IsValid() then
            if aura:GetSource():Exists() and aura:GetSource():IsUnit(Bastion.UnitManager['player']) then
                if not self.playerAppliedBuffs[aura:GetSpell():GetID()] then
                    self.playerAppliedBuffs[aura:GetSpell():GetID()] = {}
                end
                table.insert(self.playerAppliedBuffs[aura:GetSpell():GetID()], aura)
            else
                if not self.buffs[aura:GetSpell():GetID()] then
                    self.buffs[aura:GetSpell():GetID()] = {}
                end
                table.insert(self.buffs[aura:GetSpell():GetID()], aura)
            end
        end
    end
end

-- Get a units debuffs
function AuraTable:GetUnitDebuffs()
    for i = 1, 40 do
        local aura = Bastion.Aura:New(self.unit, i, 'HARMFUL')
        if aura:IsValid() then
            if aura:GetSource():Exists() and aura:GetSource():IsUnit(Bastion.UnitManager['player']) then
                if not self.playerAppliedDebuffs[aura:GetSpell():GetID()] then
                    self.playerAppliedDebuffs[aura:GetSpell():GetID()] = {}
                end
                table.insert(self.playerAppliedDebuffs[aura:GetSpell():GetID()], aura)
            else
                if not self.debuffs[aura:GetSpell():GetID()] then
                    self.debuffs[aura:GetSpell():GetID()] = {}
                end
                table.insert(self.debuffs[aura:GetSpell():GetID()], aura)
            end
        end
    end
end

local function merge(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                merge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

-- Update auras
function AuraTable:Update()
    self:Clear()
    self.lastUpdate = GetTime()

    self:GetUnitBuffs()
    self:GetUnitDebuffs()
    self.auras = merge(self.buffs, self.debuffs)
    self.playerAuras = merge(self.playerAppliedBuffs, self.playerAppliedDebuffs)
end

-- Get a units auras
function AuraTable:GetUnitAuras()
    -- For token units, we need to check if the GUID has changed
    if self.unit:GetGUID() ~= self.guid then
        self.guid = self.unit:GetGUID()
        self:Update()
        return self.auras
    end

    -- Cache the auras for the unit so we don't have to query the API every time we want to check if the unit has a specific aura or not
    -- If it's less than .4  seconds since the last time we queried the API, return the cached auras
    if self.lastUpdate and GetTime() - self.lastUpdate < 0.5 then
        return self.auras
    end

    self:Update()
    return self.auras
end

-- Get a units auras
function AuraTable:GetMyUnitAuras()
    -- For token units, we need to check if the GUID has changed
    if self.unit:GetGUID() ~= self.guid then
        self.guid = self.unit:GetGUID()
        self:Update()
        return self.playerAuras
    end

    -- Cache the auras for the unit so we don't have to query the API every time we want to check if the unit has a specific aura or not
    -- If it's less than .4  seconds since the last time we queried the API, return the cached auras
    if self.lastUpdate and GetTime() - self.lastUpdate < 0.5 then
        return self.playerAuras
    end

    self:Update()
    return self.playerAuras
end

-- Clear the aura table
function AuraTable:Clear()
    self.buffs = {}
    self.debuffs = {}
    self.auras = {}
    self.playerAppliedBuffs = {}
    self.playerAppliedDebuffs = {}
    self.playerAuras = {}
end

-- Check if the unit has a specific aura
function AuraTable:Find(spell)
    local auras = self:GetUnitAuras()
    local aura = auras[spell:GetID()]

    if aura then
        return aura[1]
    end

    return Bastion.Aura:New()
end

function AuraTable:FindMy(spell)
    local auras = self:GetMyUnitAuras()
    local aura = auras[spell:GetID()]

    if aura then
        return aura[1]
    end

    return Bastion.Aura:New()
end

-- Has any stealable aura
function AuraTable:HasAnyStealableAura()
    for _, auras in pairs(self:GetUnitAuras()) do
        for _, aura in pairs(auras) do
            if aura:GetIsStealable() then
                return true
            end
        end
    end

    return false
end

-- Has any dispelable aura
function AuraTable:HasAnyDispelableAura(spell)
    for _, auras in pairs(self:GetUnitAuras()) do
        for _, aura in pairs(auras) do
            if aura:IsDebuff() and aura:IsDispelableBySpell(spell) then
                return true
            end
        end
    end

    return false
end

return AuraTable
