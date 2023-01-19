local Tinkr, Bastion = ...

-- Create a new Item class
local Item = {
    UsableIfFunc = false,
    PreUseFunc = false,
    OnUseFunc = false,
    wasLooking = false,
    lastUseAttempt = 0,
    conditions = {},
    target = false,
}

local usableExcludes = {
    [18562] = true,
}

function Item:__index(k)
    local response = Bastion.ClassMagic:Resolve(Item, k)

    if response == nil then
        response = rawget(self, k)
    end

    if response == nil then
        error("Item:__index: " .. k .. " does not exist")
    end

    return response
end

-- tostring
function Item:__tostring()
    return "Bastion.__Item(" .. self:GetID() .. ")" .. " - " .. self:GetName()
end

-- Constructor
function Item:New(id)
    local self = setmetatable({}, Item)

    self.ItemID = id

    -- Register spell in spellbook
    local name, spellID = GetItemSpell(self:GetID())
    if spellID then
        self.spellID = spellID
        Bastion.SpellBook:GetSpell(spellID)
    end

    return self
end

-- Get the Items id
function Item:GetID()
    return self.ItemID
end

-- Get the Items name
function Item:GetName()
    return GetItemInfo(self:GetID())
end

-- Get the Items icon
function Item:GetIcon()
    return select(3, GetItemInfo(self:GetID()))
end

-- Get the Items cooldown
function Item:GetCooldown()
    return select(2, C_Container.GetItemCooldown(self:GetID()))
end

-- Return the Usable function
function Item:GetUsableFunction()
    return self.UsableIfFunc
end

-- Return the preUse function
function Item:GetPreUseFunction()
    return self.PreUseFunc
end

-- Get the on Use func
function Item:GetOnUseFunction()
    return self.OnUseFunc
end

-- Get the Items cooldown remaining
function Item:GetCooldownRemaining()
    local start, duration = C_Container.GetItemCooldown(self:GetID())
    return start + duration - GetTime()
end

-- Use the Item
function Item:Use(unit, condition)
    if condition and not self:EvaluateCondition(condition) then
        return false
    end

    if not self:Usable() then
        return false
    end

    -- Call pre Use function
    if self:GetPreUseFunction() then
        self:GetPreUseFunction()(self)
    end

    -- Check if the mouse was looking
    self.wasLooking = IsMouselooking()

    -- Use the Item
    UseItemByName(self:GetName(), unit.unit)

    Bastion:Debug("Using", self)

    -- Set the last Use time
    self.lastUseAttempt = GetTime()

    -- Call post Use function
    if self:GetOnUseFunction() then
        self:GetOnUseFunction()(self)
    end
end

-- Last use attempt
function Item:GetLastUseAttempt()
    return self.lastUseAttempt
end

-- Time since last attepmt
function Item:GetTimeSinceLastUseAttempt()
    return GetTime() - self:GetLastUseAttempt()
end

-- Check if the Item is known
function Item:IsEquipped()
    return IsEquippedItem(self:GetID())
end

-- Check if the Item is on cooldown
function Item:IsOnCooldown()
    return select(2, C_Container.GetItemCooldown(self:GetID())) > 0
end

-- Check if the Item is usable
function Item:IsUsable()
    local usable, noMana = IsUsableItem(self:GetID())
    return usable or usableExcludes[self:GetID()]
end

-- Check if the Item is Usable
function Item:IsEquippedAndUsable()
    return ((self:IsEquippable() and self:IsEquipped()) or
        (not self:IsEquippable() and self:IsUsable())) and not self:IsOnCooldown()
end

-- Is equippable
function Item:IsEquippable()
    return IsEquippableItem(self:GetID())
end

-- Check if the Item is Usable
function Item:Usable()
    if self:GetUsableFunction() then
        return self:GetUsableFunction()(self)
    end

    return self:IsEquippedAndUsable()
end

-- Set a script to check if the Item is Usable
function Item:UsableIf(func)
    self.UsableIfFunc = func
    return self
end

-- Set a script to run before the Item has been Use
function Item:PreUse(func)
    self.PreUseFunc = func
    return self
end

-- Set a script to run after the Item has been Use
function Item:OnUse(func)
    self.OnUseFunc = func
    return self
end

-- Get was looking
function Item:GetWasLooking()
    return self.wasLooking
end

-- Click the Item
function Item:Click(x, y, z)
    if type(x) == 'table' then
        x, y, z = x.x, x.y, x.z
    end
    if IsItemPending() == 64 then
        MouselookStop()
        Click(x, y, z)
        if self:GetWasLooking() then
            MouselookStart()
        end
        return true
    end
    return false
end

-- Check if the Item is Usable and Use it
function Item:Call(unit)
    if self:Usable() then
        self:Use(unit)
        return true
    end
    return false
end

-- Check if the Item is in range of the unit
function Item:IsInRange(unit)
    local name, rank, icon, UseTime, Itemmin, Itemmax, ItemID = GetItemInfo(self:GetID())

    local them = Object(unit.unit)

    local tx, ty, tz = ObjectPosition(unit.unit)
    local px, py, pz = ObjectPosition('player')

    if not them then
        return false
    end

    if tx == 0 and ty == 0 and tz == 0 then
        return true
    end

    local combatReach = ObjectCombatReach("player")
    local themCombatReach = ObjectCombatReach(unit.unit)

    if Bastion.UnitManager['player']:InMelee(unit) and Itemmin == 0 then
        return true
    end

    local distance = FastDistance(px, py, pz, tx, ty, tz)

    if Itemmax
        and distance >= Itemmin
        and distance <= combatReach + themCombatReach + Itemmax
    then
        return true
    end

    return false
end

-- Get the last use time
function Item:GetLastUseTime()
    return Bastion.SpellBook:GetSpell(self:GetID()):GetLastCastTime()
end

-- Get time since last use
function Item:GetTimeSinceLastUse()
    if not self:GetLastUseTime() then
        return math.huge
    end
    return GetTime() - self:GetLastUseTime()
end

-- Get the Items charges
function Item:GetCharges()
    return GetItemCharges(self:GetID())
end

-- Get the Items charges remaining
function Item:GetChargesRemaining()
    local charges, maxCharges, start, duration = GetItemCharges(self:GetID())
    return charges
end

-- Create a condition for the Item
function Item:Condition(name, func)
    self.conditions[name] = {
        func = func
    }
    return self
end

-- Get a condition for the Item
function Item:GetCondition(name)
    local condition = self.conditions[name]
    if condition then
        return condition
    end

    return nil
end

-- Evaluate a condition for the Item
function Item:EvaluateCondition(name)
    local condition = self:GetCondition(name)
    if condition then
        return condition.func(self)
    end

    return false
end

-- Check if the Item has a condition
function Item:HasCondition(name)
    local condition = self:GetCondition(name)
    if condition then
        return true
    end

    return false
end

-- Set the Items target
function Item:SetTarget(unit)
    self.target = unit
    return self
end

-- Get the Items target
function Item:GetTarget()
    return self.target
end

-- IsMagicDispel
function Item:IsMagicDispel()
    return ({
        [88423] = true
    })[self:GetID()]
end

-- IsCurseDispel
function Item:IsCurseDispel()
    return ({
        [88423] = true
    })[self:GetID()]
end

-- IsPoisonDispel
function Item:IsPoisonDispel()
    return ({
        [88423] = true
    })[self:GetID()]
end

-- IsDiseaseDispel
function Item:IsDiseaseDispel()
    return ({

    })[self:GetID()]
end

function Item:IsItem(item)
    return self:GetID() == item:GetID()
end

function Item:GetSpell()
    if self.spellID then
        return Bastion.SpellBook:GetSpell(self.spellID)
    end

    return nil
end

return Item
