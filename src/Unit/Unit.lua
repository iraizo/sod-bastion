local Tinkr, Bastion = ...

-- Create a new Unit class
---@class Unit
local Unit = {
    cache = nil,
    ---@type AuraTable
    aura_table = nil,
    ---@type Unit
    unit = nil,
    last_shadow_techniques = 0,
    swings_since_sht = 0,
    last_off_attack = 0,
    last_main_attack = 0,
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
    local self              = setmetatable({}, Unit)
    self.unit               = unit
    self.cache              = Bastion.Cache:New()
    self.aura_table         = Bastion.AuraTable:New(self)
    self.regression_history = {}
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
    return UnitAffectingCombat('player', self.unit)
end

-- Get the units class id
function Unit:GetClass()
    local locale, class, classID = UnitClass(self.unit)
    return Bastion.Class:New(locale, class, classID)
end

-- Get the units auras
---@return AuraTable
function Unit:GetAuras()
    return self.aura_table
end

-- Get the raw unit
function Unit:GetRawUnit()
    return self.unit
end

local isClassicWow = select(4, GetBuildInfo()) < 40000

-- Check if two units are in melee
-- function Unit:InMelee(unit)
--     return UnitInMelee(self.unit, unit.unit)
-- end

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

-- Get Casting or channeling spell
function Unit:GetCastingOrChannelingSpell()
    local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo(self
        .unit)

    if not name then
        name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo(self.unit)
    end

    if name then
        return Bastion.SpellBook:GetSpell(spellId)
    end

    return nil
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

function Unit:GetChannelOrCastPercentComplete()
    local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo(self
        .unit)

    if not name then
        name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo(self.unit)
    end

    if name and startTimeMS and endTimeMS then
        local start = startTimeMS / 1000
        local finish = endTimeMS / 1000
        local current = GetTime()

        return ((current - start) / (finish - start)) * 100
    end
    return 0
end

function Unit:IsInterruptible()
    local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo(self
        .unit)

    if not name then
        name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo(self.unit)
    end

    if name then
        return not notInterruptible
    end

    return false
end

-- Check if unit is interruptible
function Unit:IsInterruptibleAt(percent)
    if not self:IsInterruptible() then
        return false
    end

    local percent = percent or math.random(2, 5)

    local castPercent = self:GetChannelOrCastPercentComplete()
    if castPercent >= percent then
        return true
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

    Bastion.UnitManager:EnumEnemies(function(unit)
        if not self:IsUnit(unit) and unit:GetDistance(self) <= range and unit:IsAlive() and self:CanSee(unit) and
            unit:IsEnemy() and unit:IsAffectingCombat() then
            count = count + 1
        end
    end)

    self.cache:Set("enemies_" .. range, count, .5)
    return count
end

-- Get the number of melee attackers
function Unit:GetMeleeAttackers()
    local enemies = self.cache:Get("melee_attackers")
    if enemies then
        return enemies
    end

    local count = 0

    Bastion.UnitManager:EnumEnemies(function(unit)
        if not self:IsUnit(unit) and unit:IsAlive() and self:CanSee(unit) and
            self:InMelee(unit) and unit:IsEnemy() and unit:IsAffectingCombat() then
            count = count + 1
        end
    end)

    self.cache:Set("melee_attackers", count, .5)
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

function Unit:IsMovingAtAll()
    return ObjectMovementFlag(self.unit) ~= 0
end

function Unit:GetComboPoints()
    return UnitPower(self.unit, 4)
end

function Unit:GetComboPointsMax()
    return UnitPowerMax(self.unit, 4)
end

-- Get combopoints deficit
function Unit:GetComboPointsDeficit()
    return self:GetComboPointsMax() - self:GetComboPoints()
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

-- IsFacing
function Unit:IsFacing(unit)
    local rot = ObjectRotation(self.unit)
    local x, y, z = ObjectPosition(self.unit)
    local x2, y2, z2 = ObjectPosition(unit.unit)

    if not x or not x2 then
        return false
    end

    local angle = math.atan2(y2 - y, x2 - x) - rot
    angle = math.deg(angle)
    angle = angle % 360
    if angle > 180 then
        angle = angle - 360
    end

    return math.abs(angle) < 90
end

-- IsBehind
function Unit:IsBehind(unit)
    local rot = ObjectRotation(unit.unit)
    local x, y, z = ObjectPosition(unit.unit)
    local x2, y2, z2 = ObjectPosition(self.unit)

    if not x or not x2 then
        return false
    end

    local angle = math.atan2(y2 - y, x2 - x) - rot
    angle = math.deg(angle)
    angle = angle % 360
    if angle > 180 then
        angle = angle - 360
    end

    return math.abs(angle) > 90
end

function Unit:GetMeleeBoost()
    if IsPlayerSpell(196924) then
        return 3
    end
    return 0
end

-- Melee calculation
-- float fMaxDist = fmaxf((float)(*(float*)((uintptr_t)this + 0x1BF8) + 1.3333) + *(float*)((uintptr_t)target + 0x1BF8), 5.0);
-- fMaxDist = fMaxDist + 1.0;
-- Vector3 myPos = ((WoWGameObject*)this)->GetPosition();
-- Vector3 targetPos = ((WoWGameObject*)target)->GetPosition();
-- return ((myPos.x - targetPos.x) * (myPos.x - targetPos.x)) + ((myPos.y - targetPos.y) * (myPos.y - targetPos.y)) + ((myPos.z - targetPos.z) * (myPos.z - targetPos.z)) <= (float)(fMaxDist * fMaxDist);

-- InMelee
function Unit:InMelee(unit)
    local x, y, z = ObjectPosition(self.unit)
    local x2, y2, z2 = ObjectPosition(unit.unit)

    if not x or not x2 then
        return false
    end

    local dist = math.sqrt((x - x2) ^ 2 + (y - y2) ^ 2 + (z - z2) ^ 2)
    local maxDist = math.max((ObjectCombatReach(self.unit) + 1.3333) + ObjectCombatReach(unit.unit), 5.0)
    maxDist = maxDist + 1.0 + self:GetMeleeBoost()

    return dist <= maxDist
end

-- Get object id
function Unit:GetID()
    return ObjectID(self.unit)
end

-- In party
function Unit:IsInParty()
    return UnitInParty(self.unit)
end

-- Linear regression between time and percent to something
function Unit:LinearRegression(time, percent)
    local x = time
    local y = percent

    local n = #x
    local sum_x = 0
    local sum_y = 0
    local sum_xy = 0
    local sum_xx = 0
    local sum_yy = 0

    for i = 1, n do
        sum_x = sum_x + x[i]
        sum_y = sum_y + y[i]
        sum_xy = sum_xy + x[i] * y[i]
        sum_xx = sum_xx + x[i] * x[i]
        sum_yy = sum_yy + y[i] * y[i]
    end

    local slope = (n * sum_xy - sum_x * sum_y) / (n * sum_xx - sum_x * sum_x)
    local intercept = (sum_y - slope * sum_x) / n

    return slope, intercept
end

-- Use linear regression to get the health percent at a given time in the future
function Unit:PredictHealth(time)
    local x = {}
    local y = {}

    if #self.regression_history > 20 then
        table.remove(self.regression_history, 1)
    end

    table.insert(self.regression_history, { time = GetTime(), percent = self:GetHP() })

    for i = 1, #self.regression_history do
        local entry = self.regression_history[i]
        table.insert(x, entry.time)
        table.insert(y, entry.percent)
    end

    local slope, intercept = self:LinearRegression(x, y)
    return slope * time + intercept
end

-- Use linear regression to guess the time until a given health percent
function Unit:PredictTime(percent)
    local x = {}
    local y = {}

    if #self.regression_history > 20 then
        table.remove(self.regression_history, 1)
    end

    table.insert(self.regression_history, { time = GetTime(), percent = self:GetHP() })

    for i = 1, #self.regression_history do
        local entry = self.regression_history[i]
        table.insert(x, entry.time)
        table.insert(y, entry.percent)
    end

    local slope, intercept = self:LinearRegression(x, y)
    return (percent - intercept) / slope
end

-- Time until death
function Unit:TimeToDie()
    if self:IsDead() then
        self.regression_history = {}
        return 0
    end

    local timeto = self:PredictTime(0) - GetTime()

    if timeto ~= timeto or timeto < 0 or timeto == math.huge then
        return 0
    end

    return timeto
end

-- Set combat time if affecting combat and return the difference between now and the last time
function Unit:GetCombatTime()
    if self:IsAffectingCombat() then
        self.last_combat_time = GetTime()
    elseif not self:IsAffectingCombat() and self.last_combat_time then
        self.last_combat_time = nil
    end

    if not self.last_combat_time then
        return 0
    end

    return GetTime() - self.last_combat_time
end

-- Get units gcd time
function Unit:GetGCD()
    local start, duration = GetSpellCooldown(61304)
    if start == 0 then
        return 0
    end

    return duration - (GetTime() - start)
end

-- Get units max gcd time
--[[
    The GCD without Haste is 1.5 seconds
With 50% Haste the GCD is 1 second
With 100% Haste the GCD is 0.5 seconds
The GCD won't drop below 1 second
More than 50% Haste will drop a spell below 1 second

]]
function Unit:GetMaxGCD()
    local haste = UnitSpellHaste(self.unit)
    if haste > 50 then
        haste = 50
    end

    return 1.5 / (1 + haste / 100)
end

-- IsStealthed
function Unit:IsStealthed()
    local Stealth = Bastion.SpellBook:GetSpell(1784)
    local Vanish = Bastion.SpellBook:GetSpell(1856)
    local ShadowDance = Bastion.SpellBook:GetSpell(185422)
    local Subterfuge = Bastion.SpellBook:GetSpell(115192)
    local Shadowmeld = Bastion.SpellBook:GetSpell(58984)
    local Sepsis = Bastion.SpellBook:GetSpell(328305)


    return self:GetAuras():FindAny(Stealth) or self:GetAuras():FindAny(ShadowDance)
end

-- Get unit swing timers
function Unit:GetSwingTimers()
    local main_speed, off_speed = UnitAttackSpeed(self.unit)
    local main_speed = main_speed or 2
    local off_speed = off_speed or 2

    local main_speed_remains = main_speed - (GetTime() - self.last_main_attack)
    local off_speed_remains = off_speed - (GetTime() - self.last_off_attack)

    if main_speed_remains < 0 then
        main_speed_remains = 0
    end

    if off_speed_remains < 0 then
        off_speed_remains = 0
    end

    return main_speed_remains, off_speed_remains
end

function Unit:WatchForSwings()
    Bastion.EventManager:RegisterWoWEvent("COMBAT_LOG_EVENT_UNFILTERED", function()
        local _, subtype, _, sourceGUID, sourceName, _, _, destGUID, destName, destFlags, _, spellID, spellName, _, amount, interrupt, a, b, c, d, offhand, multistrike = CombatLogGetCurrentEventInfo()

        if sourceGUID == self:GetGUID() then
            if subtype == "SPELL_ENERGIZE" and spellID == 196911 then
                self.last_shadow_techniques = GetTime()
                self.swings_since_sht = 0
            end

            if subtype:sub(1, 5) == "SWING" and not multistrike then
                if subtype == "SWING_MISSED" then
                    offhand = spellName
                end

                local now = GetTime()

                if now > self.last_shadow_techniques + 3 then
                    self.swings_since_sht = self.swings_since_sht + 1
                end

                if offhand then
                    self.last_off_attack = GetTime()
                else
                    self.last_main_attack = GetTime()
                end
            end
        end
    end)
end

-- GetTimeToShurikenTornado
--[[
    spec:RegisterStateTable( "time_to_sht", setmetatable( {}, {
    __index = function( t, k )
        local n = tonumber( k )
        n = n - ( n % 1 )

        if not n or n > 5 then return 3600 end

        if n <= swings_since_sht then return 0 end

        local mh_speed = swings.mainhand_speed
        local mh_next = ( swings.mainhand > now - 3 ) and ( swings.mainhand + mh_speed ) or now + ( mh_speed * 0.5 )

        local oh_speed = swings.offhand_speed
        local oh_next = ( swings.offhand > now - 3 ) and ( swings.offhand + oh_speed ) or now

        table.wipe( sht )

        if mh_speed and mh_speed > 0 then
            for i = 1, 4 do
                insert( sht, mh_next + ( i * mh_speed ) )
            end
        end

        if oh_speed and oh_speed > 0 then
            for i = 1, 4 do
                insert( sht, oh_next + ( i * oh_speed ) )
            end
        end

        local i = 1

        while( sht[i] ) do
            if sht[i] < last_shadow_techniques + 3 then
                table.remove( sht, i )
            else
                i = i + 1
            end
        end

        if #sht > 0 and n - swings_since_sht < #sht then
            table.sort( sht )
            return max( 0, sht[ n - swings_since_sht ] - query_time )
        else
            return 3600
        end
    end
} ) )
]]
function Unit:GetTimeToShurikenTornado(n)
    local now = GetTime()
    local sht = {}
    local swings = self:GetSwingTimers()

    if not self.swings_since_sht then
        self.swings_since_sht = 0
    end

    if not self.last_shadow_techniques then
        self.last_shadow_techniques = 0
    end

    if n <= self.swings_since_sht then
        return 0
    end

    local mh_speed = swings[1]
    local mh_next = (self.last_mh > now - 3) and (self.last_mh + mh_speed) or now + (mh_speed * 0.5)

    local oh_speed = swings[2]
    local oh_next = (self.last_oh > now - 3) and (self.last_oh + oh_speed) or now

    table.wipe(sht)

    if mh_speed and mh_speed > 0 then
        for i = 1, 4 do
            table.insert(sht, mh_next + (i * mh_speed))
        end
    end

    if oh_speed and oh_speed > 0 then
        for i = 1, 4 do
            table.insert(sht, oh_next + (i * oh_speed))
        end
    end

    local i = 1

    while (sht[i]) do
        if sht[i] < self.last_shadow_techniques + 3 then
            table.remove(sht, i)
        else
            i = i + 1
        end
    end

    if #sht > 0 and n - self.swings_since_sht < #sht then
        table.sort(sht)
        return math.max(0, sht[n - self.swings_since_sht] - now)
    else
        return 3600
    end
end

return Unit
