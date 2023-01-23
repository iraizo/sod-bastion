local Tinkr, Bastion = ...

-- Create a new Spell class
local Spell = {
    CastableIfFunc = false,
    PreCastFunc = false,
    OnCastFunc = false,
    PostCastFunc = false,
    wasLooking = false,
    lastCastAt = 0,
    conditions = {},
    target = false,
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

-- tostring
function Spell:__tostring()
    return "Bastion.__Spell(" .. self:GetID() .. ")" .. " - " .. self:GetName()
end

-- Constructor
function Spell:New(id)
    local self = setmetatable({}, Spell)

    self.spellID = id

    return self
end

-- Get the spells id
function Spell:GetID()
    return self.spellID
end

-- Add post cast func
function Spell:PostCast(func)
    self.PostCastFunc = func
    return self
end

-- Get the spells name
function Spell:GetName()
    return GetSpellInfo(self:GetID())
end

-- Get the spells icon
function Spell:GetIcon()
    return select(3, GetSpellInfo(self:GetID()))
end

-- Get the spells cooldown
function Spell:GetCooldown()
    return select(2, GetSpellCooldown(self:GetID()))
end

-- Return the castable function
function Spell:GetCastableFunction()
    return self.CastableIfFunc
end

-- Return the precast function
function Spell:GetPreCastFunction()
    return self.PreCastFunc
end

-- Get the on cast func
function Spell:GetOnCastFunction()
    return self.OnCastFunc
end

-- Get the spells cooldown remaining
function Spell:GetCooldownRemaining()
    local start, duration = GetSpellCooldown(self:GetID())
    return start + duration - GetTime()
end

-- Cast the spell
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

    -- if unit.unit contains 'nameplate' then we need to use Object wrapper to cast
    local u = unit.unit
    if type(u) == "string" and string.find(u, 'nameplate') then
        u = Object(u)
    end

    -- Cast the spell
    CastSpellByName(self:GetName(), u)

    Bastion:Debug("Casting", self)

    -- Set the last cast time
    self.lastCastAttempt = GetTime()

    -- Call post cast function
    if self:GetOnCastFunction() then
        self:GetOnCastFunction()(self)
    end
end

-- Get post cast func
function Spell:GetPostCastFunction()
    return self.PostCastFunc
end

-- Check if the spell is known
function Spell:IsKnown()
    local isKnown = IsSpellKnown(self:GetID())
    local isPlayerSpell = IsPlayerSpell(self:GetID())
    return isKnown or isPlayerSpell
end

-- Check if the spell is on cooldown
function Spell:IsOnCooldown()
    return select(2, GetSpellCooldown(self:GetID())) > 0
end

-- Check if the spell is usable
function Spell:IsUsable()
    local usable, noMana = IsUsableSpell(self:GetID())
    return usable or usableExcludes[self:GetID()]
end

-- Check if the spell is castable
function Spell:IsKnownAndUsable()
    return self:IsKnown() and not self:IsOnCooldown() and self:IsUsable()
end

-- Check if the spell is castable
function Spell:Castable()
    if self:GetCastableFunction() then
        return self:GetCastableFunction()(self)
    end

    return self:IsKnownAndUsable()
end

-- Set a script to check if the spell is castable
function Spell:CastableIf(func)
    self.CastableIfFunc = func
    return self
end

-- Set a script to run before the spell has been cast
function Spell:PreCast(func)
    self.PreCastFunc = func
    return self
end

-- Set a script to run after the spell has been cast
function Spell:OnCast(func)
    self.OnCastFunc = func
    return self
end

-- Get was looking
function Spell:GetWasLooking()
    return self.wasLooking
end

-- Click the spell
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
function Spell:Call(unit)
    if self:Castable() then
        self:Cast(unit)
        return true
    end
    return false
end

function Spell:HasRange()
    return SpellHasRange(self:GetName())
end

-- Check if the spell is in range of the unit
function Spell:IsInRange(unit)
    local hasRange = self:HasRange()
    local inRange = IsSpellInRange(self:GetName(), unit.unit)

    if not hasRange then
        return true
    end

    if hasRange and inRange == 1 then
        return true
    end

    return false
end

-- Get the last cast time
function Spell:GetLastCastTime()
    return self.lastCastAt
end

-- Get time since last cast
function Spell:GetTimeSinceLastCast()
    if not self:GetLastCastTime() then
        return math.huge
    end
    return GetTime() - self:GetLastCastTime()
end

-- Get the spells charges
function Spell:GetCharges()
    return GetSpellCharges(self:GetID())
end

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
function Spell:GetChargesRemaining()
    local charges, maxCharges, start, duration = GetSpellCharges(self:GetID())
    return charges
end

-- Create a condition for the spell
function Spell:Condition(name, func)
    self.conditions[name] = {
        func = func
    }
    return self
end

-- Get a condition for the spell
function Spell:GetCondition(name)
    local condition = self.conditions[name]
    if condition then
        return condition
    end

    return nil
end

-- Evaluate a condition for the spell
function Spell:EvaluateCondition(name)
    local condition = self:GetCondition(name)
    if condition then
        return condition.func(self)
    end

    return false
end

-- Check if the spell has a condition
function Spell:HasCondition(name)
    local condition = self:GetCondition(name)
    if condition then
        return true
    end

    return false
end

-- Set the spells target
function Spell:SetTarget(unit)
    self.target = unit
    return self
end

-- Get the spells target
function Spell:GetTarget()
    return self.target
end

-- IsMagicDispel
function Spell:IsMagicDispel()
    return ({
        [88423] = true
    })[self:GetID()]
end

-- IsCurseDispel
function Spell:IsCurseDispel()
    return ({
        [88423] = true
    })[self:GetID()]
end

-- IsPoisonDispel
function Spell:IsPoisonDispel()
    return ({
        [88423] = true
    })[self:GetID()]
end

-- IsDiseaseDispel
function Spell:IsDiseaseDispel()
    return ({

    })[self:GetID()]
end

function Spell:IsSpell(spell)
    return self:GetID() == spell:GetID()
end

return Spell
