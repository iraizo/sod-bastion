local Tinkr, Bastion = ...

local OutlawModule = Bastion.Module:New('outlaw')
local Evaluator = Tinkr.Util.Evaluator
local Player = Bastion.UnitManager:Get('player')
local None = Bastion.UnitManager:Get('none')
local Target = Bastion.UnitManager:Get('target')

local RollTheBones = Bastion.SpellBook:GetSpell(315508)
local SliceAndDice = Bastion.SpellBook:GetSpell(315496)
local BetweenTheEyes = Bastion.SpellBook:GetSpell(315341)
local BladeRush = Bastion.SpellBook:GetSpell(271877)
local Vanish = Bastion.SpellBook:GetSpell(1856)
local Dispatch = Bastion.SpellBook:GetSpell(2098)
local Ambush = Bastion.SpellBook:GetSpell(8676)
local Stealth = Bastion.SpellBook:GetSpell(1784)
local PistolShot = Bastion.SpellBook:GetSpell(185763)
local Opportunity = Bastion.SpellBook:GetSpell(195627)
local SinisterStrike = Bastion.SpellBook:GetSpell(193315)
local GrandMelee = Bastion.SpellBook:GetSpell(193358)
local Broadside = Bastion.SpellBook:GetSpell(193356)
local TrueBearing = Bastion.SpellBook:GetSpell(193359)
local RuthlessPrecision = Bastion.SpellBook:GetSpell(193357)
local SkullAndCrossbones = Bastion.SpellBook:GetSpell(199603)
local BuriedTreasure = Bastion.SpellBook:GetSpell(199600)
local AdrenalineRush = Bastion.SpellBook:GetSpell(13750)
local ShadowDance = Bastion.SpellBook:GetSpell(185313)
local Audacity = Bastion.SpellBook:GetSpell(381845)
local Flagellation = Bastion.SpellBook:GetSpell(323654)
local Dreadblades = Bastion.SpellBook:GetSpell(343142)
local JollyRoger = Bastion.SpellBook:GetSpell(199603)
local BladeFlurry = Bastion.SpellBook:GetSpell(13877)
local Kick = Bastion.SpellBook:GetSpell(1766)
local MarkedForDeath = Bastion.SpellBook:GetSpell(137619)
local CrimsonVial = Bastion.SpellBook:GetSpell(185311)
local Shiv = Bastion.SpellBook:GetSpell(5938)
local KidneyShot = Bastion.SpellBook:GetSpell(408)
local InstantPoison = Bastion.SpellBook:GetSpell(315584)
local AtrophicPosion = Bastion.SpellBook:GetSpell(381637)

local IrideusFragment = Bastion.ItemBook:GetItem(193743)
local Healthstone = Bastion.ItemBook:GetItem(5512)

local PurgeTarget = Bastion.UnitManager:CreateCustomUnit('purge', function(unit)
    local purge = nil

    Bastion.UnitManager:EnumNameplates(function(unit)
        if unit:IsDead() then
            return false
        end

        if not Player:CanSee(unit) then
            return false
        end

        if Player:GetDistance(unit) > 40 then
            return false
        end

        if unit:GetAuras():HasAnyStealableAura() then
            purge = unit
            return true
        end
    end)

    if purge == nil then
        purge = None
    end

    return purge
end)

local KickTarget = Bastion.UnitManager:CreateCustomUnit('kick', function(unit)
    local purge = nil

    Bastion.UnitManager:EnumNameplates(function(unit)
        if unit:IsDead() then
            return false
        end

        if not Player:CanSee(unit) then
            return false
        end

        if Player:GetDistance(unit) > 40 then
            return false
        end

        if unit:IsInterruptible(5) then
            purge = unit
            return true
        end
    end)

    if purge == nil then
        purge = None
    end

    return purge
end)

local DefaultAPL = Bastion.APL:New('default')
local AOEAPL = Bastion.APL:New('aoe')
local SpecialAPL = Bastion.APL:New('special')

SpecialAPL:AddSpell(
    Kick:CastableIf(function(self)
        return KickTarget:Exists() and Player:InMelee(KickTarget) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling()
    end):SetTarget(KickTarget)
)

SpecialAPL:AddSpell(
    KidneyShot:CastableIf(function(self)
        return KickTarget:Exists() and Player:InMelee(KickTarget) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and Player:GetComboPoints(KickTarget) <= 2
    end):SetTarget(KickTarget)
)

SpecialAPL:AddSpell(
    Stealth:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and not Player:IsAffectingCombat() and
            not Player:GetAuras():FindMy(Stealth):IsUp() and not IsMounted()
    end):SetTarget(Player)
)

SpecialAPL:AddSpell(
    CrimsonVial:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetHealthPercent() < 70
    end):SetTarget(Player)
)

SpecialAPL:AddSpell(
    Shiv:CastableIf(function(self)
        return PurgeTarget:Exists() and Player:InMelee(PurgeTarget) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and PurgeTarget:GetAuras():HasAnyStealableAura()
    end):SetTarget(PurgeTarget)
)

SpecialAPL:AddSpell(
    InstantPoison:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            not Player:GetAuras():FindMy(InstantPoison):IsUp() and not Player:IsMoving()
    end):SetTarget(Player)
)

SpecialAPL:AddSpell(
    AtrophicPosion:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            not Player:GetAuras():FindMy(AtrophicPosion):IsUp() and not Player:IsMoving()
    end):SetTarget(Player)
)

-- SpecialAPL:AddSpell(
--     Healthstone:UsableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetHealthPercent() < 40
--     end):SetTarget(Player)
-- )

SpecialAPL:AddItem(
    IrideusFragment:UsableIf(function(self)
        return self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 2 or Target:IsBoss())
    end):SetTarget(Player)
)

-- Adrenaline Rush on cooldown.
DefaultAPL:AddSpell(
    AdrenalineRush:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling()
    end):SetTarget(Player)
)

-- Roll the Bones if you have no combat enhancements active.
DefaultAPL:AddSpell(
    RollTheBones:CastableIf(function(self)
        local numBuffs = 0
        if Player:GetAuras():FindMy(Broadside):IsUp() then
            numBuffs = numBuffs + 1
        end
        if Player:GetAuras():FindMy(BuriedTreasure):IsUp() then
            numBuffs = numBuffs + 1
        end
        if Player:GetAuras():FindMy(GrandMelee):IsUp() then
            numBuffs = numBuffs + 1
        end
        if Player:GetAuras():FindMy(RuthlessPrecision):IsUp() then
            numBuffs = numBuffs + 1
        end
        if Player:GetAuras():FindMy(SkullAndCrossbones):IsUp() then
            numBuffs = numBuffs + 1
        end
        if Player:GetAuras():FindMy(TrueBearing):IsUp() then
            numBuffs = numBuffs + 1
        end
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            ((not Player:GetAuras():FindMy(Broadside):IsUp() and
                not Player:GetAuras():FindMy(TrueBearing):IsUp()) or numBuffs < 2)
    end):SetTarget(Player)
)
-- Slice and Dice if at max, or -1 from maximum combo points with  Broadside or  Opportunity active, if missing or has has 12 or less seconds remaining.
DefaultAPL:AddSpell(
    SliceAndDice:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            (Player:GetComboPoints(Target) >= 5 or
                (
                Player:GetComboPoints(Target) >= 4 and
                    (Player:GetAuras():FindMy(Broadside):IsUp() or Player:GetAuras():FindMy(Opportunity):IsUp()))) and
            (
            not Player:GetAuras():FindMy(SliceAndDice):IsUp() or
                Player:GetAuras():FindMy(SliceAndDice):GetRemainingTime() <= 12
            )
    end):SetTarget(Target)
)

-- Between the Eyes on cooldown if at max, or -1 from maximum combo points with  Broadside or  Opportunity active.
DefaultAPL:AddSpell(
    BetweenTheEyes:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            (Player:GetComboPoints(Target) >= 5 or
                (
                Player:GetComboPoints(Target) >= 4 and
                    (Player:GetAuras():FindMy(Broadside):IsUp() or Player:GetAuras():FindMy(Opportunity):IsUp())))
    end):SetTarget(Target)
)

-- Dispatch if at max, or -1 from maximum combo points with  Broadside or  Opportunity active.
DefaultAPL:AddSpell(
    Dispatch:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            (Player:GetComboPoints(Target) >= 5 or
                (
                Player:GetComboPoints(Target) >= 4 and
                    (Player:GetAuras():FindMy(Broadside):IsUp() or Player:GetAuras():FindMy(Opportunity):IsUp())))
    end):SetTarget(Target)
)

-- Shadow Dance at or below 3 combo points, and do not have  Audacity or  Opportunity active and wait until you have at least 80 energy. While active  Ambush becomes your highest priority builder.
DefaultAPL:AddSpell(
    ShadowDance:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetComboPoints(Target) <= 3 and
            not Player:GetAuras():FindMy(Audacity):IsUp() and
            not Player:GetAuras():FindMy(Opportunity):IsUp() and
            Player:GetPower() >= 80
    end):SetTarget(Player)
)

-- Blade Rush if missing 50 or more energy and do not have  Flagellation,  Dreadblades or  Shadow Dance active.
DefaultAPL:AddSpell(
    BladeRush:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetPower() <= 50 and
            not Player:GetAuras():FindMy(Flagellation):IsUp() and
            not Player:GetAuras():FindMy(Dreadblades):IsUp() and
            not Player:GetAuras():FindMy(ShadowDance):IsUp()
    end):SetTarget(Player)
)

-- Vanish followed by  Ambush if you won't overcap combo points and wait until you have at least 50 energy.
DefaultAPL:AddSpell(
    Vanish:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetComboPoints(Target) <= 4 and
            Player:GetPower() >= 50 and not Player:GetAuras():FindMy(Stealth):IsUp()
    end):SetTarget(Player)
)

-- Pistol Shot if you have an  Opportunity proc and won't overcap combo points.
DefaultAPL:AddSpell(
    PistolShot:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetAuras():FindMy(Opportunity):IsUp() and
            Player:GetComboPoints(Target) <= 4
    end):SetTarget(Target)
)

-- Use Ambush Icon Ambush instead of Sinister Strike Icon Sinister Strike whenever it is available to cast from any of the procs or cooldowns.
DefaultAPL:AddSpell(
    Ambush:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling()
    end):SetTarget(Target)
)

-- Sinister Strike if you won't overcap combo points.
DefaultAPL:AddSpell(
    SinisterStrike:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetComboPoints(Target) < 5
    end):SetTarget(Target)
)

-- AOE APL

-- Adrenaline Rush on cooldown.
AOEAPL:AddSpell(
    AdrenalineRush:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling()
    end):SetTarget(Player)
)

--  Roll the Bones if you have no combat enhancements active.
-- Roll the Bones has a large outcome of buffs which include;  Broadside,  Buried Treasure,  Grand Melee,  Ruthless Precision,  Skull and Crossbones, and  True Bearing. The buffs you want to keep this tier are going to be  Broadside and  True Bearing as single buffs or any combination of 2 or more buffs. Any of the other 4 buffs as a single means it's worth recasting  Roll the Bones as soon as you are able to.

AOEAPL:AddSpell(
    RollTheBones:CastableIf(function(self)
        local numBuffs = 0
        if Player:GetAuras():FindMy(Broadside):IsUp() then
            numBuffs = numBuffs + 1
        end
        if Player:GetAuras():FindMy(BuriedTreasure):IsUp() then
            numBuffs = numBuffs + 1
        end
        if Player:GetAuras():FindMy(GrandMelee):IsUp() then
            numBuffs = numBuffs + 1
        end
        if Player:GetAuras():FindMy(RuthlessPrecision):IsUp() then
            numBuffs = numBuffs + 1
        end
        if Player:GetAuras():FindMy(SkullAndCrossbones):IsUp() then
            numBuffs = numBuffs + 1
        end
        if Player:GetAuras():FindMy(TrueBearing):IsUp() then
            numBuffs = numBuffs + 1
        end
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            ((not Player:GetAuras():FindMy(Broadside):IsUp() and
                not Player:GetAuras():FindMy(TrueBearing):IsUp()) or numBuffs < 2)
    end):SetTarget(Player)
)

--  Blade Flurry when missing.
AOEAPL:AddSpell(
    BladeFlurry:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            (not Player:GetAuras():FindMy(self):IsUp() or Player:GetAuras():FindMy(self):GetRemainingTime() <= 2)
    end):SetTarget(Player)
)

--  Slice and Dice if at max, or -1 from maximum combo points with  Broadside or  Opportunity active, if missing or has has 12 or less seconds remaining.
AOEAPL:AddSpell(
    SliceAndDice:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            (Player:GetComboPoints(Target) >= 5 or
                (Player:GetComboPoints(Target) >= 4 and
                    (Player:GetAuras():FindMy(Broadside):IsUp() or
                        Player:GetAuras():FindMy(Opportunity):IsUp()))) and
            (not Player:GetAuras():FindMy(self):IsUp() or
                Player:GetAuras():FindMy(self):GetRemainingTime() <= 12)
    end):SetTarget(Player)
)

--  Between the Eyes on cooldown if at max, or -1 from maximum combo points with  Broadside or  Opportunity active.
AOEAPL:AddSpell(
    BetweenTheEyes:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            (Player:GetComboPoints(Target) >= 5 or
                (Player:GetComboPoints(Target) >= 4 and
                    (Player:GetAuras():FindMy(Broadside):IsUp() or
                        Player:GetAuras():FindMy(Opportunity):IsUp())))
    end):SetTarget(Target)
)

--  Dispatch if at max, or -1 from maximum combo points with  Broadside or  Opportunity active.
AOEAPL:AddSpell(
    Dispatch:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            (Player:GetComboPoints(Target) >= 5 or
                (Player:GetComboPoints(Target) >= 4 and
                    (Player:GetAuras():FindMy(Broadside):IsUp() or
                        Player:GetAuras():FindMy(Opportunity):IsUp())))
    end):SetTarget(Target)
)

--  Shadow Dance at or below 3 combo points, and do not have  Audacity or  Opportunity active and wait until you have at least 80 energy. While active  Ambush becomes your highest priority builder.
AOEAPL:AddSpell(
    ShadowDance:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetComboPoints(Target) <= 3 and
            not Player:GetAuras():FindMy(Audacity):IsUp() and
            not Player:GetAuras():FindMy(Opportunity):IsUp() and
            Player:GetPower() >= 80
    end):SetTarget(Player)
)

--  Blade Rush if missing 50 or more energy and do not have  Flagellation,  Dreadblades or  Shadow Dance active.
AOEAPL:AddSpell(
    BladeRush:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetPower() >= 50 and
            not Player:GetAuras():FindMy(Flagellation):IsUp() and
            not Player:GetAuras():FindMy(Dreadblades):IsUp() and
            not Player:GetAuras():FindMy(ShadowDance):IsUp()
    end):SetTarget(Player)
)

--  Vanish followed by  Ambush if you won't overcap combo points and wait until you have at least 50 energy.
AOEAPL:AddSpell(
    Vanish:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetComboPoints(Target) < 5 and
            Player:GetPower() >= 50 and not Player:GetAuras():FindMy(Stealth):IsUp()
    end):SetTarget(Player)
)

--  Pistol Shot if you have an  Opportunity proc and won't overcap combo points.
AOEAPL:AddSpell(
    PistolShot:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetAuras():FindMy(Opportunity):IsUp() and
            Player:GetComboPoints(Target) < 5
    end):SetTarget(Target)
)

AOEAPL:AddSpell(
    Ambush:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling()
    end):SetTarget(Target)
)

--  Sinister Strike if you won't overcap combo points.
AOEAPL:AddSpell(
    SinisterStrike:CastableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetComboPoints(Target) < 5
    end):SetTarget(Target)
)

OutlawModule:Sync(function()
    SpecialAPL:Execute()
    if Player:GetMeleeAttackers() > 1 then
        AOEAPL:Execute()
    else
        DefaultAPL:Execute()
    end
end)

Bastion:Register(OutlawModule)
