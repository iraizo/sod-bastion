local Tinkr, Bastion = ...

local RestoModule = Bastion.Module:New('resto_druid')
local Evaluator = Tinkr.Util.Evaluator
local Player = Bastion.UnitManager:Get('player')
local None = Bastion.UnitManager:Get('none')
local Target = Bastion.UnitManager:Get('target')

local AnomalyDetectionMarkI = Bastion.SpellBook:GetSpell(382499)
local AutoAttack = Bastion.SpellBook:GetSpell(6603)
local MechanismBypass = Bastion.SpellBook:GetSpell(382501)
local OverloadElementalDeposit = Bastion.SpellBook:GetSpell(388213)
local ReviveBattlePets = Bastion.SpellBook:GetSpell(125439)
local WarStomp = Bastion.SpellBook:GetSpell(20549)
local ArmorSkills = Bastion.SpellBook:GetSpell(76275)
local Brawn = Bastion.SpellBook:GetSpell(154743)
local Cultivation = Bastion.SpellBook:GetSpell(20552)
local Endurance = Bastion.SpellBook:GetSpell(20550)
local Languages = Bastion.SpellBook:GetSpell(79746)
local MasterRiding = Bastion.SpellBook:GetSpell(90265)
local NatureResistance = Bastion.SpellBook:GetSpell(20551)
local WeaponSkills = Bastion.SpellBook:GetSpell(76300)
local ActivateEmpowerment = Bastion.SpellBook:GetSpell(357857)
local BlessingofOhnara = Bastion.SpellBook:GetSpell(384522)
local BronzeTimelock = Bastion.SpellBook:GetSpell(374990)
local ChampionAbility = Bastion.SpellBook:GetSpell(356550)
local CenarionWard = Bastion.SpellBook:GetSpell(102351)
local CombatAlly = Bastion.SpellBook:GetSpell(211390)
local ConstructAbility = Bastion.SpellBook:GetSpell(347013)
local CovenantAbility = Bastion.SpellBook:GetSpell(313347)
local GarrisonAbility = Bastion.SpellBook:GetSpell(161691)
local HeartEssence = Bastion.SpellBook:GetSpell(296208)
local HuntingCompanion = Bastion.SpellBook:GetSpell(376280)
local SanityRestorationOrb = Bastion.SpellBook:GetSpell(314955)
local SignatureAbility = Bastion.SpellBook:GetSpell(326526)
local SkywardAscent = Bastion.SpellBook:GetSpell(372610)
local SummonPocopoc = Bastion.SpellBook:GetSpell(360078)
local SurgeForward = Bastion.SpellBook:GetSpell(372608)
local Throw = Bastion.SpellBook:GetSpell(385265)
local VenthyrAbility = Bastion.SpellBook:GetSpell(315594)
local WartimeAbility = Bastion.SpellBook:GetSpell(264739)
local WhirlingSurge = Bastion.SpellBook:GetSpell(361584)
local PocopocZoneAbilitySkill = Bastion.SpellBook:GetSpell(363942)
local DragonridingBasics = Bastion.SpellBook:GetSpell(376777)
local LiftOff = Bastion.SpellBook:GetSpell(383363)
local ThrilloftheSkies = Bastion.SpellBook:GetSpell(383366)
local Vigor = Bastion.SpellBook:GetSpell(383359)
local WindsoftheIsles = Bastion.SpellBook:GetSpell(373586)
local Barkskin = Bastion.SpellBook:GetSpell(22812)
local BearForm = Bastion.SpellBook:GetSpell(5487)
local CatForm = Bastion.SpellBook:GetSpell(768)
local Cyclone = Bastion.SpellBook:GetSpell(33786)
local EntanglingRoots = Bastion.SpellBook:GetSpell(339)
local FerociousBite = Bastion.SpellBook:GetSpell(22568)
local FrenziedRegeneration = Bastion.SpellBook:GetSpell(22842)
local Growl = Bastion.SpellBook:GetSpell(6795)
local Innervate = Bastion.SpellBook:GetSpell(29166)
local Mangle = Bastion.SpellBook:GetSpell(33917)
local MarkoftheWild = Bastion.SpellBook:GetSpell(1126)
local Moonfire = Bastion.SpellBook:GetSpell(8921)
local MoonfireAura = Bastion.SpellBook:GetSpell(164812)
local Prowl = Bastion.SpellBook:GetSpell(5215)
local Rebirth = Bastion.SpellBook:GetSpell(20484)
local Regrowth = Bastion.SpellBook:GetSpell(8936)
local Rejuvenation = Bastion.SpellBook:GetSpell(774)
local RejuvenationAura = Bastion.SpellBook:GetSpell(25299)
local Revive = Bastion.SpellBook:GetSpell(50769)
local Rip = Bastion.SpellBook:GetSpell(1079)
local Shred = Bastion.SpellBook:GetSpell(5221)
local Soothe = Bastion.SpellBook:GetSpell(2908)
local StampedingRoar = Bastion.SpellBook:GetSpell(106898)
local Sunfire = Bastion.SpellBook:GetSpell(93402)
local SunfireAura = Bastion.SpellBook:GetSpell(164815)
local Swiftmend = Bastion.SpellBook:GetSpell(18562)
local TeleportMoonglade = Bastion.SpellBook:GetSpell(18960)
local Thrash = Bastion.SpellBook:GetSpell(106832)
local TigerDash = Bastion.SpellBook:GetSpell(252216)
local TravelForm = Bastion.SpellBook:GetSpell(783)
local UrsolsVortex = Bastion.SpellBook:GetSpell(102793)
local WildGrowth = Bastion.SpellBook:GetSpell(48438)
local Wrath = Bastion.SpellBook:GetSpell(5176)
local AquaticForm = Bastion.SpellBook:GetSpell(276012)
local FlightForm = Bastion.SpellBook:GetSpell(276029)
local TigerDash = Bastion.SpellBook:GetSpell(252216)
local Efflorescence = Bastion.SpellBook:GetSpell(145205)
local IncarnationTreeofLife = Bastion.SpellBook:GetSpell(33891)
local Ironbark = Bastion.SpellBook:GetSpell(102342)
local Lifebloom = Bastion.SpellBook:GetSpell(33763)
local LifebloomAura = Bastion.SpellBook:GetSpell(188550)
local NaturesCure = Bastion.SpellBook:GetSpell(88423)
local NaturesSwiftness = Bastion.SpellBook:GetSpell(132158)
local Revitalize = Bastion.SpellBook:GetSpell(212040)
local Tranquility = Bastion.SpellBook:GetSpell(740)
local MasteryHarmony = Bastion.SpellBook:GetSpell(77495)
local Moonfire = Bastion.SpellBook:GetSpell(8921)
local Wrath = Bastion.SpellBook:GetSpell(5176)
local BearForm = Bastion.SpellBook:GetSpell(5487)
local AdaptiveSwarm = Bastion.SpellBook:GetSpell(391888)
local AdaptiveSwarmBuff = Bastion.SpellBook:GetSpell(391891)
local ClearCasting = Bastion.SpellBook:GetSpell(16870)
local ConvokeTheSpirits = Bastion.SpellBook:GetSpell(391528)
local Flourish = Bastion.SpellBook:GetSpell(197721)
local SoulOfTheForest = Bastion.SpellBook:GetSpell(114108)
local Bursting = Bastion.SpellBook:GetSpell(240443)
local Rake = Bastion.SpellBook:GetSpell(1822)
local RakeAura = Bastion.SpellBook:GetSpell(155722)
local Starsurge = Bastion.SpellBook:GetSpell(197626)
local NaturesVigil = Bastion.SpellBook:GetSpell(124974)
local SpringBlossoms = Bastion.SpellBook:GetSpell(207386)
local RakeDebuff = Bastion.SpellBook:GetSpell(155722)


local Lowest = Bastion.UnitManager:CreateCustomUnit('lowest', function(unit)
        local lowest = nil
        local lowestHP = math.huge

        Bastion.UnitManager:EnumFriends(function(unit)
            if unit:IsDead() then
                return false
            end

            if Player:GetDistance(unit) > 40 then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            local hp = unit:GetHP()
            if hp < lowestHP then
                lowest = unit
                lowestHP = hp
            end
        end)

        if not lowest then
            lowest = Player
        end

        return lowest
    end)

local DispelTarget = Bastion.UnitManager:CreateCustomUnit('dispel', function(unit)
        local lowest = nil
        local lowestHP = math.huge

        Bastion.UnitManager:EnumFriends(function(unit)
            if unit:IsDead() then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            if Player:GetDistance(unit) > 40 then
                return false
            end

            if not unit:IsDead() and Player:CanSee(unit) and
                unit:GetAuras():HasAnyDispelableAura(NaturesCure) then
                local hp = unit:GetHP()
                if hp < lowestHP then
                    lowest = unit
                    lowestHP = hp
                end
            end
        end)

        if lowest == nil then
            lowest = None
        end

        return lowest
    end)

local PurgeTarget = Bastion.UnitManager:CreateCustomUnit('purge', function(unit)
        local purge = nil

        Bastion.UnitManager:EnumEnemies(function(unit)
            if unit:IsDead() then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            if Player:GetDistance(unit) > 40 then
                return false
            end

            if not unit:IsDead() and Player:CanSee(unit) and
                unit:GetAuras():HasAnyStealableAura() then
                purge = unit
                return true
            end
        end)

        if purge == nil then
            purge = None
        end

        return purge
    end)

local Tank = Bastion.UnitManager:CreateCustomUnit('tank', function(unit)
        local tank = nil

        Bastion.UnitManager:EnumFriends(function(unit)
            if Player:GetDistance(unit) > 40 then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            if unit:IsDead() then
                return false
            end

            if unit:IsTank() then
                tank = unit
                return true
            end

            return false
        end)

        if tank == nil then
            tank = Player
        end

        return tank
    end)

local RejuvUnit = Bastion.UnitManager:CreateCustomUnit('rejuv', function(unit)
        local lowest = nil
        local lowestHP = math.huge

        Bastion.UnitManager:EnumFriends(function(unit)
            if unit:IsDead() then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            if Player:GetDistance(unit) > 40 then
                return false
            end

            if not unit:IsDead() and Player:CanSee(unit) and
                (
                not unit:GetAuras():FindMy(Rejuvenation):IsUp() or
                unit:GetAuras():FindMy(Rejuvenation):GetRemainingTime() <= 3.6) then
                local hp = unit:GetHP()
                if hp < lowestHP then
                    lowest = unit
                    lowestHP = hp
                end
            end
        end)


        if lowest == nil then
            lowest = Player
        end

        return lowest
    end)

local SwiftmendUnit = Bastion.UnitManager:CreateCustomUnit('swiftmend', function(unit)
        local lowest = nil
        local lowestHP = math.huge

        Bastion.UnitManager:EnumFriends(function(unit)
            if unit:IsDead() then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            if Player:GetDistance(unit) > 40 then
                return false
            end

            if (
                Player:CanSee(unit) and (
                (unit:GetAuras():FindMy(Regrowth):IsUp())
                or
                (
                unit:GetAuras():FindMy(Rejuvenation):IsUp() and
                not unit:GetAuras():FindMy(WildGrowth):IsUp())
                )
                ) then
                local hp = unit:GetHP()
                if hp < lowestHP then
                    lowest = unit
                    lowestHP = hp
                end
            end
        end)


        if lowest == nil then
            lowest = None
        end

        return lowest
    end)

local WildGrowthUnit = Bastion.UnitManager:CreateCustomUnit('wildgrowth', function(unit)
        local lowest = nil
        local lowestHP = math.huge

        Bastion.UnitManager:EnumFriends(function(unit)
            if unit:IsDead() then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            if Player:GetDistance(unit) > 40 then
                return false
            end

            if Player:CanSee(unit) and (
                (
                Player:GetAuras():FindMy(SoulOfTheForest):IsUp() and
                (
                Player:GetAuras():FindMy(SoulOfTheForest):GetRemainingTime() <= 5 or
                unit:GetPartyHPAround(30, 90) >= 2)) or
                (unit:GetPartyHPAround(30, 90) >= 3 or unit:GetPartyHPAround(30, 85) >= 2))
            then
                local hp = unit:GetHP()
                if hp < lowestHP then
                    lowest = unit
                    lowestHP = hp
                end
            end
        end)


        if lowest == nil then
            lowest = None
        end

        return lowest
    end)

local Explosive = Bastion.UnitManager:CreateCustomUnit('explosive', function(unit)
        local explosive = nil

        Bastion.ObjectManager.explosives:each(function(unit)
            if unit:IsDead() then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            if Player:GetDistance(unit) <= 40 then
                explosive = unit
                return true
            end
        end)

        if explosive == nil then
            explosive = None
        end

        return explosive
    end)

local RakeTarget = Bastion.UnitManager:CreateCustomUnit('rake', function(unit)
        local rakeTarget = nil

        Bastion.UnitManager:EnumEnemies(function(unit)
            if unit:IsDead() then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            if Player:GetDistance(unit) > 40 then
                return false
            end

            if not unit:IsDead() and Player:CanSee(unit) and unit:InCombatOdds() > 80 and unit:InMelee(Player) and
                Player:IsFacing(unit) and
                (
                not unit:GetAuras():FindMy(RakeDebuff):IsUp() or
                unit:GetAuras():FindMy(RakeDebuff):GetRemainingTime() <= 3.6) then
                rakeTarget = unit
            end
        end)


        if rakeTarget == nil then
            rakeTarget = None
        end

        return rakeTarget
    end)

local MoonfireTarget = Bastion.UnitManager:CreateCustomUnit('moonfire', function(unit)
        local moonfireTarget = nil

        Bastion.UnitManager:EnumEnemies(function(unit)
            if unit:IsDead() then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            if Player:GetDistance(unit) > 40 then
                return false
            end

            if not unit:IsDead() and Player:CanSee(unit) and unit:InCombatOdds() > 80 and
                (
                not unit:GetAuras():FindMy(MoonfireAura):IsUp() or
                unit:GetAuras():FindMy(MoonfireAura):GetRemainingTime() <= 3.6) then
                moonfireTarget = unit
            end
        end)

        if moonfireTarget == nil then
            moonfireTarget = None
        end

        return moonfireTarget
    end)

local SunfireTarget = Bastion.UnitManager:CreateCustomUnit('sunfire', function(unit)
        local sunfireTarget = nil

        Bastion.UnitManager:EnumEnemies(function(unit)
            if unit:IsDead() then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            if Player:GetDistance(unit) > 40 then
                return false
            end

            if not unit:IsDead() and Player:CanSee(unit) and unit:InCombatOdds() > 80 and
                (
                not unit:GetAuras():FindMy(SunfireAura):IsUp() or
                unit:GetAuras():FindMy(SunfireAura):GetRemainingTime() <= 3.6) then
                sunfireTarget = unit
            end
        end)

        if sunfireTarget == nil then
            sunfireTarget = None
        end

        return sunfireTarget
    end)

local RestoCommands = Bastion.Command:New('resto')

local PLACE_EFFLO = false

RestoCommands:Register('efflo', 'Request the engine to place an Efflorescence', function()
    PLACE_EFFLO = true
    Bastion.Notifications:AddNotification(Efflorescence:GetIcon(), "Efflorescence requested")
end)

local DefaultAPL = Bastion.APL:New('default')
local DamageAPL = Bastion.APL:New('damage')

DamageAPL:AddSpell(
    Rake:CastableIf(function(self)
        return RakeTarget:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling() and
            (
            not RakeTarget:GetAuras():FindMy(RakeDebuff):IsUp() or
            RakeTarget:GetAuras():FindMy(RakeDebuff):GetRemainingTime() <= 3.6)
    end):SetTarget(RakeTarget)
)

DamageAPL:AddSpell(
    FerociousBite:CastableIf(function(self)
        return Target:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling() and
            Player:GetComboPoints() >= 5
    end):SetTarget(Target)
)

DamageAPL:AddSpell(
    Shred:CastableIf(function(self)
        return Target:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling() and
            Player:GetComboPoints() < 5
    end):SetTarget(Target)
)


DefaultAPL:AddSpell(
    Efflorescence:CastableIf(function(self)
        return PLACE_EFFLO and Player:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
    end):SetTarget(None):OnCast(function(self)
        local loc = Bastion.UnitManager:FindFriendsCentroid(10, 40)
        PLACE_EFFLO = false
        self:Click(loc)
    end)
)

CatForm:OnCast(function(self)
    if not Player:GetAuras():FindMy(Prowl):IsUp() and not Player:IsAffectingCombat() then
        Prowl:Cast(Player)
    end
end)

DefaultAPL:AddAction(
    'cat_form_shift',
    function()
        if (IsShiftKeyDown()) and not Player:IsMounted() and
            not Player:GetAuras():FindMy(CatForm):IsUp() and
            not Player:IsCastingOrChanneling() then
            CatForm:Cast(Player)
        elseif (not IsShiftKeyDown() and Player:IsAffectingCombat()) and Player:GetAuras():FindMy(CatForm):IsUp() then
            CancelShapeshiftForm()
        end
    end
)

DefaultAPL:AddSpell(
    NaturesCure:CastableIf(function(self)
        return DispelTarget:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling() and
            self:IsInRange(DispelTarget) and DispelTarget:GetAuras():HasAnyDispelableAura(NaturesCure)
    end):SetTarget(DispelTarget)
)

DefaultAPL:AddSpell(
    Soothe:CastableIf(function(self)
        return PurgeTarget:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling() and
            self:IsInRange(PurgeTarget) and PurgeTarget:GetAuras():HasAnyStealableAura()
    end):SetTarget(PurgeTarget)
)

DefaultAPL:AddSpell(
    NaturesSwiftness:CastableIf(function(self)
        return Lowest:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(Lowest) and Lowest:GetHP() < 70
    end):SetTarget(Lowest)
)

DefaultAPL:AddSpell(
    ConvokeTheSpirits:CastableIf(function(self)
        return Player:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling() and
            self:IsInRange(Player) and (Player:GetPartyHPAround(40, 70) >= 2 or Player:GetPartyHPAround(40, 75) >= 3)
            and (Flourish:IsKnownAndUsable() or Flourish:GetTimeSinceLastCast() > 10)
    end):SetTarget(Player)
)

DefaultAPL:AddSpell(
    Flourish:CastableIf(function(self)
        return Player:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling() and
            self:IsInRange(Player) and (Player:GetPartyHPAround(40, 70) >= 2 or Player:GetPartyHPAround(40, 75) >= 3) and
            (not ConvokeTheSpirits:IsKnownAndUsable() and ConvokeTheSpirits:GetTimeSinceLastCast() > 10) and
            WildGrowth:GetTimeSinceLastCast() <= 6
    end):SetTarget(Player)
)

DefaultAPL:AddSpell(
    NaturesVigil:CastableIf(function(self)
        return Player:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling() and
            self:IsInRange(Player) and Flourish:GetTimeSinceLastCast() <= 5
    end):SetTarget(Player)
)

DefaultAPL:AddSpell(
    AdaptiveSwarm:CastableIf(function(self)
        return Lowest:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(Lowest)
    end):SetTarget(Lowest)
)

DefaultAPL:AddSpell(
    Swiftmend:CastableIf(function(self)
        return SwiftmendUnit:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(SwiftmendUnit) and
            (
            SwiftmendUnit:GetHP() <= 60 or
            (
            Lowest:GetPartyHPAround(30, 90) >= 3 or Lowest:GetPartyHPAround(30, 85) >= 2
            )
            )
    end):SetTarget(SwiftmendUnit)
)

DefaultAPL:AddSpell(
    WildGrowth:CastableIf(function(self)
        return WildGrowthUnit:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(WildGrowthUnit) and
            (
            Player:GetAuras():FindMy(SoulOfTheForest):IsUp()
            or
            (WildGrowthUnit:GetPartyHPAround(30, 90) >= 3 or WildGrowthUnit:GetPartyHPAround(30, 85) >= 2)
            ) and
            not Player:IsMoving()
    end):SetTarget(WildGrowthUnit)
)

DefaultAPL:AddSpell(
    Regrowth:CastableIf(function(self)
        return Lowest:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(Lowest) and Lowest:GetHP() < 65 and
            Player:GetAuras():FindMy(SoulOfTheForest):IsUp() and not Player:IsMoving()
    end):SetTarget(Lowest)
)

DefaultAPL:AddSpell(
    Regrowth:CastableIf(function(self)
        return Lowest:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(Lowest) and Lowest:GetHP() < 70 and
            (
            NaturesSwiftness:GetTimeSinceLastCast() < 2 or Player:GetAuras():FindMy(NaturesSwiftness):IsUp() or
            NaturesSwiftness:IsKnownAndUsable()) and not Player:IsMoving() and
            not Player:GetAuras():FindMy(SoulOfTheForest):IsUp()
    end):SetTarget(Lowest)
)

DefaultAPL:AddSpell(
    CenarionWard:CastableIf(function(self)
        return Lowest:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(Lowest) and Lowest:GetHP() <= 90
    end):SetTarget(Lowest)
)

DefaultAPL:AddSpell(
    Ironbark:CastableIf(function(self)
        return Lowest:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(Lowest) and Lowest:GetHP() <= 70 and not Lowest:GetAuras():FindMy(CenarionWard):IsUp()
    end):SetTarget(Lowest)
)

DefaultAPL:AddSpell(
    Rejuvenation:CastableIf(function(self)
        return RejuvUnit:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(RejuvUnit) and (RejuvUnit:GetHP() <= 94) and
            not Player:GetAuras():FindMy(SoulOfTheForest):IsUp()
    end):SetTarget(RejuvUnit)
)

DefaultAPL:AddSpell(
    Lifebloom:CastableIf(function(self)
        return Player:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and
            (
            not Player:GetAuras():FindMy(LifebloomAura):IsUp() or
            Player:GetAuras():FindMy(LifebloomAura):GetRemainingTime() <= 4.5) and Player:IsAffectingCombat()
    end):SetTarget(Player)
)

DefaultAPL:AddSpell(
    Lifebloom:CastableIf(function(self)
        return Tank:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and
            (
            not Tank:GetAuras():FindMy(LifebloomAura):IsUp() or
            Tank:GetAuras():FindMy(LifebloomAura):GetRemainingTime() <= 4.5) and Tank:IsAffectingCombat()
    end):SetTarget(Tank)
)

DefaultAPL:AddSpell(
    Regrowth:CastableIf(function(self)
        return Lowest:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(Lowest) and
            (
            not Player:GetAuras():FindMy(Regrowth):IsUp() and Lowest:GetHP() < 70 or
            (Lowest:GetHP() <= 85 and Player:GetAuras():FindMy(ClearCasting):IsUp())) and
            not Player:GetAuras():FindMy(SoulOfTheForest):IsUp() and
            not Player:IsMoving()
    end):SetTarget(Lowest)
)

DefaultAPL:AddSpell(
    Rejuvenation:CastableIf(function(self)
        return RejuvUnit:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(RejuvUnit) and (RejuvUnit:GetHP() <= 94 or Player:GetPartyHPAround(40, 90) >= 2) and
            not Player:GetAuras():FindMy(SoulOfTheForest):IsUp()
    end):SetTarget(RejuvUnit)
)


DefaultAPL:AddSpell(
    Moonfire:CastableIf(function(self)
        return Explosive:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
    end):SetTarget(Explosive)
)

DefaultAPL:AddSpell(
    Sunfire:CastableIf(function(self)
        return SunfireTarget:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(SunfireTarget) and
            (
            not SunfireTarget:GetAuras():FindMy(SunfireAura):IsUp() or
            SunfireTarget:GetAuras():FindMy(SunfireAura):GetRemainingTime() <= 5.4) and
            SunfireTarget:IsHostile() and
            SunfireTarget:IsAffectingCombat() and Player:GetPP() >= 25
    end):SetTarget(SunfireTarget)
)

DefaultAPL:AddSpell(
    Moonfire:CastableIf(function(self)
        return MoonfireTarget:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(MoonfireTarget) and
            (
            not MoonfireTarget:GetAuras():FindMy(MoonfireAura):IsUp() or
            MoonfireTarget:GetAuras():FindMy(MoonfireAura):GetRemainingTime() <= 5.4) and
            MoonfireTarget:IsHostile() and
            MoonfireTarget:IsAffectingCombat() and Player:GetPP() >= 25
    end):SetTarget(MoonfireTarget)
)

DefaultAPL:AddSpell(
    Starsurge:CastableIf(function(self)
        return Target:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(Target) and Target:IsHostile() and
            Target:IsAffectingCombat() and Player:GetPP() >= 25
    end):SetTarget(Target)
)

DefaultAPL:AddSpell(
    Wrath:CastableIf(function(self)
        return Target:Exists() and self:IsKnownAndUsable() and not Player:IsCastingOrChanneling()
            and Player:CanSee(Target) and not Player:IsMoving() and
            Target:IsHostile() and
            Target:IsAffectingCombat() and Player:GetPP() >= 25
    end):SetTarget(Target)
)

RestoModule:Sync(function()
    if IsShiftKeyDown() and Player:GetAuras():FindMy(CatForm):IsUp() then
        return DamageAPL:Execute()
    end
    DefaultAPL:Execute()
end)

Bastion:Register(RestoModule)
