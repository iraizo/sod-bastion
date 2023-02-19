local Tinkr, Bastion = ...

local SubModulue = Bastion.Module:New('sub')
local Evaluator = Tinkr.Util.Evaluator
local Player = Bastion.UnitManager:Get('player')
local None = Bastion.UnitManager:Get('none')
local Target = Bastion.UnitManager:Get('target')

Player:WatchForSwings()

local RollTheBones            = Bastion.SpellBook:GetSpell(315508)
local SliceAndDice            = Bastion.SpellBook:GetSpell(315496)
local BetweenTheEyes          = Bastion.SpellBook:GetSpell(315341)
local BladeRush               = Bastion.SpellBook:GetSpell(271877)
local Vanish                  = Bastion.SpellBook:GetSpell(1856)
local Dispatch                = Bastion.SpellBook:GetSpell(2098)
local Ambush                  = Bastion.SpellBook:GetSpell(8676)
local FlagellationPersist     = Bastion.SpellBook:GetSpell(345569)
local Stealth                 = Bastion.SpellBook:GetSpell(1784)
local PistolShot              = Bastion.SpellBook:GetSpell(185763)
local Opportunity             = Bastion.SpellBook:GetSpell(195627)
local SinisterStrike          = Bastion.SpellBook:GetSpell(193315)
local Blind                   = Bastion.SpellBook:GetSpell(2094)
local GrandMelee              = Bastion.SpellBook:GetSpell(193358)
local Broadside               = Bastion.SpellBook:GetSpell(193356)
local TrueBearing             = Bastion.SpellBook:GetSpell(193359)
local RuthlessPrecision       = Bastion.SpellBook:GetSpell(193357)
local Gouge                   = Bastion.SpellBook:GetSpell(1776)
local DeviousStratagem        = Bastion.SpellBook:GetSpell(193531)
local SkullAndCrossbones      = Bastion.SpellBook:GetSpell(199603)
local ShadowFocus             = Bastion.SpellBook:GetSpell(108209)
local BuriedTreasure          = Bastion.SpellBook:GetSpell(199600)
local AdrenalineRush          = Bastion.SpellBook:GetSpell(13750)
local ShadowDance             = Bastion.SpellBook:GetSpell(185313)
local ShadowDanceAura         = Bastion.SpellBook:GetSpell(185422)
local Shadowmeld              = Bastion.SpellBook:GetSpell(58984)
local Audacity                = Bastion.SpellBook:GetSpell(381845)
local SealFate                = Bastion.SpellBook:GetSpell(14190)
local GlobalCooldown          = Bastion.SpellBook:GetSpell(61304)
local Flagellation            = Bastion.SpellBook:GetSpell(323654)
local Dreadblades             = Bastion.SpellBook:GetSpell(343142)
local MasterOfShadows         = Bastion.SpellBook:GetSpell(196976)
local JollyRoger              = Bastion.SpellBook:GetSpell(199603)
local BladeFlurry             = Bastion.SpellBook:GetSpell(13877)
local Kick                    = Bastion.SpellBook:GetSpell(1766)
local MarkedForDeath          = Bastion.SpellBook:GetSpell(137619)
local CrimsonVial             = Bastion.SpellBook:GetSpell(185311)
local TheRotten               = Bastion.SpellBook:GetSpell(394203)
local Shiv                    = Bastion.SpellBook:GetSpell(5938)
local KidneyShot              = Bastion.SpellBook:GetSpell(408)
local InstantPoison           = Bastion.SpellBook:GetSpell(315584)
local Sanguine                = Bastion.SpellBook:GetSpell(226512)
local AtrophicPosion          = Bastion.SpellBook:GetSpell(381637)
local Evasion                 = Bastion.SpellBook:GetSpell(5277)
local TricksOfTheTrade        = Bastion.SpellBook:GetSpell(57934)
local Backstab                = Bastion.SpellBook:GetSpell(53)
local CheapShot               = Bastion.SpellBook:GetSpell(1833)
local BagOfTricks             = Bastion.SpellBook:GetSpell(312411)
local Alacrity                = Bastion.SpellBook:GetSpell(193539)
local PerforatedVeins         = Bastion.SpellBook:GetSpell(394254)
local AutoAttack              = Bastion.SpellBook:GetSpell(6603)
local DeeperStratagem         = Bastion.SpellBook:GetSpell(193531)
local SecretStratagem         = Bastion.SpellBook:GetSpell(394320)
local SymbolsOfDeath          = Bastion.SpellBook:GetSpell(212283)
local ShadowBlades            = Bastion.SpellBook:GetSpell(121471)
local Vigor                   = Bastion.SpellBook:GetSpell(14983)
local ColdBlood               = Bastion.SpellBook:GetSpell(382245)
local ShurikenTornado         = Bastion.SpellBook:GetSpell(277925)
local ThistleTea              = Bastion.SpellBook:GetSpell(381623)
local Gloomblade              = Bastion.SpellBook:GetSpell(200758)
local Shadowstrike            = Bastion.SpellBook:GetSpell(185438)
local Rupture                 = Bastion.SpellBook:GetSpell(1943)
local Eviscerate              = Bastion.SpellBook:GetSpell(196819)
local ResoundingClarity       = Bastion.SpellBook:GetSpell(381622)
local ArcanePulse             = Bastion.SpellBook:GetSpell(260364)
local NumbingPoison           = Bastion.SpellBook:GetSpell(5761)
local ShurikenStorm           = Bastion.SpellBook:GetSpell(197835)
local BlackPowder             = Bastion.SpellBook:GetSpell(319175)
local Sepsis                  = Bastion.SpellBook:GetSpell(385408)
local SecretTechnique         = Bastion.SpellBook:GetSpell(280719)
local DarkBrew                = Bastion.SpellBook:GetSpell(310454)
local Premeditation           = Bastion.SpellBook:GetSpell(343173)
local ArcaneTorrent           = Bastion.SpellBook:GetSpell(50613)
local DanseMacabre            = Bastion.SpellBook:GetSpell(393969)
local LingeringShadow         = Bastion.SpellBook:GetSpell(385960)
local EchoingReprimand        = Bastion.SpellBook:GetSpell(385616)
local LightsJudgment          = Bastion.SpellBook:GetSpell(255647)
local Subterfuge              = Bastion.SpellBook:GetSpell(108208)
local EchoingReprimand2       = Bastion.SpellBook:GetSpell(323558)
local EchoingReprimand3       = Bastion.SpellBook:GetSpell(323559)
local EchoingReprimand4       = Bastion.SpellBook:GetSpell(323560)
local EchoingReprimand5       = Bastion.SpellBook:GetSpell(354838)
local SilentStorm             = Bastion.SpellBook:GetSpell(385727)
local FindWeakness            = Bastion.SpellBook:GetSpell(91023)
local ImprovedShurikenStorm   = Bastion.SpellBook:GetSpell(319951)
local Feint                   = Bastion.SpellBook:GetSpell(1966)
local FinalityRupture         = Bastion.SpellBook:GetSpell(385951)

local RefreshingHealingPotion = Bastion.ItemBook:GetItem(191380)
local ElementalPotionOfPower  = Bastion.ItemBook:GetItem(191389)
local IrideusFragment         = Bastion.ItemBook:GetItem(193743)
local Healthstone             = Bastion.ItemBook:GetItem(5512)
local WindscarWhetstone       = Bastion.ItemBook:GetItem(137486)
local AlgetharsPuzzleBox      = Bastion.ItemBook:GetItem(193701)

local DeadgeHealth            = 120000 * 12

local function IsDeadge(unit) return false end

local PurgeTarget   = Bastion.UnitManager:CreateCustomUnit('purge', function(unit)
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

            if unit:GetAuras():HasAnyStealableAura() and Shiv:IsInRange(unit) then
                purge = unit
                return true
            end
        end)

        if purge == nil then
            purge = None
        end

        return purge
    end)

local KickTarget    = Bastion.UnitManager:CreateCustomUnit('kick', function(unit)
        local kick = nil

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

            if Player:InMelee(unit) and Player:IsFacing(unit) and Bastion.MythicPlusUtils:CastingCriticalKick(unit, 5) then
                kick = unit
                return true
            end
        end)

        if kick == nil then
            kick = None
        end

        return kick
    end)

local StunTarget    = Bastion.UnitManager:CreateCustomUnit('stun', function(unit)
        local stun = nil

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

            if Player:InMelee(unit) and Player:IsFacing(unit) and Bastion.MythicPlusUtils:CastingCriticalStun(unit, 5) then
                stun = unit
                return true
            end
        end)

        if stun == nil then
            stun = None
        end

        return stun
    end)

local Tank          = Bastion.UnitManager:CreateCustomUnit('tank', function(unit)
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
            tank = None
        end

        return tank
    end)

local RuptureTarget = Bastion.UnitManager:CreateCustomUnit('rupture', function()
        local target = nil

        Bastion.UnitManager:EnumEnemies(function(unit)
            if unit:IsDead() then
                return false
            end

            if not Player:CanSee(unit) then
                return false
            end

            if not Player:InMelee(unit) then
                return false
            end

            if not Player:IsFacing(unit) then
                return false
            end

            if (
                not unit:GetAuras():FindMy(Rupture):IsUp() or
                unit:GetAuras():FindMy(Rupture):GetRemainingTime() < 6
                )
                and unit:GetHealth() > DeadgeHealth
            then
                target = unit
                return true
            end
        end)

        if target == nil then
            target = None
        end

        return target
    end)



local DefaultAPL    = Bastion.APL:New('default')
local ItemsAPL      = Bastion.APL:New('items')
local DefensivesAPL = Bastion.APL:New('defensives')
local InterruptAPL  = Bastion.APL:New('interrupt')
local BuildersAPL   = Bastion.APL:New('builders')
local FinishersAPL  = Bastion.APL:New('finishers')
local CDsAPL        = Bastion.APL:New('cds')
local OpenersAPL    = Bastion.APL:New('openers')
local TrinketsAPL   = Bastion.APL:New('trinkets')

function WasSelfHealUsedWithin(time)
    local timeSinceHealthstone = Healthstone:GetTimeSinceLastUseAttempt()
    local timeSincePotion = RefreshingHealingPotion:GetTimeSinceLastUseAttempt()

    return timeSinceHealthstone < time or timeSincePotion < time
end

function WasInterruptUsedWithin(time)
    local timeSinceKick = Kick:GetTimeSinceLastCastAttempt()
    local timeSinceKidney = KidneyShot:GetTimeSinceLastCastAttempt()
    local timeSinceGouge = Gouge:GetTimeSinceLastCastAttempt()
    local timeSinceBlind = Blind:GetTimeSinceLastCastAttempt()

    return timeSinceKick < time or timeSinceKidney < time or timeSinceGouge < time or timeSinceBlind < time
end

local FeintOn = {
    [397878] = true,
    [152964] = true,
    [153094] = true,
    [191284] = true,
    [200901] = true,
    [196512] = true,
    [198058] = true,
    [212784] = true,
    [214692] = true,
    [397892] = true,
    [209741] = true,
    [377004] = true,
    [388923] = true,
    [388537] = true,
    [396991] = true,
    [3747312] = true,
    [384132] = true,
    [388804] = true,
    [388817] = true,
    [384620] = true,
    [375943] = true,
    [376894] = true,
    [372735] = true,
    [373692] = true,
    [392486] = true,
    [392641] = true,
    [384823] = true,
    [381516] = true,
}

local lastFeintTime = 0

Bastion.EventManager:RegisterWoWEvent('COMBAT_LOG_EVENT_UNFILTERED', function()
    -- Check if the spell cast/channel is started is in a list
    local _, event, _, sourceGUID, _, _, _, destGUID, _, _, _, spellID = CombatLogGetCurrentEventInfo()

    if event == 'SPELL_CAST_START' and FeintOn[spellID] then
        lastFeintTime = GetTime()
    end
end)

-- We should feint if we are about to take aoe damage
DefensivesAPL:AddSpell(
    Feint:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            GetTime() - lastFeintTime < 4
    end):SetTarget(Player)
)

DefensivesAPL:AddSpell(
    CrimsonVial:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetHealthPercent() < 70 and
            not WasSelfHealUsedWithin(5)
    end):SetTarget(Player)
)

DefensivesAPL:AddItem(
    Healthstone:UsableIf(function(self)
        return self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetHealthPercent() < 40 and
            not WasSelfHealUsedWithin(5)
    end):SetTarget(Player)
)

DefensivesAPL:AddItem(
    RefreshingHealingPotion:UsableIf(function(self)
        return self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetHealthPercent() < 40 and
            not WasSelfHealUsedWithin(5)
    end):SetTarget(Player)
)

DefensivesAPL:AddSpell(
    TricksOfTheTrade:CastableIf(function(self)
        return Tank:Exists() and Target:Exists() and self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:IsTanking(Target)
    end):SetTarget(Tank)
)

-- DefensivesAPL:AddSpell(
--     Evasion:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetHealthPercent() < 40
--     end):SetTarget(Player)
-- )

TrinketsAPL:AddItem(
    IrideusFragment:UsableIf(function(self)
        return self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 2 or Target:IsBoss())
    end):SetTarget(Player)
)

TrinketsAPL:AddItem(
    ElementalPotionOfPower:UsableIf(function(self)
        return self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 2 or Target:IsBoss())
    end):SetTarget(Player)
)

TrinketsAPL:AddItem(
    WindscarWhetstone:UsableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and Target:GetHealth() and (Player:GetEnemies(10) > 2 or Target:IsBoss())
    end):SetTarget(Player)
)

TrinketsAPL:AddItem(
    AlgetharsPuzzleBox:UsableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 3 or Target:IsBoss()) and
            not Player:IsMoving()
    end):SetTarget(Player)
)

DefaultAPL:AddSpell(
    Stealth:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and not Player:GetAuras():FindMy(Stealth):IsUp() and
                not Player:IsAffectingCombat() and not IsMounted()
        end
    ):SetTarget(Player)
)

DefaultAPL:AddSpell(
    Kick:CastableIf(function(self)
        return KickTarget:Exists() and self:IsInRange(KickTarget) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and Player:IsFacing(Target) and not WasInterruptUsedWithin(2) and
            not IsDeadge(Target)
    end):SetTarget(KickTarget)
)

DefaultAPL:AddSpell(
    Gouge:CastableIf(function(self)
        return StunTarget:Exists() and self:IsInRange(StunTarget) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and Player:IsFacing(Target) and
            (Player:GetDistance(Target) < 1.5 or not Player:IsBehind(Target))
            and not Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() and
            not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and not WasInterruptUsedWithin(2) and
            not IsDeadge(Target)
    end):SetTarget(StunTarget)
)

DefaultAPL:AddSpell(
    KidneyShot:CastableIf(function(self)
        return StunTarget:Exists() and self:IsInRange(StunTarget) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and Player:IsFacing(Target)
            and not Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() and
            not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and not WasInterruptUsedWithin(2) and
            not IsDeadge(Target)
    end):SetTarget(StunTarget)
)

DefaultAPL:AddSpell(
    Blind:CastableIf(function(self)
        return StunTarget:Exists() and self:IsInRange(StunTarget) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and Player:IsFacing(Target)
            and not Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() and
            not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and not WasInterruptUsedWithin(2) and
            not IsDeadge(Target)
    end):SetTarget(StunTarget)
)

-- DefaultAPL:AddSpell(
--     CheapShot:CastableIf(function(self)
--         return StunTarget:Exists() and self:IsInRange(StunTarget) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and Player:IsFacing(Target) and not Player:IsBehind(Target) and
--             Player:IsStealthed() and Player:GetPower() > 80 -- Cheap shot costs a lot so lets only use it with a surplus
--             and Player:GetComboPoints() < 3 and not Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() and
--             not Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
--     end):SetTarget(StunTarget)
-- )

-- Purge
DefaultAPL:AddSpell(
    Shiv:CastableIf(function(self)
        return PurgeTarget:Exists() and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and Player:IsFacing(Target) and not IsDeadge(Target) and
            not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and not Player:GetAuras():FindMy(SymbolsOfDeath):IsUp()
    end):SetTarget(PurgeTarget)
)

--[[
    Subtlety Rogue Opener Sequence (Single Target)

    1. Ensure you are in  Stealth.
    2. Use  Shadowstrike.
    3. Use  Symbols of Death. | With Symbols of Death, use your offensive potion.
    4. Use  Shadow Blades.
    5. Use  Gloomblade.
    6. Use  Rupture.
    7. Use  Shadow Dance.
    7.5 Use Thistle Tea
    8. Use  Gloomblade. | Use shadow strike if we don't have `The First Dance`
    9. Use  Eviscerate
    10. Use  Shadowstrike
    11. Use  Secret Technique | With Secret Technique use Cold Blood
    12. Vanish
    13. Use  Shadowstrike

    -- Continue with normal rotation
]]
local function CanPerformSTOpener()
    return ShadowDance:IsKnownAndUsable() and
        ShadowBlades:IsKnownAndUsable() and
        SymbolsOfDeath:IsKnownAndUsable() and
        Vanish:GetCharges() > 0 and
        ThistleTea:GetCharges() > 0 and
        ColdBlood:IsKnownAndUsable()
end

local function ShouldPerformSTOpener()
    -- If the target will survive the opener we should perform it
    return Target:TimeToDie() >
        Player:GetMaxGCD() * 13 + 5 and Player:GetEnemies(10) <= 2
end

local function ShouldResetSTOpener()
    -- If we are no longer in combat and we can perform the opener we should reset it so we can perform it again in the future
    return not Player:IsAffectingCombat() and CanPerformSTOpener()
end

local function OpenerAbortCondition(spell)
    -- If the cooldown is over 2 seconds we should abort the opener
    return spell:GetCooldownRemaining() > 2
end

local OpenerSequenceST = Bastion.Sequencer:New({
        function(self)
            if OpenerAbortCondition(Shadowstrike) then
                self:Abort()
                print("Aborting on Shadowstrike")
                return true
            end

            if Shadowstrike:IsKnownAndUsable() then
                Shadowstrike:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(SymbolsOfDeath) then
                self:Abort()
                print("Aborting on SymbolsOfDeath")
                return true
            end

            if SymbolsOfDeath:IsKnownAndUsable() then
                SymbolsOfDeath:ForceCast(Player)
                ElementalPotionOfPower:Use(Player)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(ShadowBlades) then
                self:Abort()
                print("Aborting on ShadowBlades")
                return true
            end

            if ShadowBlades:IsKnownAndUsable() then
                ShadowBlades:ForceCast(Player)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(Gloomblade) then
                self:Abort()
                print("Aborting on Gloomblade")
                return true
            end

            if Gloomblade:IsKnownAndUsable() then
                Gloomblade:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(Rupture) then
                self:Abort()
                print("Aborting on Rupture")
                return true
            end

            if Rupture:IsKnownAndUsable() then
                Rupture:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(ShadowDance) then
                self:Abort()
                print("Aborting on ShadowDance", ShadowDance:GetCooldownRemaining())
                return true
            end

            if ShadowDance:IsKnownAndUsable() then
                ShadowDance:ForceCast(Player)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(ThistleTea) then
                self:Abort()
                print("Aborting on ThistleTea")
                return true
            end

            if ThistleTea:IsKnownAndUsable() then
                ThistleTea:ForceCast(Player)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(Gloomblade) then
                self:Abort()
                print("Aborting on Gloomblade")
                return true
            end

            if Gloomblade:IsKnownAndUsable() then
                Gloomblade:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(Eviscerate) then
                self:Abort()
                print("Aborting on Eviscerate")
                return true
            end

            if Eviscerate:IsKnownAndUsable() then
                Eviscerate:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(Shadowstrike) then
                self:Abort()
                print("Aborting on Shadowstrike")
                return true
            end

            if Shadowstrike:IsKnownAndUsable() then
                Shadowstrike:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(SecretTechnique) then
                self:Abort()
                print("Aborting on SecretTechnique")
                print("Aborting on ColdBlood")
                return true
            end

            if SecretTechnique:IsKnownAndUsable() then
                SecretTechnique:ForceCast(Target)
                ColdBlood:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            -- Somehow we lost our vanish charges, abort the opener
            if Vanish:GetCharges() < 1 then
                self:Abort()
                print("Aborting on Vanish")
                return true
            end

            if Vanish:IsKnownAndUsable() then
                Vanish:ForceCast(Player)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(Shadowstrike) then
                self:Abort()
                print("Aborting on Shadowstrike")
                return true
            end

            if Shadowstrike:IsKnownAndUsable() then
                Shadowstrike:ForceCast(Target)
                return true
            end
            return false
        end,
    }, ShouldResetSTOpener)

--[[
    Subtlety Opener Sequence for AoE

    1. Ensure you are in  Stealth.
    2. Shadowstrike
    3. Symbols of Death
    4. Shadow Blades
    5. Shuriken Tornado
    6. Shadow Dance | Use our offensive potion here
    7. Thistle Tea
    8. Rupture
    9. Black Powder
    10. Cold Blood and Secret Technique
    11. Black Powder
    12. Shadowstrike
    13. Black Powder
    14. Shuriken Storm

    ss, sd, sb, st, sd, tt, ru, bp, stcb, bp, ss, bp, sstor

    -- Continue with the normal rotation
]]
local function CanPerformAOEOpener()
    return ShadowDance:IsKnownAndUsable() and
        ShadowBlades:IsKnownAndUsable() and
        SymbolsOfDeath:IsKnownAndUsable() and
        ThistleTea:GetCharges() > 0 and
        ColdBlood:IsKnownAndUsable() and ShurikenTornado:IsKnownAndUsable()
end

local function ShouldPerformAOEOpener()
    -- If the target will survive the opener we should perform it
    return Target:TimeToDie() >
        Player:GetMaxGCD() * 13 + 5 and Player:GetEnemies(10) > 2
end

local function ShouldResetAOEOpener()
    -- If we are no longer in combat and we can perform the opener we should reset it so we can perform it again in the future
    return not Player:IsAffectingCombat() and CanPerformAOEOpener()
end

local OpenerSequenceAOE = Bastion.Sequencer:New({
        function(self)
            if OpenerAbortCondition(Shadowstrike) then
                self:Abort()
                print("Aborting on Shadowstrike")
                return true
            end

            if Shadowstrike:IsKnownAndUsable() then
                Shadowstrike:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(SymbolsOfDeath) then
                self:Abort()
                print("Aborting on SymbolsOfDeath")
                return true
            end

            if SymbolsOfDeath:IsKnownAndUsable() then
                SymbolsOfDeath:ForceCast(Player)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(ShadowBlades) then
                self:Abort()
                print("Aborting on ShadowBlades")
                return true
            end

            if ShadowBlades:IsKnownAndUsable() then
                ShadowBlades:ForceCast(Player)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(ShurikenTornado) then
                self:Abort()
                print("Aborting on ShurikenTornado")
                return true
            end

            if ShurikenTornado:IsKnownAndUsable() then
                ShurikenTornado:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(ShadowDance) then
                self:Abort()
                print("Aborting on ShadowDance")
                return true
            end

            if ShadowDance:IsKnownAndUsable() then
                ShadowDance:ForceCast(Player)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(ThistleTea) then
                self:Abort()
                print("Aborting on ThistleTea")
                return true
            end

            if ThistleTea:IsKnownAndUsable() then
                ThistleTea:ForceCast(Player)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(Rupture) then
                self:Abort()
                print("Aborting on Rupture")
                return true
            end

            if Rupture:IsKnownAndUsable() then
                Rupture:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(BlackPowder) then
                self:Abort()
                print("Aborting on BlackPowder")
                return true
            end

            if BlackPowder:IsKnownAndUsable() then
                BlackPowder:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(SecretTechnique) then
                self:Abort()
                print("Aborting on SecretTechnique")
                print("Aborting on ColdBlood")
                return true
            end

            if SecretTechnique:IsKnownAndUsable() then
                SecretTechnique:ForceCast(Target)
                ColdBlood:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(BlackPowder) then
                self:Abort()
                print("Aborting on BlackPowder")
                return true
            end

            if BlackPowder:IsKnownAndUsable() then
                BlackPowder:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(Shadowstrike) then
                self:Abort()
                print("Aborting on Shadowstrike")
                return true
            end

            if Shadowstrike:IsKnownAndUsable() then
                Shadowstrike:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(BlackPowder) then
                self:Abort()
                print("Aborting on BlackPowder")
                return true
            end

            if BlackPowder:IsKnownAndUsable() then
                BlackPowder:ForceCast(Target)
                return true
            end
            return false
        end,
        function(self)
            if OpenerAbortCondition(ShurikenStorm) then
                self:Abort()
                print("Aborting on ShurikenStorm")
                return true
            end

            if ShurikenStorm:IsKnownAndUsable() then
                ShurikenStorm:ForceCast(Target)
                return true
            end
            return false
        end,
    }, ShouldResetAOEOpener)

--[[
    == Subtlety Rogue Concepts ==

    Keep Rupture and Slice and Dice up and stack cooldowns if reasonable.
    Combo point Generators(Builders) are used when on low combo point value
    Finishing moves are used to consume combo points when reaching six or more (five or more duringShadow Dance).
]]
-- Builders

-- Should we pool for a Shadow Dance or Symbols of Death?
local function ShouldPoolForCD()
    local SD = ShadowDance:GetCooldownRemaining()
    local power = Player:GetPower()
    local cp = Player:GetComboPoints()
    local es = Player:GetEnemies(10)

    if es > 3 then return false end

    if power > 80 then return false end

    if SD < 3 and power < 80 then
        return true
    end

    return false
end

-- Gloomblade/Backstab: outside of Shadow Dance.
BuildersAPL:AddSpell(
    Gloomblade:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
            (Player:GetEnemies(10) <= 1 or (Player:GetEnemies(10) <= 2 and Player:GetAuras():FindMy(LingeringShadow):GetRemainingTime() > 6)) and
            self:IsInRange(Target)
            and not ShouldPoolForCD()
    end):SetTarget(Target)
)

-- BuildersAPL:AddSpell(
--     Backstab:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and not Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
--     end):SetTarget(Target)
-- )

-- Shadowstrike: during Shadow Dance.
BuildersAPL:AddSpell(
    Shadowstrike:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
            (Player:GetEnemies(10) <= 2 or (Player:GetEnemies(10) <= 2 and Player:GetAuras():FindMy(ShadowDanceAura):IsUp())) and
            self:IsInRange(Target) and Player:GetEnemies(10) < 6 and
            not ShouldPoolForCD()
    end):SetTarget(Target)
)

-- Shuriken Storm: on 2 or more targets (3 or more during Shadow Dance).
BuildersAPL:AddSpell(
    ShurikenStorm:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            ((Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and Player:GetEnemies(10) >= 3) or
            (not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and Player:GetEnemies(10) >= 2)) and
            self:IsInRange(Target) and
            not ShouldPoolForCD()
    end):SetTarget(Target)
)

--[[
    Optimizing around finality is mainly about consuming the buff in time, the optimal way to do so is to
        prepare Rupture for Shadow Dance. This means to use Rupture if the remaining cooldown of Shadow Dance is
        lower than 10 seconds and you have the Finality: Rupture buff.

]]
-- Rupture: any target that survives at least 12 seconds.
FinishersAPL:AddSpell(
    Rupture:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Target:Exists() and
            (Target:GetAuras():FindMy(Rupture):GetRemainingTime() < 8.4 or ((Player:GetAuras():FindMy(FinalityRupture):IsUp() and Player:GetAuras():FindMy(FinalityRupture):GetRemainingTime() < 10) and ShadowDance:GetCooldownRemaining() < 10) or (ShadowDance:GetCooldownRemaining() < 3 and (Target:GetAuras():FindMy(Rupture):GetRemainingTime() - 8 < 4))) and
            self:IsInRange(Target) and not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
            not IsDeadge(Target) and not Player:GetAuras():FindMy(ShurikenTornado):IsUp() and
            not ShadowDance:IsKnownAndUsable() and not Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() and
            Target:GetHealth() > DeadgeHealth
    end):SetTarget(Target)
)

-- Slice and Dice:  1 - 5 targets.
FinishersAPL:AddSpell(
    SliceAndDice:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            (Player:GetAuras():FindMy(SliceAndDice):GetRemainingTime() < 12 or (ShadowDance:GetCooldownRemaining() < 3 and (Player:GetAuras():FindMy(SliceAndDice):GetRemainingTime() - 12 < 4))) and
            Player:GetEnemies(10) <= 5 and
            not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and not Player:GetAuras():FindMy(ShurikenTornado):IsUp() and
            not ShadowDance:IsKnownAndUsable() and not Player:GetAuras():FindMy(SymbolsOfDeath):IsUp()
    end):SetTarget(Player)
)

FinishersAPL:AddSpell(
    Rupture:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            RuptureTarget:Exists() and
            (RuptureTarget:GetAuras():FindMy(Rupture):GetRemainingTime() < 8.4 or ((Player:GetAuras():FindMy(FinalityRupture):IsUp() and Player:GetAuras():FindMy(FinalityRupture):GetRemainingTime() < 10) and ShadowDance:GetCooldownRemaining() < 10) or (ShadowDance:GetCooldownRemaining() < 3 and (RuptureTarget:GetAuras():FindMy(Rupture):GetRemainingTime() - 8 < 4))) and
            self:IsInRange(RuptureTarget) and not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
            not IsDeadge(RuptureTarget) and not Player:GetAuras():FindMy(ShurikenTornado):IsUp() and
            not ShadowDance:IsKnownAndUsable() and not Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() and
            RuptureTarget:GetHealth() > DeadgeHealth
    end):SetTarget(RuptureTarget)
)

-- Secret Technique:  During Shadow Dance, as 2nd finisher with Danse Macabre.
-- FinishersAPL:AddSpell(
--     SecretTechnique:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and self:IsInRange(Target)
--     end):SetTarget(Target)
-- )

-- Black Powder:  3 or more targets.
FinishersAPL:AddSpell(
    BlackPowder:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetEnemies(10) >= 3 and self:IsInRange(Target) and not ShadowDance:IsKnownAndUsable()
    end):SetTarget(Target)
)

-- Eviscerate: 1 and 2 targets or for priority damage.
FinishersAPL:AddSpell(
    Eviscerate:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            (Player:GetEnemies(10) <= 2) and self:IsInRange(Target) and not ShadowDance:IsKnownAndUsable()
    end):SetTarget(Target)
)


-- Symbols of Death: on cooldown.
CDsAPL:AddSpell(
    SymbolsOfDeath:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            not Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() and not IsDeadge(Target) and
            GlobalCooldown:GetCooldownRemaining() <= 0
    end):SetTarget(Player):OnCast(function()
        ShurikenTornado:ForceCast(Player)
    end)
)

CDsAPL:AddSpell(
    ShurikenTornado:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            (Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() or SymbolsOfDeath:GetCooldownRemaining() > 10) and
            Player:GetAuras():FindMy(SymbolsOfDeath):GetRemainingTime() > 3.5 and not IsDeadge(Target) and
            not Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
    end):SetTarget(Player)
)

-- Shadow Dance: on cooldown
CDsAPL:AddSpell(
    ShadowDance:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
            (Player:GetPower() >= 80 or Player:GetEnemies(10) > 2) and
            not IsDeadge(Target) and
            SymbolsOfDeath:GetCooldownRemaining() > 2 and GlobalCooldown:GetCooldownRemaining() <= 0
    end):SetTarget(Player):OnCast(function()
        if Player:GetEnemies(10) > 3 then
            ThistleTea:ForceCast(Player)
        end
        if Player:GetAuras():FindMy(SilentStorm):IsUp() then
            ShurikenStorm:ForceCast(Target)
        else
            Gloomblade:ForceCast(Target)
        end
    end)
)

-- Shadow Blades: on cooldown.
CDsAPL:AddSpell(
    ShadowBlades:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and not IsDeadge(Target)
    end):SetTarget(Player)
)

-- Vanish: After Secret Technique during Shadow Dance
CDsAPL:AddSpell(
    Vanish:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
            SecretTechnique:GetTimeSinceLastCast() <= 3 and Vanish:GetCharges() > 1 and Player:GetEnemies(10) < 7 and
            GlobalCooldown:GetCooldownRemaining() <= 0
    end):SetTarget(Player):OnCast(function()
        Shadowstrike:ForceCast(Target)
    end)
)

local function HasRampedInDance()
    if ShadowDance:GetTimeSinceLastCast() > 8 then
        return false
    end

    local ramped = false
    local lastSD = ShadowDance:GetTimeSinceLastCast()
    local lastEviscerate = Eviscerate:GetTimeSinceLastCast()
    local lastBP = BlackPowder:GetTimeSinceLastCast()
    local lastST = SecretTechnique:GetTimeSinceLastCast()

    -- if bp or ev happened before sd we are not ramped
    return lastBP < lastSD or lastEviscerate < lastSD
end

-- Consider this a cooldown since it's tied to shadow dance ig and it has to be happening before cb/st.
CDsAPL:AddSpell(
    Eviscerate:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            self:IsInRange(Target) and Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
            not HasRampedInDance() -- not sure yet
            and Player:GetComboPoints() >= 5 and Player:GetEnemies(10) < 3
    end):SetTarget(Target)
)

FinishersAPL:AddSpell(
    BlackPowder:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            self:IsInRange(Target) and Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
            not HasRampedInDance() -- not sure yet
            and Player:GetComboPoints() >= 5 and Player:GetEnemies(10) >= 3
    end):SetTarget(Target)
)

-- Cold Blood: before using a finishing move / before Secret Technique (if talented).
CDsAPL:AddSpell(
    ColdBlood:CastableIf(function(self)
        return (self:IsKnownAndUsable() or (SecretTechnique:IsKnownAndUsable() and ColdBlood:GetCooldownRemaining() > 2)) and
            not Player:IsCastingOrChanneling() and SecretTechnique:IsKnownAndUsable() and
            SecretTechnique:IsInRange(Target) and Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
            and Player:GetComboPoints() >= 5 and not IsDeadge(Target) and HasRampedInDance()
    end):SetTarget(Player):OnCast(function()
        SecretTechnique:ForceCast(Target)
    end)
)

-- Thistle Tea: when on low energy (Single Target) / with Shadow Dance (Multi Target or on max charges).
CDsAPL:AddSpell(
    ThistleTea:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            ((Player:GetEnemies(10) <= 1 and Player:GetPower() <= 20)) and
            not IsDeadge(Target) and not Player:GetAuras():FindMy(ThistleTea):IsUp()
    end):SetTarget(Player)
)

-- DefaultAPL:AddSequence(
--     OpenerSequenceST,
--     ShouldPerformSTOpener
-- )

-- DefaultAPL:AddSequence(
--     OpenerSequenceAOE,
--     ShouldPerformAOEOpener
-- )

-- DefaultAPL:AddAPL(
--     OpenersAPL,
--     function()
--         return ShouldPerformSTOpener() or ShouldPerformAOEOpener()
--     end
-- )

DefaultAPL:AddSpell(
    Shadowstrike:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            self:IsInRange(Target) and Player:GetAuras():FindMy(Premeditation):IsUp() and Player:GetEnemies(10) <= 6
    end):SetTarget(Target)
)

DefaultAPL:AddAPL(
    DefensivesAPL,
    function()
        return true
    end
)

DefaultAPL:AddAPL(
    ItemsAPL,
    function()
        return true
    end
)

DefaultAPL:AddAPL(
    TrinketsAPL,
    function()
        return Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() and not IsDeadge(Target)
    end
)

DefaultAPL:AddAPL(
    CDsAPL,
    function() -- trying out a way to hold CDs, maybe it's dog
        return Player:IsAffectingCombat() and not IsShiftKeyDown()
    end
)

-- Use Finishing moves with 6 or more combo points (5 or more during  Shadow Dance) with the following priority:
DefaultAPL:AddAPL(
    FinishersAPL,
    function()
        return Player:GetComboPoints() >= 6 or
            (Player:GetComboPoints() >= 5 and Player:GetAuras():FindMy(ShadowDanceAura):IsUp()) or
            (Player:GetEnemies(10) > 3 and Player:GetComboPoints() >= 4)
    end
)

DefaultAPL:AddSpell(
    BagOfTricks:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            self:IsInRange(Target) and not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
            not Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() and Player:GetEnemies(10) <= 2
    end):SetTarget(Target)
)

-- Builders APL
DefaultAPL:AddAPL(
    BuildersAPL,
    function()
        return Player:GetComboPoints() < 6 or
            (Player:GetComboPoints() < 5 and Player:GetAuras():FindMy(ShadowDanceAura):IsUp()) and
            (not Player:GetAuras():FindMy(ShurikenTornado):IsUp() or Player:GetEnemies(10) <= 2)
    end
)

SubModulue:Sync(function()
    if Player:IsAffectingCombat() and not IsCurrentSpell(6603) then
        StartAttack()
    end
    -- DefensivesAPL:Execute()
    -- InterruptAPL:Execute()

    DefaultAPL:Execute()
end)

Bastion:Register(SubModulue)

local Command = Bastion.Command:New('hero')
local hrEnabled = false

Command:Register('toggle', 'Toggle hero rotations hook', function()
    hrEnabled = not hrEnabled
    Bastion:Print('HeroRotation ' .. (hrEnabled and 'enabled' or 'disabled'))
end)

local HeroHooked = false
C_Timer.NewTicker(1, function()
    if HeroRotation and not HeroHooked then
        hooksecurefunc(HeroRotation, "Cast", (function(Object, OffGCD, DisplayStyle, OutofRange, CustomTime)
            if DisplayStyle == "Pooling" and CustomTime ~= nil then
                return
            end

            if not hrEnabled then
                return
            end
            DefensivesAPL:Execute()
            InterruptAPL:Execute()

            if Object.ItemUseSpell then
                UseItemByName(Object.ItemName)
            elseif Object.SpellName then
                CastSpellByName(Object.SpellName)
            end

            if IsSpellPending() == 64 then
                local x, y, z = ObjectPosition("target")
                Click(x, y, z)
            end

            -- DevTools_Dump(Object)
            -- print("HeroRotation cast " .. Object.SpellID)

            HeroHooked = true
        end))

        hooksecurefunc(HeroRotation, "CastQueue", (function(...)
            if not hrEnabled then
                return
            end
            DefensivesAPL:Execute()
            InterruptAPL:Execute()

            local spellsAndItems = { ... }

            for i = 1, #spellsAndItems do
                local Object = spellsAndItems[i]

                if Object.ItemUseSpell then
                    UseItemByName(Object.ItemName)
                    SpellCancelQueuedSpell()
                elseif Object.SpellName then
                    CastSpellByName(Object.SpellName)
                    SpellCancelQueuedSpell()
                end

                if IsSpellPending() == 64 then
                    local x, y, z = ObjectPosition("target")
                    Click(x, y, z)
                end
            end

            -- DevTools_Dump(Object)
            -- print("HeroRotation cast " .. Object.SpellID)
        end))

        hooksecurefunc(HeroRotation, "CastQueuePooling", function(customTime, Object)
            if not hrEnabled then
                return
            end

            DefensivesAPL:Execute()
            InterruptAPL:Execute()

            if Object.ItemUseSpell then
                UseItemByName(Object.ItemName)
            elseif Object.SpellName then
                CastSpellByName(Object.SpellName)
            end

            if IsSpellPending() == 64 then
                local x, y, z = ObjectPosition("target")
                Click(x, y, z)
            end

            -- DevTools_Dump(Object)
            -- print("HeroRotation cast " .. Object.SpellID)

            HeroHooked = true
        end)
        HeroHooked = true
        print('HeroRotation hooked')
    end
end)
