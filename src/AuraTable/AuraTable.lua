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
    self.buffs = {}
    self.debuffs = {}
    self.auras = {}

    -- Our player is usually the most important unit, so we cache the auras for it
    self.playerAppliedBuffs = {}
    self.playerAppliedDebuffs = {}
    self.playerAuras = {}
    self.guid = unit:GetGUID()
    self.instanceIDLookup = {}

    Bastion.EventManager:RegisterWoWEvent('UNIT_AURA', function(unit, auras)
        local u = Bastion.UnitManager[unit]

        if not self.unit:IsUnit(u) then
            return
        end


        local isFullUpdate = auras.isFullUpdate

        if isFullUpdate then
            self:Update()
            print("Full update requested for " .. unit)
            return
        end

        local addedAuras = auras.addedAuras
        local removedAuras = auras.removedAuraInstanceIDs
        local updatedAuras = auras.updatedAuraInstanceIDs

        -- DevTools_Dump(addedAuras)
        if updatedAuras and #updatedAuras > 0 then
            for i = 1, #updatedAuras do
                local id = updatedAuras[i]
                local newAura = C_UnitAuras.GetAuraDataByAuraInstanceID(unit, id);
                if newAura then
                    local aura = Bastion.Aura:CreateFromUnitAuraInfo(newAura)
                    self:UpdateInstanceID(id, aura)
                else
                    print("Instance ID " .. id .. " not found" .. " for unit " .. unit)
                end
            end
        end

        -- Remove auras
        if removedAuras and #removedAuras > 0 then
            for i = 1, #removedAuras do
                self:RemoveInstanceID(removedAuras[i])
            end
        end

        -- Add auras
        if addedAuras and #addedAuras > 0 then
            for i = 1, #addedAuras do
                local aura = Bastion.Aura:CreateFromUnitAuraInfo(addedAuras[i])

                if aura:IsBuff() then
                    if aura:GetSource():Exists() and aura:GetSource():IsUnit(Bastion.UnitManager['player']) then
                        if not self.playerAppliedBuffs[aura:GetSpell():GetID()] then
                            self.playerAppliedBuffs[aura:GetSpell():GetID()] = {}
                        end
                        self.playerAppliedBuffs[aura:GetSpell():GetID()][aura:GetAuraInstanceID()] = aura
                        self.instanceIDLookup[aura:GetAuraInstanceID()] = { 'playerAppliedBuffs',
                            aura:GetSpell():GetID() }
                    else
                        if not self.buffs[aura:GetSpell():GetID()] then
                            self.buffs[aura:GetSpell():GetID()] = {}
                        end
                        self.buffs[aura:GetSpell():GetID()][aura:GetAuraInstanceID()] = aura
                        self.instanceIDLookup[aura:GetAuraInstanceID()] = { 'buffs',
                            aura:GetSpell():GetID() }
                    end
                else
                    if aura:GetSource():Exists() and aura:GetSource():IsUnit(Bastion.UnitManager['player']) then
                        if not self.playerAppliedDebuffs[aura:GetSpell():GetID()] then
                            self.playerAppliedDebuffs[aura:GetSpell():GetID()] = {}
                        end
                        self.playerAppliedDebuffs[aura:GetSpell():GetID()][aura:GetAuraInstanceID()] = aura
                        self.instanceIDLookup[aura:GetAuraInstanceID()] = { 'playerAppliedDebuffs',
                            aura:GetSpell():GetID() }
                    else
                        if not self.debuffs[aura:GetSpell():GetID()] then
                            self.debuffs[aura:GetSpell():GetID()] = {}
                        end
                        self.debuffs[aura:GetSpell():GetID()][aura:GetAuraInstanceID()] = aura
                        self.instanceIDLookup[aura:GetAuraInstanceID()] = { 'debuffs', aura:GetSpell():GetID() }
                    end
                end
            end
        end
    end)

    return self
end

function AuraTable:RemoveInstanceID(instanceID)
    if not self.instanceIDLookup[instanceID] then
        return
    end

    local t, id = unpack(self.instanceIDLookup[instanceID])

    -- print("Removing aura from table: " .. t .. " " .. id .. " " .. index .. "")
    local a = self[t][id][instanceID]

    if a:GetAuraInstanceID() ~= instanceID then
        print("Instance ID mismatch: " .. a:GetAuraInstanceID() .. " " .. instanceID)
    end

    self[t][id][instanceID] = nil
    self.instanceIDLookup[instanceID] = nil
end

function AuraTable:UpdateInstanceID(instanceID, newAura)
    if not self.instanceIDLookup[instanceID] then
        return
    end

    local t, id = unpack(self.instanceIDLookup[instanceID])

    -- print("Updating aura in table: " .. t .. " " .. id .. " " .. index .. "")

    self[t][id][instanceID] = newAura
end

-- Get a units buffs
function AuraTable:GetUnitBuffs()
    AuraUtil.ForEachAura(self.unit.unit, 'HELPFUL', nil, function(a)
        local aura = Bastion.Aura:CreateFromUnitAuraInfo(a)

        if aura:IsValid() then
            if aura:GetSource():Exists() and aura:GetSource():IsUnit(Bastion.UnitManager['player']) then
                if not self.playerAppliedBuffs[aura:GetSpell():GetID()] then
                    self.playerAppliedBuffs[aura:GetSpell():GetID()] = {}
                end
                self.playerAppliedBuffs[aura:GetSpell():GetID()][aura:GetAuraInstanceID()] = aura
                self.instanceIDLookup[aura:GetAuraInstanceID()] = { 'playerAppliedBuffs',
                    aura:GetSpell():GetID() }
            else
                if not self.buffs[aura:GetSpell():GetID()] then
                    self.buffs[aura:GetSpell():GetID()] = {}
                end
                self.buffs[aura:GetSpell():GetID()][aura:GetAuraInstanceID()] = aura
                self.instanceIDLookup[aura:GetAuraInstanceID()] = { 'buffs',
                    aura:GetSpell():GetID() }
            end
        end
    end, true)
end

-- Get a units debuffs
function AuraTable:GetUnitDebuffs()
    AuraUtil.ForEachAura(self.unit.unit, 'HARMFUL', nil, function(a)
        local aura = Bastion.Aura:CreateFromUnitAuraInfo(a)

        if aura:IsValid() then
            if aura:GetSource():Exists() and aura:GetSource():IsUnit(Bastion.UnitManager['player']) then
                if not self.playerAppliedDebuffs[aura:GetSpell():GetID()] then
                    self.playerAppliedDebuffs[aura:GetSpell():GetID()] = {}
                end
                self.playerAppliedDebuffs[aura:GetSpell():GetID()][aura:GetAuraInstanceID()] = aura
                self.instanceIDLookup[aura:GetAuraInstanceID()] = { 'playerAppliedDebuffs',
                    aura:GetSpell():GetID() }
            else
                if not self.debuffs[aura:GetSpell():GetID()] then
                    self.debuffs[aura:GetSpell():GetID()] = {}
                end
                self.debuffs[aura:GetSpell():GetID()][aura:GetAuraInstanceID()] = aura
                self.instanceIDLookup[aura:GetAuraInstanceID()] = { 'debuffs',
                    aura:GetSpell():GetID() }
            end
        end
    end, true)
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
    -- self.lastUpdate = GetTime()

    self:GetUnitBuffs()
    self:GetUnitDebuffs()

    -- self.auras = merge(self.buffs, self.debuffs)
    -- self.playerAuras = merge(self.playerAppliedBuffs, self.playerAppliedDebuffs)
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
        return merge(self.buffs, self.debuffs)
    end

    -- -- Cache the auras for the unit so we don't have to query the API every time we want to check if the unit has a specific aura or not
    -- -- If it's less than .4  seconds since the last time we queried the API, return the cached auras
    -- if self.lastUpdate and GetTime() - self.lastUpdate < 0.5 then
    --     return merge(self.buffs, self.debuffs)
    -- end

    -- self:Update()
    return merge(self.buffs, self.debuffs)
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
        return merge(self.playerAppliedBuffs, self.playerAppliedDebuffs)
    end

    -- -- Cache the auras for the unit so we don't have to query the API every time we want to check if the unit has a specific aura or not
    -- -- If it's less than .4  seconds since the last time we queried the API, return the cached auras
    -- if self.lastUpdate and GetTime() - self.lastUpdate < 0.5 then
    --     return merge(self.playerAppliedBuffs, self.playerAppliedDebuffs)
    -- end

    -- self:Update()
    return merge(self.playerAppliedBuffs, self.playerAppliedDebuffs)
end

-- Clear the aura table
function AuraTable:Clear()
    self.buffs = {}
    self.debuffs = {}
    self.auras = {}
    self.playerAppliedBuffs = {}
    self.playerAppliedDebuffs = {}
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
    local auras = self:GetMyUnitAuras()
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
