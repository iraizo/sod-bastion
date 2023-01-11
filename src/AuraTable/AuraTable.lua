local Tinkr, Bastion = ...

-- Create a new AuraTable class
local AuraTable = {}
AuraTable.__index = AuraTable

local function tsize(t)
    local keys = {}
    for k, v in pairs(t) do
        table.insert(keys, k)
    end
    return keys[#keys]
end

-- Constructor
function AuraTable:New(unit)
    local self = setmetatable({}, AuraTable)

    self.unit = unit
    self.auras = {}

    self.playerAuras = {}
    self.guid = unit:GetGUID()
    self.instanceIDLookup = {}

    return self
end

function AuraTable:OnUpdate(auras)
    local isFullUpdate = auras.isFullUpdate

    if isFullUpdate then
        self:Update()
        return
    end

    local removedAuras = auras.removedAuraInstanceIDs
    local addedAuras = auras.addedAuras
    local updatedAuras = auras.updatedAuraInstanceIDs

    -- Add auras
    if addedAuras and #addedAuras > 0 then
        for i = 1, #addedAuras do
            local aura = Bastion.Aura:CreateFromUnitAuraInfo(addedAuras[i])

            self:AddOrUpdateAuraInstanceID(aura:GetAuraInstanceID(), aura)
        end
    end

    -- DevTools_Dump(addedAuras)
    if updatedAuras and #updatedAuras > 0 then
        for i = 1, #updatedAuras do
            local id = updatedAuras[i]
            local newAura = C_UnitAuras_GetAuraDataByAuraInstanceID(self.unit.unit, id);
            if newAura then
                local aura = Bastion.Aura:CreateFromUnitAuraInfo(newAura)
                self:AddOrUpdateAuraInstanceID(aura:GetAuraInstanceID(), aura)
            end
        end
    end

    -- Remove auras
    if removedAuras and #removedAuras > 0 then
        for i = 1, #removedAuras do
            self:RemoveInstanceID(removedAuras[i])
        end
    end
end

function AuraTable:RemoveInstanceID(instanceID)
    if not self.instanceIDLookup[instanceID] then
        return
    end

    local id = self.instanceIDLookup[instanceID]

    if self.playerAuras[id] and self.playerAuras[id][instanceID] then
        self.playerAuras[id][instanceID] = nil
        self.instanceIDLookup[instanceID] = nil
        return
    end

    if self.auras[id] and self.auras[id][instanceID] then
        self.auras[id][instanceID] = nil
        self.instanceIDLookup[instanceID] = nil
        return
    end
end

function AuraTable:AddOrUpdateAuraInstanceID(instanceID, aura)
    local spellId = aura:GetSpell():GetID()

    self.instanceIDLookup[instanceID] = spellId

    if Bastion.UnitManager['player']:IsUnit(aura:GetSource()) then
        if not self.playerAuras[spellId] then
            self.playerAuras[spellId] = {}
        end

        self.playerAuras[spellId][instanceID] = aura
    else
        if not self.auras[spellId] then
            self.auras[spellId] = {}
        end

        self.auras[spellId][instanceID] = aura
    end
end

-- Get a units buffs
function AuraTable:GetUnitBuffs()
    AuraUtil_ForEachAura(self.unit.unit, 'HELPFUL', nil, function(a)
        local aura = Bastion.Aura:CreateFromUnitAuraInfo(a)

        if aura:IsValid() then
            self:AddOrUpdateAuraInstanceID(aura:GetAuraInstanceID(), aura)
        end
    end, true)
end

-- Get a units debuffs
function AuraTable:GetUnitDebuffs()
    AuraUtil_ForEachAura(self.unit.unit, 'HARMFUL', nil, function(a)
        local aura = Bastion.Aura:CreateFromUnitAuraInfo(a)

        if aura:IsValid() then
            self:AddOrUpdateAuraInstanceID(aura:GetAuraInstanceID(), aura)
        end
    end, true)
end

-- Update auras
function AuraTable:Update()
    print("Updating auras for " .. tostring(self.unit))
    self:Clear()
    -- self.lastUpdate = GetTime()

    self:GetUnitBuffs()
    self:GetUnitDebuffs()

    -- self.auras = self.auras
    -- self.playerAuras = self.playerAuras
end

-- Get a units auras
function AuraTable:GetUnitAuras()
    if not self.did then
        self.did = true
        self:Update()
    end
    -- For token units, we need to check if the GUID has changed
    if self.unit:GetGUID() ~= self.guid then
        self.guid = self.unit:GetGUID()
        self:Update()
        return self.auras
    end

    -- -- Cache the auras for the unit so we don't have to query the API every time we want to check if the unit has a specific aura or not
    -- -- If it's less than .4  seconds since the last time we queried the API, return the cached auras
    -- if self.lastUpdate and GetTime() - self.lastUpdate < 0.5 then
    --     return self.auras
    -- end

    -- self:Update()
    return self.auras
end

-- Get a units auras
function AuraTable:GetMyUnitAuras()
    if not self.did then
        self.did = true
        self:Update()
    end
    -- For token units, we need to check if the GUID has changed
    if self.unit:GetGUID() ~= self.guid then
        self.guid = self.unit:GetGUID()
        self:Update()
        return self.playerAuras
    end

    -- -- Cache the auras for the unit so we don't have to query the API every time we want to check if the unit has a specific aura or not
    -- -- If it's less than .4  seconds since the last time we queried the API, return the cached auras
    -- if self.lastUpdate and GetTime() - self.lastUpdate < 0.5 then
    --     return self.playerAuras
    -- end

    -- self:Update()
    return self.playerAuras
end

-- Clear the aura table
function AuraTable:Clear()
    self.auras = {}
    self.playerAuras = {}
    self.instanceIDLookup = {}
end

-- Check if the unit has a specific aura
function AuraTable:Find(spell)
    local auras = self:GetUnitAuras()
    local aurasub = auras[spell:GetID()]

    if not aurasub then
        return Bastion.Aura:New()
    end

    for k, a in pairs(aurasub) do
        if a ~= nil then
            if a:IsUp() then -- Handle expired and non refreshed dropoffs not coming in UNIT_AURA
                return a
            else
                self:RemoveInstanceID(a:GetAuraInstanceID())
            end
        end
    end

    return Bastion.Aura:New()
end

function AuraTable:FindMy(spell)
    local aurasub = self.playerAuras[spell:GetID()]

    if not aurasub then
        return Bastion.Aura:New()
    end

    for k, a in pairs(aurasub) do
        if a ~= nil then
            if a:IsUp() then -- Handle expired and non refreshed dropoffs not coming in UNIT_AURA
                return a
            else
                self:RemoveInstanceID(a:GetAuraInstanceID())
            end
        end
    end

    return Bastion.Aura:New()
end

-- Has any stealable aura
function AuraTable:HasAnyStealableAura()
    for _, auras in pairs(self:GetUnitAuras()) do
        for _, aura in pairs(auras) do
            if aura:IsUp() then -- Handle expired and non refreshed dropoffs not coming in UNIT_AURA
                if aura:GetIsStealable() then
                    return true
                end
            else
                self:RemoveInstanceID(aura:GetAuraInstanceID())
            end
        end
    end

    return false
end

-- Has any dispelable aura
function AuraTable:HasAnyDispelableAura(spell)
    for _, auras in pairs(self:GetUnitAuras()) do
        for _, aura in pairs(auras) do
            if aura:IsUp() then -- Handle expired and non refreshed dropoffs not coming in UNIT_AURA
                if aura:IsDebuff() and aura:IsDispelableBySpell(spell) then
                    return true
                end
            else
                self:RemoveInstanceID(aura:GetAuraInstanceID())
            end
        end
    end

    return false
end

return AuraTable
