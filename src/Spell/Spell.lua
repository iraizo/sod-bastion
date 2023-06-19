local Tinkr, Bastion = ...

-- Create a new Spell class
---@class Spell
local Spell = {
    CastableIfFunc = false,
    PreCastFunc = false,
    OnCastFunc = false,
    PostCastFunc = false,
    lastCastAttempt = false,
    wasLooking = false,
    lastCastAt = false,
    conditions = {},
    target = false,
    release_at = false,
}

local usableExcludes = {
    [18562] = true,
}

function Spell:__index(k)
    local response = Bastion.ClassMagic:Resolve(Spell, k)

    if response == nil then
        response = rawget(self, k)
    end

    if response == nil then
        error("Spell:__index: " .. k .. " does not exist")
    end

    return response
end

-- Equals
---@param other Spell
---@return boolean
function Spell:__eq(other)
    return self:GetID() == other:GetID()
end

-- tostring
---@return string
function Spell:__tostring()
    return "Bastion.__Spell(" .. self:GetID() .. ")" .. " - " .. self:GetName()
end

-- Constructor
---@param id number
---@return Spell
function Spell:New(id)
    local self = setmetatable({}, Spell)

    self.spellID = id

    return self
end

-- Get the spells id
---@return number
function Spell:GetID()
    return self.spellID
end

-- Add post cast func
---@param func fun(self:Spell)
---@return Spell
function Spell:PostCast(func)
    self.PostCastFunc = func
    return self
end

-- Get the spells name
---@return string
function Spell:GetName()
    return GetSpellInfo(self:GetID())
end

-- Get the spells icon
---@return number
function Spell:GetIcon()
    return select(3, GetSpellInfo(self:GetID()))
end

-- Get the spells cooldown
---@return number
function Spell:GetCooldown()
    return select(2, GetSpellCooldown(self:GetID()))
end

-- Get the full cooldown (time until all charges are available)
---@return number
function Spell:GetFullRechargeTime()
    local start, duration, enabled = GetSpellCooldown(self:GetID())
    if enabled == 0 then
        return 0
    end

    local charges, maxCharges, chargeStart, chargeDuration = GetSpellCharges(self:GetID())
    if charges == maxCharges then
        return 0
    end

    if charges == 0 then
        return start + duration - GetTime()
    end

    return chargeStart + chargeDuration - GetTime()
end

-- Return the castable function
---@return fun(self:Spell):boolean
function Spell:GetCastableFunction()
    return self.CastableIfFunc
end

-- Return the precast function
---@return fun(self:Spell)
function Spell:GetPreCastFunction()
    return self.PreCastFunc
end

-- Get the on cast func
---@return fun(self:Spell)
function Spell:GetOnCastFunction()
    return self.OnCastFunc
end

-- Get the spells cooldown remaining
---@return number
function Spell:GetCooldownRemaining()
    local start, duration = GetSpellCooldown(self:GetID())
    return start + duration - GetTime()
end

-- Get the spell count
---@return number
function Spell:GetCount()
    return GetSpellCount(self:GetID())
end

-- On cooldown
---@return boolean
function Spell:OnCooldown()
    return self:GetCooldownRemaining() > 0
end

-- Clear castable function
---@return Spell
function Spell:ClearCastableFunction()
    self.CastableIfFunc = false
    return self
end

-- Cast the spell
---@param unit Unit
---@param condition string
---@return boolean
function Spell:Cast(unit, condition)
    if condition and not self:EvaluateCondition(condition) then
        return false
    end

    if not self:Castable() then
        return false
    end

    -- Call pre cast function
    if self:GetPreCastFunction() then
        self:GetPreCastFunction()(self)
    end

    -- Check if the mouse was looking
    self.wasLooking = IsMouselooking()

    -- if unit:GetOMToken() contains 'nameplate' then we need to use Object wrapper to cast
    local u = unit:GetOMToken()
    if type(u) == "string" and string.find(u, 'nameplate') then
        u = Object(u)
    end

    -- Cast the spell
    CastSpellByName(self:GetName(), u)
    SpellCancelQueuedSpell()

    Bastion:Debug("Casting", self)

    -- Set the last cast time
    self.lastCastAttempt = GetTime()

    -- Call post cast function
    if self:GetOnCastFunction() then
        self:GetOnCastFunction()(self)
    end

    return true
end

-- ForceCast the spell
---@param unit Unit
---@param condition string
---@return boolean
function Spell:ForceCast(unit)
    -- Call pre cast function
    -- if self:GetPreCastFunction() then
    --     self:GetPreCastFunction()(self)
    -- end

    -- Check if the mouse was looking
    self.wasLooking = IsMouselooking()

    -- if unit:GetOMToken() contains 'nameplate' then we need to use Object wrapper to cast
    local u = unit:GetOMToken()
    if type(u) == "string" and string.find(u, 'nameplate') then
        u = Object(u)
    end

    -- Cast the spell
    CastSpellByName(self:GetName(), u)
    SpellCancelQueuedSpell()

    Bastion:Debug("Casting", self)

    -- Set the last cast time
    self.lastCastAttempt = GetTime()

    -- -- Call post cast function
    -- if self:GetOnCastFunction() then
    --     self:GetOnCastFunction()(self)
    -- end

    return true
end

-- Get post cast func
---@return fun(self:Spell)
function Spell:GetPostCastFunction()
    return self.PostCastFunc
end

-- Check if the spell is known
---@return boolean
function Spell:IsKnown()
    local isKnown = IsSpellKnown(self:GetID())
    local isPlayerSpell = IsPlayerSpell(self:GetID())
    return isKnown or isPlayerSpell
end

-- Check if the spell is on cooldown
---@return boolean
function Spell:IsOnCooldown()
    return select(2, GetSpellCooldown(self:GetID())) > 0
end

-- Check if the spell is usable
---@return boolean
function Spell:IsUsable()
    local usable, noMana = IsUsableSpell(self:GetID())
    return usable or usableExcludes[self:GetID()] and not noMana
end

-- Check if the spell is castable
---@return boolean
function Spell:IsKnownAndUsable()
    return self:IsKnown() and not self:IsOnCooldown() and self:IsUsable()
end

-- Check if the spell is castable
---@return boolean
function Spell:Castable()
    if self:GetCastableFunction() then
        return self:GetCastableFunction()(self)
    end

    return self:IsKnownAndUsable()
end

-- Set a script to check if the spell is castable
---@param func fun(spell:Spell):boolean
---@return Spell
function Spell:CastableIf(func)
    self.CastableIfFunc = func
    return self
end

-- Set a script to run before the spell has been cast
---@param func fun(spell:Spell)
---@return Spell
function Spell:PreCast(func)
    self.PreCastFunc = func
    return self
end

-- Set a script to run after the spell has been cast
---@param func fun(spell:Spell)
---@return Spell
function Spell:OnCast(func)
    self.OnCastFunc = func
    return self
end

-- Get was looking
---@return boolean
function Spell:GetWasLooking()
    return self.wasLooking
end

-- Click the spell
---@param x number
---@param y number
---@param z number
---@return boolean
function Spell:Click(x, y, z)
    if type(x) == 'table' then
        x, y, z = x.x, x.y, x.z
    end
    if IsSpellPending() == 64 then
        MouselookStop()
        Click(x, y, z)
        if self:GetWasLooking() then
            MouselookStart()
        end
        return true
    end
    return false
end

-- Check if the spell is castable and cast it
---@param unit Unit
---@return boolean
function Spell:Call(unit)
    if self:Castable() then
        self:Cast(unit)
        return true
    end
    return false
end

-- Check if the spell is castable and cast it
---@return boolean
function Spell:HasRange()
    return SpellHasRange(self:GetName())
end

-- Get the range of the spell
---@return number
---@return number
function Spell:GetRange()
    local name, rank, icon, castTime, minRange, maxRange, spellID, originalIcon = GetSpellInfo(self:GetID())
    return maxRange, minRange
end

-- Check if the spell is in range of the unit
---@param unit Unit
---@return boolean
function Spell:IsInRange(unit)
    local hasRange = self:HasRange()
    local inRange = IsSpellInRange(self:GetName(), unit:GetOMToken())

    if hasRange == false then
        return true
    end

    if inRange == 1 then
        return true
    end

    return Bastion.UnitManager['player']:InMelee(unit)
end

-- Get the last cast time
---@return number
function Spell:GetLastCastTime()
    return self.lastCastAt
end

-- Get time since last cast
---@return number
function Spell:GetTimeSinceLastCast()
    if not self:GetLastCastTime() then
        return math.huge
    end
    return GetTime() - self:GetLastCastTime()
end

-- Get the time since the last cast attempt
---@return number
function Spell:GetTimeSinceLastCastAttempt()
    if not self.lastCastAttempt then
        return math.huge
    end
    return GetTime() - self.lastCastAttempt
end

-- Get the spells charges
---@return number
function Spell:GetCharges()
    return GetSpellCharges(self:GetID())
end

function Spell:GetMaxCharges()
    return select(2, GetSpellCharges(self:GetID()))
end

function Spell:GetCastLength()
    return select(4, GetSpellInfo(self:GetID()))
end

-- Get the spells charges
---@return number
function Spell:GetChargesFractional()
    local charges, maxCharges, start, duration = GetSpellCharges(self:GetID())

    if charges == maxCharges then
        return maxCharges
    end

    if charges == 0 then
        return 0
    end

    local timeSinceStart = GetTime() - start
    local timeLeft = duration - timeSinceStart
    local timePerCharge = duration / maxCharges
    local chargesFractional = charges + (timeLeft / timePerCharge)

    return chargesFractional
end

-- Get the spells charges remaining
---@return number
function Spell:GetChargesRemaining()
    local charges, maxCharges, start, duration = GetSpellCharges(self:GetID())
    return charges
end

-- Create a condition for the spell
---@param name string
---@param func fun(self:Spell):boolean
---@return Spell
function Spell:Condition(name, func)
    self.conditions[name] = {
        func = func
    }
    return self
end

-- Get a condition for the spell
---@param name string
---@return function | nil
function Spell:GetCondition(name)
    local condition = self.conditions[name]
    if condition then
        return condition
    end

    return nil
end

-- Evaluate a condition for the spell
---@param name string
---@return boolean
function Spell:EvaluateCondition(name)
    local condition = self:GetCondition(name)
    if condition then
        return condition.func(self)
    end

    return false
end

-- Check if the spell has a condition
---@param name string
---@return boolean
function Spell:HasCondition(name)
    local condition = self:GetCondition(name)
    if condition then
        return true
    end

    return false
end

-- Set the spells target
---@param unit Unit
---@return Spell
function Spell:SetTarget(unit)
    self.target = unit
    return self
end

-- Get the spells target
---@return Unit
function Spell:GetTarget()
    return self.target
end

-- IsMagicDispel
---@return boolean
function Spell:IsMagicDispel()
    return ({
        [88423] = true
    })[self:GetID()]
end

-- IsCurseDispel
---@return boolean
function Spell:IsCurseDispel()
    return ({
        [88423] = true
    })[self:GetID()]
end

-- IsPoisonDispel
---@return boolean
function Spell:IsPoisonDispel()
    return ({
        [88423] = true
    })[self:GetID()]
end

-- IsDiseaseDispel
---@return boolean
function Spell:IsDiseaseDispel()
    return ({

    })[self:GetID()]
end

-- IsSpell
---@param spell Spell
---@return boolean
function Spell:IsSpell(spell)
    return self:GetID() == spell:GetID()
end

-- GetCost
---@return number
function Spell:GetCost()
    local cost = GetSpellPowerCost(self:GetID())
    return cost and cost.cost or 0
end

-- IsFree
---@return boolean
function Spell:IsFree()
    return self:GetCost() == 0
end

return Spell
