local Tinkr, Bastion = ...

-- Create a new Unit class
local Unit = {
    cache = nil,
    aura_table = nil,
    unit = nil
}

function Unit:__index(k)
    local response = Bastion.ClassMagic:Resolve(Unit, k)

    if response == nil then
        response = rawget(self, k)
    end

    if response == nil then
        error("Unit:__index: " .. k .. " does not exist")
    end

    return response
end

-- tostring
function Unit:__tostring()
    return "Bastion.__Unit(" .. tostring(self.unit) .. ")" .. " - " .. (self:GetName() or '')
end

-- Constructor
function Unit:New(unit)
    local self      = setmetatable({}, Unit)
    self.unit       = unit
    self.cache      = Bastion.Cache:New()
    self.aura_table = Bastion.AuraTable:New(self)
    return self
end

-- Check if the unit is valid
function Unit:IsValid()
    return self.unit ~= nil and self:Exists()
end

-- Check if the unit exists
function Unit:Exists()
    return Object(self.unit)
end

-- Get the units token
function Unit:Token()
    return self.unit
end

-- Get the units name
function Unit:GetName()
    return UnitName(self.unit)
end

-- Get the units GUID
function Unit:GetGUID()
    return ObjectGUID(self.unit)
end

-- Get the units health
function Unit:GetHealth()
    return UnitHealth(self.unit)
end

-- Get the units max health
function Unit:GetMaxHealth()
    return UnitHealthMax(self.unit)
end

-- Get the units health percentage
function Unit:GetHP()
    return self:GetHealth() / self:GetMaxHealth() * 100
end

function Unit:GetHealthPercent()
    return self:GetHP()
end

-- Get the units power type
function Unit:GetPowerType()
    return UnitPowerType(self.unit)
end

-- Get the units power
function Unit:GetPower(powerType)
    local powerType = powerType or self:GetPowerType()
    return UnitPower(self.unit, powerType)
end

-- Get the units max power
function Unit:GetMaxPower(powerType)
    local powerType = powerType or self:GetPowerType()
    return UnitPowerMax(self.unit, powerType)
end

-- Get the units power percentage
function Unit:GetPP(powerType)
    local powerType = powerType or self:GetPowerType()
    return self:GetPower(powerType) / self:GetMaxPower(powerType) * 100
end

-- Get the units power deficit
function Unit:GetPowerDeficit(powerType)
    local powerType = powerType or self:GetPowerType()
    return self:GetMaxPower(powerType) - self:GetPower(powerType)
end

-- Get the units position
function Unit:GetPosition()
    local x, y, z = ObjectPosition(self.unit)
    return Bastion.Vector3:New(x, y, z)
end

-- Get the units distance from another unit
function Unit:GetDistance(unit)
    local pself = self:GetPosition()
    local punit = unit:GetPosition()

    return pself:Distance(punit)
end

-- Is the unit dead
function Unit:IsDead()
    return UnitIsDeadOrGhost(self.unit)
end

-- Is the unit alive
function Unit:IsAlive()
    return not UnitIsDeadOrGhost(self.unit)
end

-- Is the unit a pet
function Unit:IsPet()
    return UnitIsUnit(self.unit, "pet")
end

-- Is the unit a friendly unit
function Unit:IsFriendly()
    return UnitIsFriend("player", self.unit)
end

-- IsEnemy
function Unit:IsEnemy()
    return UnitCanAttack("player", self.unit)
end

-- Is the unit a hostile unit
function Unit:IsHostile()
    return UnitCanAttack(self.unit, 'player')
end

-- Is the unit a boss
function Unit:IsBoss()
    if UnitClassification(self.unit) == "worldboss" then
        return true
    end

    for i = 1, 5 do
        local bossGUID = UnitGUID("boss" .. i)

        if self:GetGUID() == bossGUID then
            return true
        end
    end

    return false
end

-- Is the unit a target
function Unit:IsTarget()
    return UnitIsUnit(self.unit, "target")
end

-- Is the unit a focus
function Unit:IsFocus()
    return UnitIsUnit(self.unit, "focus")
end

-- Is the unit a mouseover
function Unit:IsMouseover()
    return UnitIsUnit(self.unit, "mouseover")
end

-- Is the unit a tank
function Unit:IsTank()
    return UnitGroupRolesAssigned(self.unit) == "TANK"
end

-- Is the unit a healer
function Unit:IsHealer()
    return UnitGroupRolesAssigned(self.unit) == "HEALER"
end

-- Is the unit a damage dealer
function Unit:IsDamage()
    return UnitGroupRolesAssigned(self.unit) == "DAMAGER"
end

-- Is the unit a player
function Unit:IsPlayer()
    return UnitIsPlayer(self.unit)
end

-- Is the unit a player controlled unit
function Unit:IsPCU()
    return UnitPlayerControlled(self.unit)
end

-- Get if the unit is affecting combat
function Unit:IsAffectingCombat()
    return UnitAffectingCombat(self.unit)
end

-- Get the units class id
function Unit:GetClass()
    local locale, class, classID = UnitClass(self.unit)
    return Bastion.Class:New(locale, class, classID)
end

-- Get the units auras
function Unit:GetAuras()
    return self.aura_table
end

-- Get the raw unit
function Unit:GetRawUnit()
    return self.unit
end

local isClassicWow = select(4, GetBuildInfo()) < 40000

-- Check if two units are in melee
function Unit:InMelee(unit)
    return UnitInMelee(self.unit, unit.unit)
end

local losFlag = bit.bor(0x1, 0x10, 0x100000)

-- Check if the unit can see another unit
function Unit:CanSee(unit)
    -- mechagon smoke cloud
    -- local mechagonID = 2097
    -- local smokecloud = 298602

    -- local name, instanceType, difficultyID, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceID, instanceGroupSize, LfgDungeonID =
    -- GetInstanceInfo()

    -- otherUnit = otherUnit and otherUnit or "player"
    -- if instanceID == 2097 then
    --     if (self:debuff(smokecloud, unit) and not self:debuff(smokecloud, otherUnit))
    --         or (self:debuff(smokecloud, otherUnit) and not self:debuff(smokecloud, unit))
    --     then
    --         return false
    --     end
    -- end
    local ax, ay, az = ObjectPosition(self.unit)
    local ah = ObjectHeight(self.unit)
    local attx, atty, attz = GetUnitAttachmentPosition(unit.unit, 34)

    if (ax == 0 and ay == 0 and az == 0) or (attx == 0 and atty == 0 and attz == 0) then
        return true
    end

    if not attx or not ax then
        return true
    end

    local x, y, z = TraceLine(ax, ay, az + ah, attx, atty, attz, losFlag)
    if x ~= 0 or y ~= 0 or z ~= 0 then
        return false
    else
        return true
    end
end

-- Check if the unit is casting a spell
function Unit:IsCasting()
    return UnitCastingInfo(self.unit) ~= nil
end

-- Check if the unit is channeling a spell
function Unit:IsChanneling()
    return UnitChannelInfo(self.unit) ~= nil
end

-- Check if the unit is casting or channeling a spell
function Unit:IsCastingOrChanneling()
    return self:IsCasting() or self:IsChanneling()
end

-- Check if the unit can attack the target
function Unit:CanAttack(unit)
    return UnitCanAttack(self.unit, unit.unit)
end

-- Check if unit is interruptible
function Unit:IsInterruptible(percent)
    local percent = percent or math.random(2, 5)

    local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo(self
        .unit)

    if not name then
        name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo(self.unit)
    end

    if name and startTimeMS and endTimeMS and not notInterruptible then
        local castTimeRemaining = endTimeMS / 1000 - GetTime()
        local castTimeTotal = (endTimeMS - startTimeMS) / 1000
        if castTimeTotal > 0 and castTimeRemaining / castTimeTotal * 100 >= percent then
            return true
        end
    end
    return false
end

-- Get the number of enemies in a given range of the unit and cache the result for .5 seconds
function Unit:GetEnemies(range)

    local enemies = self.cache:Get("enemies_" .. range)
    if enemies then
        return enemies
    end

    local count = 0

    Bastion.UnitManager:EnumNameplates(function(unit)
        if not self:IsUnit(unit) and unit:GetDistance(self) <= range and unit:IsAlive() and self:CanSee(unit) and
            unit:IsEnemy() then
            count = count + 1
        end
    end)

    self.cache:Set("enemies_" .. range, count, .5)
    return count
end

-- Get the number of melee attackers
function Unit:GetMeleeAttackers()
    local count = 0

    Bastion.UnitManager:EnumNameplates(function(unit)
        if not self:IsUnit(unit) and unit:IsAlive() and self:CanSee(unit) and
            self:InMelee(unit) and unit:IsEnemy() then
            count = count + 1
        end
    end)

    return count
end

function Unit:GetPartyHPAround(distance, percent)
    local count = 0

    Bastion.UnitManager:EnumFriends(function(unit)
        if not self:IsUnit(unit) and unit:GetDistance(self) <= distance and unit:IsAlive() and self:CanSee(unit) and
            unit:GetHP() <= percent then
            count = count + 1
        end
    end)

    return count
end

-- Is moving
function Unit:IsMoving()
    return GetUnitSpeed(self.unit) > 0
end

function Unit:GetComboPoints(unit)
    return GetComboPoints(self.unit, unit.unit)
end

-- IsUnit
function Unit:IsUnit(unit)
    return UnitIsUnit(self.unit, unit.unit)
end

-- IsTanking
function Unit:IsTanking(unit)
    local isTanking, status, threatpct, rawthreatpct, threatvalue = UnitDetailedThreatSituation(self.unit, unit.unit)
    return isTanking
end

return Unit
