-- local Tinkr, Bastion = ...

-- local SubModulue = Bastion.Module:New('sub')
-- local Evaluator = Tinkr.Util.Evaluator
-- local Player = Bastion.UnitManager:Get('player')
-- local None = Bastion.UnitManager:Get('none')
-- local Target = Bastion.UnitManager:Get('target')

-- local RollTheBones       = Bastion.SpellBook:GetSpell(315508)
-- local SliceAndDice       = Bastion.SpellBook:GetSpell(315496)
-- local BetweenTheEyes     = Bastion.SpellBook:GetSpell(315341)
-- local BladeRush          = Bastion.SpellBook:GetSpell(271877)
-- local Vanish             = Bastion.SpellBook:GetSpell(1856)
-- local Dispatch           = Bastion.SpellBook:GetSpell(2098)
-- local Ambush             = Bastion.SpellBook:GetSpell(8676)
-- local Stealth            = Bastion.SpellBook:GetSpell(1784)
-- local PistolShot         = Bastion.SpellBook:GetSpell(185763)
-- local Opportunity        = Bastion.SpellBook:GetSpell(195627)
-- local SinisterStrike     = Bastion.SpellBook:GetSpell(193315)
-- local GrandMelee         = Bastion.SpellBook:GetSpell(193358)
-- local Broadside          = Bastion.SpellBook:GetSpell(193356)
-- local TrueBearing        = Bastion.SpellBook:GetSpell(193359)
-- local RuthlessPrecision  = Bastion.SpellBook:GetSpell(193357)
-- local SkullAndCrossbones = Bastion.SpellBook:GetSpell(199603)
-- local BuriedTreasure     = Bastion.SpellBook:GetSpell(199600)
-- local AdrenalineRush     = Bastion.SpellBook:GetSpell(13750)
-- local ShadowDance        = Bastion.SpellBook:GetSpell(185313)
-- local ShadowDanceAura    = Bastion.SpellBook:GetSpell(185422)
-- local Audacity           = Bastion.SpellBook:GetSpell(381845)
-- local Flagellation       = Bastion.SpellBook:GetSpell(323654)
-- local Dreadblades        = Bastion.SpellBook:GetSpell(343142)
-- local JollyRoger         = Bastion.SpellBook:GetSpell(199603)
-- local BladeFlurry        = Bastion.SpellBook:GetSpell(13877)
-- local Kick               = Bastion.SpellBook:GetSpell(1766)
-- local MarkedForDeath     = Bastion.SpellBook:GetSpell(137619)
-- local CrimsonVial        = Bastion.SpellBook:GetSpell(185311)
-- local Shiv               = Bastion.SpellBook:GetSpell(5938)
-- local KidneyShot         = Bastion.SpellBook:GetSpell(408)
-- local InstantPoison      = Bastion.SpellBook:GetSpell(315584)
-- local Sanguine           = Bastion.SpellBook:GetSpell(226512)
-- local AtrophicPosion     = Bastion.SpellBook:GetSpell(381637)
-- local Evasion            = Bastion.SpellBook:GetSpell(5277)
-- local TricksOfTheTrade   = Bastion.SpellBook:GetSpell(57934)
-- local CheapShot          = Bastion.SpellBook:GetSpell(1833)
-- local BagOfTricks        = Bastion.SpellBook:GetSpell(312411)
-- local AutoAttack         = Bastion.SpellBook:GetSpell(6603)
-- local SymbolsOfDeath     = Bastion.SpellBook:GetSpell(212283)
-- local ShadowBlades       = Bastion.SpellBook:GetSpell(121471)
-- local ColdBlood          = Bastion.SpellBook:GetSpell(382245)
-- local ShurikenTornado    = Bastion.SpellBook:GetSpell(277925)
-- local ThistleTea         = Bastion.SpellBook:GetSpell(381623)
-- local Gloomblade         = Bastion.SpellBook:GetSpell(200758)
-- local Shadowstrike       = Bastion.SpellBook:GetSpell(185438)
-- local Rupture            = Bastion.SpellBook:GetSpell(1943)
-- local Eviscerate         = Bastion.SpellBook:GetSpell(196819)
-- local NumbingPoison      = Bastion.SpellBook:GetSpell(5761)
-- local ShurikenStorm      = Bastion.SpellBook:GetSpell(197835)
-- local BlackPowder        = Bastion.SpellBook:GetSpell(319175)
-- local SecretTechnique    = Bastion.SpellBook:GetSpell(280719)
-- local DarkBrew           = Bastion.SpellBook:GetSpell(310454)
-- local Premeditation      = Bastion.SpellBook:GetSpell(343173)
-- local DanseMacabre       = Bastion.SpellBook:GetSpell(393969)

-- local IrideusFragment = Bastion.ItemBook:GetItem(193743)
-- local Healthstone = Bastion.ItemBook:GetItem(5512)
-- local WindscarWhetstone = Bastion.ItemBook:GetItem(137486)
-- local DarkMoonRime = Bastion.ItemBook:GetItem(198477)
-- local AlgetharsPuzzleBox = Bastion.ItemBook:GetItem(193701)

-- local RimeCards = {
--     One = Bastion.SpellBook:GetSpell(382844),
--     Two = Bastion.SpellBook:GetSpell(382845),
--     Three = Bastion.SpellBook:GetSpell(382846),
--     Four = Bastion.SpellBook:GetSpell(382847),
--     Five = Bastion.SpellBook:GetSpell(382848),
--     Six = Bastion.SpellBook:GetSpell(382849),
--     Seven = Bastion.SpellBook:GetSpell(382850),
--     Eight = Bastion.SpellBook:GetSpell(382851),
-- }

-- local PurgeTarget = Bastion.UnitManager:CreateCustomUnit('purge', function(unit)
--     local purge = nil

--     Bastion.UnitManager:EnumEnemies(function(unit)
--         if unit:IsDead() then
--             return false
--         end

--         if not Player:CanSee(unit) then
--             return false
--         end

--         if Player:GetDistance(unit) > 40 then
--             return false
--         end

--         if unit:GetAuras():HasAnyStealableAura() then
--             purge = unit
--             return true
--         end
--     end)

--     if purge == nil then
--         purge = None
--     end

--     return purge
-- end)

-- local KickTarget = Bastion.UnitManager:CreateCustomUnit('kick', function(unit)
--     local kick = nil

--     Bastion.UnitManager:EnumEnemies(function(unit)
--         if unit:IsDead() then
--             return false
--         end

--         if not Player:CanSee(unit) then
--             return false
--         end

--         if Player:GetDistance(unit) > 40 then
--             return false
--         end

--         if Player:InMelee(unit) and Player:IsFacing(unit) and Bastion.MythicPlusUtils:CastingCriticalKick(unit, 5) then
--             kick = unit
--             return true
--         end
--     end)

--     if kick == nil then
--         kick = None
--     end

--     return kick
-- end)

-- local Tank = Bastion.UnitManager:CreateCustomUnit('tank', function(unit)
--     local tank = nil

--     Bastion.UnitManager:EnumFriends(function(unit)
--         if Player:GetDistance(unit) > 40 then
--             return false
--         end

--         if not Player:CanSee(unit) then
--             return false
--         end

--         if unit:IsDead() then
--             return false
--         end

--         if unit:IsTank() then
--             tank = unit
--             return true
--         end

--         return false
--     end)

--     if tank == nil then
--         tank = None
--     end

--     return tank
-- end)

-- local RuptureTarget = Bastion.UnitManager:CreateCustomUnit('rupture', function()
--     local target = nil

--     Bastion.UnitManager:EnumEnemies(function(unit)
--         if unit:IsDead() then
--             return false
--         end

--         if not Player:CanSee(unit) then
--             return false
--         end

--         if not Player:InMelee(unit) then
--             return false
--         end

--         if not Player:IsFacing(unit) then
--             return false
--         end

--         if (
--             not unit:GetAuras():FindMy(Rupture):IsUp() or
--                 unit:GetAuras():FindMy(Rupture):GetRemainingTime() < 6
--             )
--             and unit:TimeToDie() > 12
--             and unit:GetCombatTime() > 4
--         then
--             target = unit
--             return true
--         end
--     end)

--     if target == nil then
--         target = None
--     end

--     return target
-- end)

-- local DefaultAPL = Bastion.APL:New('default')
-- local AOEAPL = Bastion.APL:New('aoe')
-- local SpecialAPL = Bastion.APL:New('special')
-- local RacialsAPL = Bastion.APL:New('racials')

-- local Facing = function(t)
--     return Bastion.APLTrait:New(function()
--         return Player:IsFacing(t)
--     end)
-- end

-- SpecialAPL:AddSpell(
--     Kick:CastableIf(function(self)
--         return KickTarget:Exists() and self:IsInRange(KickTarget) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling()
--     end):SetTarget(KickTarget)
-- ):AddTraits(
--     Facing(KickTarget)
-- )

-- SpecialAPL:AddSpell(
--     KidneyShot:CastableIf(function(self)
--         return KickTarget:Exists() and self:IsInRange(KickTarget) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Kick:GetTimeSinceLastCast() > 2 and
--             (Player:GetComboPoints(Target) >= 5 or
--                 (
--                 Player:GetComboPoints(Target) >= 4 and
--                     (Player:GetAuras():FindMy(Broadside):IsUp() or Player:GetAuras():FindMy(Opportunity):IsUp())))
--             and not Target:GetAuras():Find(Sanguine):IsUp()

--     end):SetTarget(KickTarget)
-- )

-- SpecialAPL:AddSpell(
--     CheapShot:CastableIf(function(self)
--         return KickTarget:Exists() and self:IsInRange(KickTarget) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and Player:GetAuras():FindMy(Stealth):IsUp()
--             and not Target:GetAuras():Find(Sanguine):IsUp()
--     end):SetTarget(KickTarget)
-- )

-- SpecialAPL:AddSpell(
--     Stealth:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and not Player:IsAffectingCombat() and
--             not Player:GetAuras():FindMy(Stealth):IsUp() and not IsMounted()
--     end):SetTarget(Player)
-- )

-- SpecialAPL:AddSpell(
--     CrimsonVial:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetHealthPercent() < 70
--     end):SetTarget(Player)
-- )

-- SpecialAPL:AddSpell(
--     Shiv:CastableIf(function(self)
--         return PurgeTarget:Exists() and self:IsInRange(PurgeTarget) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and PurgeTarget:GetAuras():HasAnyStealableAura()
--     end):SetTarget(PurgeTarget)
-- )

-- SpecialAPL:AddSpell(
--     InstantPoison:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             not Player:GetAuras():FindMy(InstantPoison):IsUp() and not Player:IsMoving()
--     end):SetTarget(Player)
-- )

-- SpecialAPL:AddSpell(
--     AtrophicPosion:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             not Player:GetAuras():FindMy(AtrophicPosion):IsUp() and not Player:IsMoving()
--     end):SetTarget(Player)
-- )

-- SpecialAPL:AddSpell(
--     NumbingPoison:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             not Player:GetAuras():FindMy(NumbingPoison):IsUp() and not Player:IsMoving()
--     end):SetTarget(Player)
-- )

-- SpecialAPL:AddItem(
--     Healthstone:UsableIf(function(self)
--         return self:IsEquippedAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetHealthPercent() < 40
--     end):SetTarget(Player)
-- )

-- SpecialAPL:AddSpell(
--     TricksOfTheTrade:CastableIf(function(self)
--         return Tank:Exists() and self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:IsTanking(Target)
--     end):SetTarget(Tank)
-- )

-- SpecialAPL:AddSpell(
--     Evasion:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetHealthPercent() < 40
--     end):SetTarget(Player)
-- )

-- SpecialAPL:AddItem(
--     IrideusFragment:UsableIf(function(self)
--         return self:IsEquippedAndUsable() and
--             not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 2 or Target:IsBoss())
--     end):SetTarget(Player)
-- )

-- SpecialAPL:AddItem(
--     WindscarWhetstone:UsableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and self:IsEquippedAndUsable() and
--             not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 2 or Target:IsBoss())
--     end):SetTarget(Player)
-- )

-- SpecialAPL:AddItem(
--     AlgetharsPuzzleBox:UsableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and self:IsEquippedAndUsable() and
--             not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 3 or Target:IsBoss())
--     end):SetTarget(Player)
-- )

-- SpecialAPL:AddItem(
--     DarkMoonRime:UsableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and self:IsEquippedAndUsable() and
--             not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 2 or Target:IsBoss()) and
--             (Player:GetAuras():FindMy(RimeCards.One):IsUp() or
--                 Player:GetAuras():FindMy(RimeCards.Two):IsUp() or
--                 Player:GetAuras():FindMy(RimeCards.Three):IsUp() or
--                 Player:GetAuras():FindMy(RimeCards.Four):IsUp() or
--                 Player:GetAuras():FindMy(RimeCards.Five):IsUp() or
--                 Player:GetAuras():FindMy(RimeCards.Six):IsUp() or
--                 Player:GetAuras():FindMy(RimeCards.Seven):IsUp() or
--                 Player:GetAuras():FindMy(RimeCards.Eight):IsUp()
--             )
--     end):SetTarget(Target)
-- )

-- -- Use  Shadowstrike during  Shadow Dance.
-- SpecialAPL:AddSpell(
--     Shadowstrike:CastableIf(function(self)
--         return Target:Exists() and self:IsInRange(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and Player:GetAuras():FindMy(Premeditation):IsUp() and
--             Player:GetEnemies(10) <= 3
--     end):SetTarget(Target)
-- )

-- RacialsAPL:AddSpell(
--     BagOfTricks:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling()
--     end):SetTarget(Target)
-- )

-- -- Use  Symbols of Death on cooldown as much as possible.
-- DefaultAPL:AddSpell(
--     SymbolsOfDeath:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling()
--     end):SetTarget(Player):OnCast(function()
--         ShurikenTornado:Cast(Target)
--     end)
-- )

-- -- Use  Shadow Blades on cooldown.
-- DefaultAPL:AddSpell(
--     ShadowBlades:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling()
--     end):SetTarget(Player)
-- )

-- -- Use  Cold Blood before a finishing move, ideally before  Secret Technique.
-- DefaultAPL:AddSpell(
--     ColdBlood:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetComboPoints(Target) >= 5 and SecretTechnique:IsKnownAndUsable() and
--             Player:GetAuras():FindMy(SliceAndDice):IsUp() and
--             Target:GetAuras():FindMy(Rupture):IsUp()
--     end):SetTarget(Player):OnCast(function()
--         SecretTechnique:Cast(Target)
--     end)
-- )

-- -- Line up  Shuriken Tornado with  Symbols of Death.
-- DefaultAPL:AddSpell(
--     ShurikenTornado:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetAuras():FindMy(SymbolsOfDeath):IsUp()
--     end):SetTarget(Player)
-- )

-- -- Use  Shadow Dance on cooldown as much as possible.
-- DefaultAPL:AddSpell(
--     ShadowDance:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and Gloomblade:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and Player:GetComboPoints(Target) <= 2
--     end):SetTarget(Player):OnCast(function()
--         Gloomblade:Cast(Target) -- We want to cast gloomblade immediately with shadow dance to trigger 1 stack of danse macabre
--     end)
-- )

-- -- Use  Thistle Tea when low on energy.
-- -- actions.cds+=/thistle_tea,if=cooldown.symbols_of_death.remains>=3&!buff.thistle_tea.up&(energy.deficit>=100|cooldown.thistle_tea.charges_fractional>=2.75&buff.shadow_dance.up)|buff.shadow_dance.remains>=4&!buff.thistle_tea.up&spell_targets.shuriken_storm>=3|!buff.thistle_tea.up&fight_remains<=(6*cooldown.thistle_tea.charges)
-- DefaultAPL:AddSpell(
--     ThistleTea:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetPowerDeficit() >= 100 and
--             ThistleTea:GetTimeSinceLastCast() >= 3
--     end):SetTarget(Player)

-- )

-- -- Use Finishing moves with 6 or more combo points (5 or more during  Shadow Dance) with the following priority:
-- -- Cast  Slice and Dice if it needs to be refreshed for maintenance or if it is not up.
-- DefaultAPL:AddSpell(
--     SliceAndDice:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             (Player:GetComboPoints(Target) >= 6 or
--                 (Player:GetComboPoints(Target) >= 5 and
--                     Player:GetAuras():FindMy(ShadowDanceAura):IsUp())) and
--             (
--             not Player:GetAuras():FindMy(SliceAndDice):IsUp() or
--                 Player:GetAuras():FindMy(SliceAndDice):GetRemainingTime() < 12
--             )
--     end):SetTarget(Player)
-- )

-- -- Cast  Rupture if it needs to be refreshed for maintenance or if it is not up.
-- DefaultAPL:AddSpell(
--     Rupture:CastableIf(function(self)
--         return Target:Exists() and self:IsInRange(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             (Player:GetComboPoints(Target) >= 6 or
--                 (Player:GetComboPoints(Target) >= 5 and
--                     Player:GetAuras():FindMy(ShadowDanceAura):IsUp())) and (
--             not Target:GetAuras():FindMy(Rupture):IsUp() or
--                 Target:GetAuras():FindMy(Rupture):GetRemainingTime() < 6
--             ) and not Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
--     end):SetTarget(Target)
-- )

-- DefaultAPL:AddSpell(
--     SecretTechnique:CastableIf(function(self)
--         return Target:Exists() and self:IsInRange(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             (Player:GetComboPoints(Target) >= 5) and
--             Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
--             (Player:GetAuras():FindMy(DanseMacabre):GetCount() >= 3 or
--                 not DanseMacabre:IsKnown()) and
--             (not ColdBlood:IsKnown() or
--                 ColdBlood:GetCooldownRemaining() > Player:GetAuras():FindMy(ShadowDanceAura):GetRemainingTime() - 2)
--     end):SetTarget(Target)
-- )

-- -- Cast Eviscerate if it is available.
-- DefaultAPL:AddSpell(
--     Eviscerate:CastableIf(function(self)
--         return Target:Exists() and self:IsInRange(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             (Player:GetComboPoints(Target) >= 6 or
--                 (Player:GetComboPoints(Target) >= 5 and
--                     Player:GetAuras():FindMy(ShadowDanceAura):IsUp()))
--     end):SetTarget(Target)
-- )

-- -- Vanish - Is a fairly weak cooldown. It is best to use on low combo points for a  Shadowstrike cast. Use it after  Secret Technique in  Shadow Dance when playing with  Danse Macabre.
-- DefaultAPL:AddSpell(
--     Vanish:CastableIf(function(self)
--         return Tank:Exists() and Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetComboPoints(Target) < 4
--     end):SetTarget(Player)
-- )

-- -- Use Combo Point builder with the following priority:
-- -- Use  Gloomblade outside of  Shadow Dance.
-- DefaultAPL:AddSpell(
--     Gloomblade:CastableIf(function(self)
--         return Target:Exists() and self:IsInRange(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             not Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
--     end):SetTarget(Target)
-- )

-- -- Use  Shadowstrike during  Shadow Dance.
-- DefaultAPL:AddSpell(
--     Shadowstrike:CastableIf(function(self)
--         return Target:Exists() and self:IsInRange(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
--     end):SetTarget(Target)
-- )

-- -- AOE

-- -- Use  Symbols of Death on cooldown as much as possible.
-- AOEAPL:AddSpell(
--     SymbolsOfDeath:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling()
--     end):SetTarget(Player):OnCast(function()
--         ShurikenTornado:Cast(Target)
--     end)
-- )

-- -- Use  Shadow Blades on cooldown.
-- AOEAPL:AddSpell(
--     ShadowBlades:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling()
--     end):SetTarget(Player)
-- )

-- -- Use  Cold Blood before a finishing move.
-- AOEAPL:AddSpell(
--     ColdBlood:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetComboPoints(Target) >= 5 and SecretTechnique:IsKnownAndUsable() and
--             Player:GetAuras():FindMy(SliceAndDice):IsUp() and
--             Target:GetAuras():FindMy(Rupture):IsUp()
--     end):SetTarget(Player):OnCast(function()
--         SecretTechnique:Cast(Target)
--     end)
-- )

-- -- Line up  Shuriken Tornado with  Symbols of Death.
-- AOEAPL:AddSpell(
--     ShurikenTornado:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetAuras():FindMy(SymbolsOfDeath):IsUp()
--     end):SetTarget(Target)
-- )

-- -- Use  Shadow Dance on cooldown as much as possible.
-- AOEAPL:AddSpell(
--     ShadowDance:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and Gloomblade:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and Player:GetComboPoints(Target) <= 2
--     end):SetTarget(Player):OnCast(function()
--         Gloomblade:Cast(Target) -- We want to cast gloomblade immediately with shadow dance to trigger 1 stack of danse macabre
--     end)
-- )

-- -- Use  Thistle Tea with  Shadow Dance.
-- AOEAPL:AddSpell(
--     ThistleTea:CastableIf(function(self)
--         return Target:Exists() and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetPowerDeficit() >= 100 and
--             ThistleTea:GetTimeSinceLastCast() >= 3
--     end):SetTarget(Player)
-- )

-- -- Use Finishing moves with 5 or more combo points with the following priority:
-- -- Cast  Slice and Dice if it needs to be refreshed for maintenance or if it is not up.
-- AOEAPL:AddSpell(
--     SliceAndDice:CastableIf(function(self)
--         return Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             (Player:GetComboPoints(Target) >= 5) and
--             (
--             not Player:GetAuras():FindMy(SliceAndDice):IsUp() or
--                 Player:GetAuras():FindMy(SliceAndDice):GetRemainingTime() < 6
--             )
--             and Player:GetEnemies(10) < 6
--     end):SetTarget(Target)
-- )

-- -- Cast  Rupture if it needs to be refreshed for maintenance or if it is not up.
-- AOEAPL:AddSpell(
--     Rupture:CastableIf(function(self)
--         return Target:Exists() and self:IsInRange(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             (Player:GetComboPoints(Target) >= 5) and (
--             not Target:GetAuras():FindMy(Rupture):IsUp() or
--                 Target:GetAuras():FindMy(Rupture):GetRemainingTime() < 6
--             )
--             and not Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
--             and not Player:GetAuras():FindMy(SymbolsOfDeath):IsUp()
--             and not Player:GetAuras():FindMy(ThistleTea):IsUp()
--     end):SetTarget(Target)
-- )

-- -- Cast  Rupture on all targets. (scam??)
-- AOEAPL:AddSpell(
--     Rupture:CastableIf(function(self)
--         return RuptureTarget:Exists() and self:IsInRange(RuptureTarget) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             (Player:GetComboPoints(RuptureTarget) >= 6) and (
--             not RuptureTarget:GetAuras():FindMy(Rupture):IsUp() or
--                 RuptureTarget:GetAuras():FindMy(Rupture):GetRemainingTime() < 6
--             )
--             and not Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
--     end):SetTarget(RuptureTarget)
-- )

-- -- actions.finish+=/secret_technique,if=buff.shadow_dance.up&(buff.danse_macabre.stack>=3|!talent.danse_macabre)&(!talent.cold_blood|cooldown.cold_blood.remains>buff.shadow_dance.remains-2)
-- AOEAPL:AddSpell(
--     SecretTechnique:CastableIf(function(self)
--         return Target:Exists() and self:IsInRange(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             (Player:GetComboPoints(Target) >= 5) and
--             Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
--             (Player:GetAuras():FindMy(DanseMacabre):GetCount() >= 3 or
--                 not DanseMacabre:IsKnown()) and
--             (not ColdBlood:IsKnown() or
--                 ColdBlood:GetCooldownRemaining() > Player:GetAuras():FindMy(ShadowDanceAura):GetRemainingTime() - 2)
--     end):SetTarget(Target)
-- )

-- -- Cast  Black Powder with 3 or more targets, 2 or more when talented into  Dark Brew.
-- AOEAPL:AddSpell(
--     BlackPowder:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             (Player:GetComboPoints(Target) >= 5) and
--             (Player:GetEnemies(10) >= 3 or
--                 (Player:GetEnemies(10) >= 2 and
--                     DarkBrew:IsKnown()))
--     end):SetTarget(Target)
-- )

-- -- Cast  Eviscerate.
-- AOEAPL:AddSpell(
--     Eviscerate:CastableIf(function(self)
--         return Target:Exists() and self:IsInRange(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetComboPoints(Target) >= 5
--     end):SetTarget(Target)
-- )

-- -- Vanish - Is a fairly weak cooldown. It is best to use on low combo points for a  Shadowstrike cast. Use it after  Secret Technique in  Shadow Dance when playing with  Danse Macabre.
-- AOEAPL:AddSpell(
--     Vanish:CastableIf(function(self)
--         return Tank:Exists() and Target:Exists() and Player:InMelee(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetComboPoints(Target) < 4
--     end):SetTarget(Player)
-- )

-- -- Use Combo Point builder with the following priority:
-- -- Use  Shuriken Storm on 2 targets outside of  Shadow Dance.
-- AOEAPL:AddSpell(
--     ShurikenStorm:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetEnemies(10) == 2 and
--             not Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
--     end):SetTarget(Player)
-- )

-- -- Use  Shadowstrike on 2 and 3 targets during  Shadow Dance or to proc  Premeditation.
-- AOEAPL:AddSpell(
--     Shadowstrike:CastableIf(function(self)
--         return Target:Exists() and self:IsInRange(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetEnemies(10) >= 2 and Player:GetEnemies(10) <= 3 and
--             Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
--     end):SetTarget(Target)
-- )

-- -- Use  Shuriken Storm at > 2 targets.
-- AOEAPL:AddSpell(
--     ShurikenStorm:CastableIf(function(self)
--         return self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetEnemies(10) > 2
--     end):SetTarget(Player)
-- )

-- -- Use gloomblade at <= 2 targets.
-- AOEAPL:AddSpell(
--     Gloomblade:CastableIf(function(self)
--         return Target:Exists() and self:IsInRange(Target) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and
--             Player:GetEnemies(10) <= 2
--     end):SetTarget(Target)
-- )

-- SubModulue:Sync(function()
--     SpecialAPL:Execute()
--     if Player:GetEnemies(10) >= 2 then
--         AOEAPL:Execute()
--     else
--         DefaultAPL:Execute()
--     end
--     RacialsAPL:Execute()
-- end)

-- Bastion:Register(SubModulue)

local Tinkr, Bastion = ...

local SubModulue = Bastion.Module:New('sub')
local Evaluator = Tinkr.Util.Evaluator
local Player = Bastion.UnitManager:Get('player')
local None = Bastion.UnitManager:Get('none')
local Target = Bastion.UnitManager:Get('target')

Player:WatchForSwings()

local RollTheBones          = Bastion.SpellBook:GetSpell(315508)
local SliceAndDice          = Bastion.SpellBook:GetSpell(315496)
local BetweenTheEyes        = Bastion.SpellBook:GetSpell(315341)
local BladeRush             = Bastion.SpellBook:GetSpell(271877)
local Vanish                = Bastion.SpellBook:GetSpell(1856)
local Dispatch              = Bastion.SpellBook:GetSpell(2098)
local Ambush                = Bastion.SpellBook:GetSpell(8676)
local FlagellationPersist   = Bastion.SpellBook:GetSpell(345569)
local Stealth               = Bastion.SpellBook:GetSpell(1784)
local PistolShot            = Bastion.SpellBook:GetSpell(185763)
local Opportunity           = Bastion.SpellBook:GetSpell(195627)
local SinisterStrike        = Bastion.SpellBook:GetSpell(193315)
local GrandMelee            = Bastion.SpellBook:GetSpell(193358)
local Broadside             = Bastion.SpellBook:GetSpell(193356)
local TrueBearing           = Bastion.SpellBook:GetSpell(193359)
local RuthlessPrecision     = Bastion.SpellBook:GetSpell(193357)
local DeviousStratagem      = Bastion.SpellBook:GetSpell(193531)
local SkullAndCrossbones    = Bastion.SpellBook:GetSpell(199603)
local ShadowFocus           = Bastion.SpellBook:GetSpell(108209)
local BuriedTreasure        = Bastion.SpellBook:GetSpell(199600)
local AdrenalineRush        = Bastion.SpellBook:GetSpell(13750)
local ShadowDance           = Bastion.SpellBook:GetSpell(185313)
local ShadowDanceAura       = Bastion.SpellBook:GetSpell(185422)
local Shadowmeld            = Bastion.SpellBook:GetSpell(58984)
local Audacity              = Bastion.SpellBook:GetSpell(381845)
local SealFate              = Bastion.SpellBook:GetSpell(14190)
local Flagellation          = Bastion.SpellBook:GetSpell(323654)
local Dreadblades           = Bastion.SpellBook:GetSpell(343142)
local MasterOfShadows       = Bastion.SpellBook:GetSpell(196976)
local JollyRoger            = Bastion.SpellBook:GetSpell(199603)
local BladeFlurry           = Bastion.SpellBook:GetSpell(13877)
local Kick                  = Bastion.SpellBook:GetSpell(1766)
local FinalityRupture       = Bastion.SpellBook:GetSpell(385951)
local MarkedForDeath        = Bastion.SpellBook:GetSpell(137619)
local CrimsonVial           = Bastion.SpellBook:GetSpell(185311)
local TheRotten             = Bastion.SpellBook:GetSpell(394203)
local Shiv                  = Bastion.SpellBook:GetSpell(5938)
local KidneyShot            = Bastion.SpellBook:GetSpell(408)
local InstantPoison         = Bastion.SpellBook:GetSpell(315584)
local Sanguine              = Bastion.SpellBook:GetSpell(226512)
local AtrophicPosion        = Bastion.SpellBook:GetSpell(381637)
local Evasion               = Bastion.SpellBook:GetSpell(5277)
local TricksOfTheTrade      = Bastion.SpellBook:GetSpell(57934)
local Backstab              = Bastion.SpellBook:GetSpell(53)
local CheapShot             = Bastion.SpellBook:GetSpell(1833)
local BagOfTricks           = Bastion.SpellBook:GetSpell(312411)
local Alacrity              = Bastion.SpellBook:GetSpell(193539)
local PerforatedVeins       = Bastion.SpellBook:GetSpell(394254)
local AutoAttack            = Bastion.SpellBook:GetSpell(6603)
local DeeperStratagem       = Bastion.SpellBook:GetSpell(193531)
local SecretStratagem       = Bastion.SpellBook:GetSpell(394320)
local SymbolsOfDeath        = Bastion.SpellBook:GetSpell(212283)
local ShadowBlades          = Bastion.SpellBook:GetSpell(121471)
local Vigor                 = Bastion.SpellBook:GetSpell(14983)
local ColdBlood             = Bastion.SpellBook:GetSpell(382245)
local ShurikenTornado       = Bastion.SpellBook:GetSpell(277925)
local ThistleTea            = Bastion.SpellBook:GetSpell(381623)
local Gloomblade            = Bastion.SpellBook:GetSpell(200758)
local Shadowstrike          = Bastion.SpellBook:GetSpell(185438)
local Rupture               = Bastion.SpellBook:GetSpell(1943)
local Eviscerate            = Bastion.SpellBook:GetSpell(196819)
local ResoundingClarity     = Bastion.SpellBook:GetSpell(381622)
local ArcanePulse           = Bastion.SpellBook:GetSpell(260364)
local NumbingPoison         = Bastion.SpellBook:GetSpell(5761)
local ShurikenStorm         = Bastion.SpellBook:GetSpell(197835)
local BlackPowder           = Bastion.SpellBook:GetSpell(319175)
local Sepsis                = Bastion.SpellBook:GetSpell(385408)
local SecretTechnique       = Bastion.SpellBook:GetSpell(280719)
local DarkBrew              = Bastion.SpellBook:GetSpell(310454)
local Premeditation         = Bastion.SpellBook:GetSpell(343173)
local ArcaneTorrent         = Bastion.SpellBook:GetSpell(50613)
local DanseMacabre          = Bastion.SpellBook:GetSpell(393969)
local LingeringShadow       = Bastion.SpellBook:GetSpell(385960)
local EchoingReprimand      = Bastion.SpellBook:GetSpell(385616)
local LightsJudgment        = Bastion.SpellBook:GetSpell(255647)
local Subterfuge            = Bastion.SpellBook:GetSpell(108208)
local EchoingReprimand2     = Bastion.SpellBook:GetSpell(323558)
local EchoingReprimand3     = Bastion.SpellBook:GetSpell(323559)
local EchoingReprimand4     = Bastion.SpellBook:GetSpell(323560)
local EchoingReprimand5     = Bastion.SpellBook:GetSpell(354838)
local SilentStorm           = Bastion.SpellBook:GetSpell(385722)
local FindWeakness          = Bastion.SpellBook:GetSpell(91023)
local ImprovedShurikenStorm = Bastion.SpellBook:GetSpell(319951)


local RefreshingHealingPotion = Bastion.ItemBook:GetItem(191380)
local ElementalPotionOfPower = Bastion.ItemBook:GetItem(191389)
local IrideusFragment = Bastion.ItemBook:GetItem(193743)
local Healthstone = Bastion.ItemBook:GetItem(5512)
local WindscarWhetstone = Bastion.ItemBook:GetItem(137486)
local DarkMoonRime = Bastion.ItemBook:GetItem(198477)
local AlgetharsPuzzleBox = Bastion.ItemBook:GetItem(193701)

local RimeCards = {
    One = Bastion.SpellBook:GetSpell(382844),
    Two = Bastion.SpellBook:GetSpell(382845),
    Three = Bastion.SpellBook:GetSpell(382846),
    Four = Bastion.SpellBook:GetSpell(382847),
    Five = Bastion.SpellBook:GetSpell(382848),
    Six = Bastion.SpellBook:GetSpell(382849),
    Seven = Bastion.SpellBook:GetSpell(382850),
    Eight = Bastion.SpellBook:GetSpell(382851),
}

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
            and unit:TimeToDie() > 12
            and unit:GetCombatTime() > 4
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

local DefaultAPL = Bastion.APL:New('default')
local CDsAPL = Bastion.APL:New('cds')
local StealthedAPL = Bastion.APL:New('stealthed')
local StealthCDsAPL = Bastion.APL:New('stealthed_cds')
local FinishAPL = Bastion.APL:New('finish')
local BuildAPL = Bastion.APL:New('build')
local ItemsAPL = Bastion.APL:New('items')

ItemsAPL:AddItem(
    Healthstone:UsableIf(function(self)
        return self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetHealthPercent() < 40
    end):SetTarget(Player)
)

ItemsAPL:AddItem(
    RefreshingHealingPotion:UsableIf(function(self)
        return self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetHealthPercent() < 40
    end):SetTarget(Player)
)

ItemsAPL:AddSpell(
    TricksOfTheTrade:CastableIf(function(self)
        return Tank:Exists() and self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:IsTanking(Target)
    end):SetTarget(Tank)
)

ItemsAPL:AddSpell(
    Evasion:CastableIf(function(self)
        return self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and
            Player:GetHealthPercent() < 40
    end):SetTarget(Player)
)

ItemsAPL:AddItem(
    IrideusFragment:UsableIf(function(self)
        return self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 2 or Target:IsBoss())
    end):SetTarget(Player)
)

ItemsAPL:AddItem(
    ElementalPotionOfPower:UsableIf(function(self)
        return self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 2 or Target:IsBoss())
    end):SetTarget(Player)
)

ItemsAPL:AddItem(
    WindscarWhetstone:UsableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 2 or Target:IsBoss())
    end):SetTarget(Player)
)

ItemsAPL:AddItem(
    AlgetharsPuzzleBox:UsableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 3 or Target:IsBoss())
    end):SetTarget(Player)
)

ItemsAPL:AddItem(
    DarkMoonRime:UsableIf(function(self)
        return Target:Exists() and Player:InMelee(Target) and self:IsEquippedAndUsable() and
            not Player:IsCastingOrChanneling() and (Player:GetMeleeAttackers() > 2 or Target:IsBoss()) and
            (Player:GetAuras():FindMy(RimeCards.One):IsUp() or
                Player:GetAuras():FindMy(RimeCards.Two):IsUp() or
                Player:GetAuras():FindMy(RimeCards.Three):IsUp() or
                Player:GetAuras():FindMy(RimeCards.Four):IsUp() or
                Player:GetAuras():FindMy(RimeCards.Five):IsUp() or
                Player:GetAuras():FindMy(RimeCards.Six):IsUp() or
                Player:GetAuras():FindMy(RimeCards.Seven):IsUp() or
                Player:GetAuras():FindMy(RimeCards.Eight):IsUp()
            )
    end):SetTarget(Target)
)

-- # Executed every time the actor is available.
-- # Restealth if possible (no vulnerable enemies in combat)
-- actions=stealth
DefaultAPL:AddSpell(
    Stealth:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and not Player:GetAuras():FindMy(Stealth):IsUp() and
                not Player:IsAffectingCombat() and not IsMounted()
        end
    ):SetTarget(Player)
)

-- # Interrupt on cooldown to allow simming interactions with that
-- actions+=/kick
DefaultAPL:AddSpell(
    Kick:CastableIf(function(self)
        return KickTarget:Exists() and self:IsInRange(KickTarget) and
            self:IsKnownAndUsable() and
            not Player:IsCastingOrChanneling() and Player:IsFacing(Target)
    end):SetTarget(KickTarget)
)

-- double consume_cp_max() const
-- {
--   return COMBO_POINT_MAX + as<double>( talent.rogue.deeper_stratagem->effectN( 2 ).base_value() +
--                                        talent.outlaw.devious_stratagem->effectN( 2 ).base_value() +
--                                        talent.subtlety.secret_stratagem->effectN( 2 ).base_value() );
-- }

-- # Used to determine whether cooldowns wait for SnD based on targets.
-- actions+=/variable,name=snd_condition,value=buff.slice_and_dice.up|spell_targets.shuriken_storm>=cp_max_spend
DefaultAPL:AddVariable(
    'snd_condition',
    function()
        return Player:GetAuras():FindMy(SliceAndDice):IsUp() or
            Player:GetEnemies(10) >= ConsumeCPMax()
    end
)

-- # Check to see if the next CP (in the event of a ShT proc) is Animacharged
-- actions+=/variable,name=is_next_cp_animacharged,if=talent.echoing_reprimand.enabled,value=combo_points=1&buff.echoing_reprimand_2.up|combo_points=2&buff.echoing_reprimand_3.up|combo_points=3&buff.echoing_reprimand_4.up|combo_points=4&buff.echoing_reprimand_5.up
DefaultAPL:AddVariable(
    'is_next_cp_animacharged',
    function()
        if not EchoingReprimand:IsKnown() then
            return false
        end

        local comboPoints = Player:GetComboPoints()

        if comboPoints == 1 and Player:GetAuras():FindMy(EchoingReprimand2):IsUp() then
            return true
        end

        if comboPoints == 2 and Player:GetAuras():FindMy(EchoingReprimand3):IsUp() then
            return true
        end

        if comboPoints == 3 and Player:GetAuras():FindMy(EchoingReprimand4):IsUp() then
            return true
        end

        if comboPoints == 4 and Player:GetAuras():FindMy(EchoingReprimand5):IsUp() then
            return true
        end

        return false
    end
)

-- # Account for ShT reaction time by ignoring low-CP animacharged matches in the 0.5s preceeding a potential ShT proc
-- actions+=/variable,name=effective_combo_points,value=effective_combo_points
DefaultAPL:AddVariable(
    'effective_combo_points',
    function()
        local cur = Player:GetComboPoints() or 0
        if not EchoingReprimand:IsKnown() then
            return cur
        end

        if cur < 2 or cur > 5 then
            return cur
        end

        if Player:GetAuras():FindMy(EchoingReprimand):IsUp() or Player:GetAuras():FindMy(EchoingReprimand2):IsUp() or
            Player:GetAuras():FindMy(EchoingReprimand3):IsUp() or
            Player:GetAuras():FindMy(EchoingReprimand4):IsUp() or
            Player:GetAuras():FindMy(EchoingReprimand5):IsUp()
        then
            return 7
        end

        return cur
    end
)

-- actions+=/variable,name=effective_combo_points,if=talent.echoing_reprimand.enabled&effective_combo_points>combo_points&combo_points.deficit>2&time_to_sht.4.plus<0.5&!variable.is_next_cp_animacharged,value=combo_points
DefaultAPL:AddVariable(
    'effective_combo_points',
    function()
        if not EchoingReprimand:IsKnown() then
            return 0
        end

        local cur = Player:GetComboPoints() or 0
        local deficit = Player:GetComboPointsDeficit() or 0

        if cur > Player:GetComboPoints() and deficit > 2 and
            Player:GetAuras():FindMy(EchoingReprimand4):GetRemainingTime() < 0.5 and
            not DefaultAPL:GetVariable('is_next_cp_animacharged')
        then
            return cur
        end

        return 0
    end
)

-- # Check CDs at first
-- actions+=/call_action_list,name=cds
DefaultAPL:AddAPL(
    CDsAPL,
    function()
        return true
    end
)

-- # Apply Slice and Dice at 4+ CP if it expires within the next GCD or is not up
-- actions+=/slice_and_dice,if=spell_targets.shuriken_storm<cp_max_spend&buff.slice_and_dice.remains<gcd.max&fight_remains>6&combo_points>=4
DefaultAPL:AddSpell(
    SliceAndDice:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and Player:GetEnemies(10) < ConsumeCPMax() and
                Player:GetAuras():FindMy(SliceAndDice):GetRemainingTime() < Player:GetGCD() and
                Player:GetAuras():FindMy(SliceAndDice):GetRemainingTime() > 6 and
                Player:GetComboPoints() >= 4
        end
    ):SetTarget(Player)
)

-- # Run fully switches to the Stealthed Rotation (by doing so, it forces pooling if nothing is available).
-- actions+=/run_action_list,name=stealthed,if=stealthed.all
DefaultAPL:AddAPL(
    StealthedAPL,
    function()
        return Player:GetAuras():FindMy(Stealth):IsUp() or Player:GetAuras():FindMy(Subterfuge):IsUp() or
            Player:GetAuras():FindMy(ShadowDanceAura):IsUp()
    end
)

-- # Only change rotation if we have priority_rotation set.
-- actions+=/variable,name=priority_rotation,value=priority_rotation
DefaultAPL:AddVariable(
    'priority_rotation',
    function()
        return false
    end
)

-- # Used to define when to use stealth CDs or builders
-- actions+=/variable,name=stealth_threshold,value=25+talent.vigor.enabled*20+talent.master_of_shadows.enabled*20+talent.shadow_focus.enabled*25+talent.alacrity.enabled*20+25*(spell_targets.shuriken_storm>=4)
DefaultAPL:AddVariable(
    'stealth_threshold',
    function()
        return 25 + (Vigor:IsKnown() and 20 or 0) + (MasterOfShadows:IsKnown() and 20 or 0) +
            (ShadowFocus:IsKnown() and 25 or 0) + (Alacrity:IsKnown() and 20 or 0) +
            (25 * (Player:GetEnemies(10) >= 4 and 1 or 0))
    end
)

-- # Consider using a Stealth CD when reaching the energy threshold
-- actions+=/call_action_list,name=stealth_cds,if=energy.deficit<=variable.stealth_threshold
DefaultAPL:AddAPL(
    StealthCDsAPL,
    function()
        return Player:GetPowerDeficit() <= DefaultAPL:GetVariable('stealth_threshold')
    end
)

-- actions+=/call_action_list,name=finish,if=variable.effective_combo_points>=cp_max_spend
DefaultAPL:AddAPL(
    FinishAPL,
    function()
        return DefaultAPL:GetVariable('effective_combo_points') >= ConsumeCPMax()
    end
)

-- # Finish at maximum or close to maximum combo point value
-- actions+=/call_action_list,name=finish,if=combo_points.deficit<=1+buff.the_rotten.up|fight_remains<=1&variable.effective_combo_points>=3
DefaultAPL:AddAPL(
    FinishAPL,
    function()
        return Player:GetComboPointsDeficit() <= 1 + (((Player:GetAuras():FindMy(TheRotten):IsUp()) or
            (Player:TimeToDie() <= 1 and DefaultAPL:GetVariable('effective_combo_points') >= 3)) and 1 or 0)
    end
)

-- # Finish at 4+ against 4 targets (outside stealth)
-- actions+=/call_action_list,name=finish,if=spell_targets.shuriken_storm>=(4-talent.seal_fate)&variable.effective_combo_points>=4
DefaultAPL:AddAPL(
    FinishAPL,
    function()
        return Player:GetEnemies(10) >= (4 - (SealFate:IsKnown() and 1 or 0)) and
            DefaultAPL:GetVariable('effective_combo_points') >= 4
    end
)

-- # Use a builder when reaching the energy threshold
-- actions+=/call_action_list,name=build,if=energy.deficit<=variable.stealth_threshold
DefaultAPL:AddAPL(
    BuildAPL,
    function()
        return Player:GetPowerDeficit() <= DefaultAPL:GetVariable('stealth_threshold')
    end
)

-- # Lowest priority in all of the APL because it causes a GCD
-- actions+=/arcane_torrent,if=energy.deficit>=15+energy.regen
DefaultAPL:AddSpell(
    ArcaneTorrent:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and Player:InMelee(Target) and
                Player:GetPowerDeficit() >= 15 + Player:GetPowerRegen()
        end
    ):SetTarget(Player)
)

-- actions+=/arcane_pulse
DefaultAPL:AddSpell(
    ArcanePulse:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and true
        end
    ):SetTarget(Target)
)

-- actions+=/lights_judgment
DefaultAPL:AddSpell(
    LightsJudgment:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and true
        end
    ):SetTarget(Target)
)

-- actions+=/bag_of_tricks
DefaultAPL:AddSpell(
    BagOfTricks:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and true
        end
    ):SetTarget(Target)
)

-- # Builders
-- actions.build=shuriken_storm,if=spell_targets>=2+(buff.lingering_shadow.remains>=6|buff.perforated_veins.up)
BuildAPL:AddSpell(
    ShurikenStorm:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and
                Player:GetEnemies(10) >= 2 + ((Player:GetAuras():FindMy(LingeringShadow):GetRemainingTime() >= 6 or
                    Player:GetAuras():FindMy(PerforatedVeins):IsUp()) and 1 or 0)
        end
    ):SetTarget(Target)
)

-- # Build immediately unless the next CP is Animacharged and we won't cap energy waiting for it.
-- actions.build+=/variable,name=anima_helper,value=!talent.echoing_reprimand.enabled|!(variable.is_next_cp_animacharged&(time_to_sht.3.plus<0.5|time_to_sht.4.plus<1)&energy<60)
BuildAPL:AddVariable(
    'anima_helper',
    function()
        return not EchoingReprimand:IsKnown() or ((not (DefaultAPL:GetVariable('is_next_cp_animacharged') and
            (Player:GetTimeToShurikenTornado(3) < 0.5 or Player:GetTimeToShurikenTornado(4) < 1) and
            Player:GetPower() < 60)))
    end
)

-- actions.build+=/gloomblade,if=variable.anima_helper
BuildAPL:AddSpell(
    Gloomblade:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and BuildAPL:GetVariable('anima_helper')
        end
    ):SetTarget(Target)
)

-- actions.build+=/backstab,if=variable.anima_helper
BuildAPL:AddSpell(
    Backstab:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and BuildAPL:GetVariable('anima_helper')
        end
    ):SetTarget(Target)
)

-- # Cooldowns  Use Dance off-gcd before the first Shuriken Storm from Tornado comes in.
-- actions.cds=shadow_dance,use_off_gcd=1,if=!buff.shadow_dance.up&buff.shuriken_tornado.up&buff.shuriken_tornado.remains<=3.5
CDsAPL:AddSpell(
    ShadowDance:CastableIf(
        function(self)
            return Player:IsAffectingCombat() and self:IsKnownAndUsable() and
                not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
                Player:GetAuras():FindMy(ShurikenTornado):IsUp() and
                Player:GetAuras():FindMy(ShurikenTornado):GetRemainingTime() <= 3.5
        end
    ):SetTarget(Player)
)

-- # (Unless already up because we took Shadow Focus) use Symbols off-gcd before the first Shuriken Storm from Tornado comes in.
-- actions.cds+=/symbols_of_death,use_off_gcd=1,if=buff.shuriken_tornado.up&buff.shuriken_tornado.remains<=3.5
CDsAPL:AddSpell(
    SymbolsOfDeath:CastableIf(
        function(self)
            return Player:IsAffectingCombat() and self:IsKnownAndUsable() and
                Player:GetAuras():FindMy(ShurikenTornado):IsUp() and
                Player:GetAuras():FindMy(ShurikenTornado):GetRemainingTime() <= 3.5
        end
    ):SetTarget(Player)
)

-- # Vanish for Shadowstrike with Danse Macabre at adaquate stacks
-- actions.cds+=/vanish,if=buff.danse_macabre.stack>3&combo_points<=2
CDsAPL:AddSpell(
    Vanish:CastableIf(
        function(self)
            return Player:IsAffectingCombat() and Player:GetAuras():FindMy(Vanish):IsUp() and self:IsKnownAndUsable() and
                Player:GetAuras():FindMy(DanseMacabre):GetCount() > 3 and
                DefaultAPL:GetVariable('effective_combo_points') <= 2
        end
    ):SetTarget(Player)
)

-- # Cold Blood on 5 combo points when not playing Secret Technique
-- actions.cds+=/cold_blood,if=!talent.secret_technique&combo_points>=5
CDsAPL:AddSpell(
    ColdBlood:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and not SecretTechnique:IsKnown() and
                DefaultAPL:GetVariable('effective_combo_points') >= 5
        end
    ):SetTarget(Player)
)

-- actions.cds+=/flagellation,target_if=max:target.time_to_die,if=variable.snd_condition&combo_points>=5&target.time_to_die>10
CDsAPL:AddSpell(
    Flagellation:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and DefaultAPL:GetVariable('snd_condition') and
                DefaultAPL:GetVariable('effective_combo_points') >= 5 and
                Target:TimeToDie() > 10
        end
    ):SetTarget(Target)
)

-- # Pool for Tornado pre-SoD with ShD ready when not running SF.
-- actions.cds+=/pool_resource,for_next=1,if=talent.shuriken_tornado.enabled&!talent.shadow_focus.enabled


-- # Use Tornado pre SoD when we have the energy whether from pooling without SF or just generally.
-- actions.cds+=/shuriken_tornado,if=spell_targets.shuriken_storm<=1&energy>=60&variable.snd_condition&cooldown.symbols_of_death.up&cooldown.shadow_dance.charges>=1&(!talent.flagellation.enabled&!cooldown.flagellation.up|buff.flagellation_buff.up|spell_targets.shuriken_storm>=5)&combo_points<=2&!buff.premeditation.up
CDsAPL:AddSpell(
    ShurikenTornado:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and Player:GetEnemies(10) <= 1 and
                Player:GetPower() >= 60 and
                DefaultAPL:GetVariable('snd_condition') and
                SymbolsOfDeath:OnCooldown() and
                ShadowDance:GetCharges() >= 1 and
                (not Flagellation:IsKnown() and not Flagellation:OnCooldown() or
                    Player:GetAuras():FindMy(Flagellation):IsUp() or
                    Player:GetEnemies(10) >= 5) and
                DefaultAPL:GetVariable('effective_combo_points') <= 2 and
                not Player:GetAuras():FindMy(Premeditation):IsUp()
        end
    ):SetTarget(Target)
)

-- actions.cds+=/sepsis,if=variable.snd_condition&combo_points.deficit>=1&target.time_to_die>=16
CDsAPL:AddSpell(
    Sepsis:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and DefaultAPL:GetVariable('snd_condition') and
                Player:GetComboPointsDeficit() >= 1 and
                Target:TimeToDie() >= 16
        end
    ):SetTarget(Target)
)

-- # Use Symbols on cooldown (after first SnD) unless we are going to pop Tornado and do not have Shadow Focus.
-- actions.cds+=/symbols_of_death,if=variable.snd_condition&(!talent.flagellation|cooldown.flagellation.remains>10|cooldown.flagellation.up&combo_points>=5)
CDsAPL:AddSpell(
    SymbolsOfDeath:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and DefaultAPL:GetVariable('snd_condition') and
                (not Flagellation:IsKnown() or
                    Flagellation:GetCooldownRemaining() > 10 or
                    Flagellation:OnCooldown() and DefaultAPL:GetVariable('effective_combo_points') >= 5)
        end
    ):SetTarget(Player)
)

-- # If adds are up, snipe the one with lowest TTD. Use when dying faster than CP deficit or not stealthed without any CP.
-- actions.cds+=/marked_for_death,line_cd=1.5,target_if=min:target.time_to_die,if=raid_event.adds.up&(target.time_to_die<combo_points.deficit|!stealthed.all&combo_points.deficit>=cp_max_spend)
-- # If no adds will die within the next 30s, use MfD on boss without any CP.
-- actions.cds+=/marked_for_death,if=raid_event.adds.in>30-raid_event.adds.duration&combo_points.deficit>=cp_max_spend

-- actions.cds+=/shadow_blades,if=variable.snd_condition&combo_points.deficit>=2&target.time_to_die>=10&(dot.sepsis.ticking|cooldown.sepsis.remains<=8|!talent.sepsis)|fight_remains<=20
CDsAPL:AddSpell(
    ShadowBlades:CastableIf(
        function(self)
            return Player:IsAffectingCombat() and self:IsKnownAndUsable() and
                DefaultAPL:GetVariable('snd_condition') and
                Player:GetComboPointsDeficit() >= 2 and
                Target:TimeToDie() >= 10 and
                ((Target:GetAuras():FindMy(Sepsis):IsUp() or
                    Sepsis:GetCooldownRemaining() <= 8 or
                    not Sepsis:IsKnown()) or
                    Target:TimeToDie() <= 20)
        end
    ):SetTarget(Target)
)

-- actions.cds+=/echoing_reprimand,if=variable.snd_condition&combo_points.deficit>=3&(variable.priority_rotation|spell_targets.shuriken_storm<=4|talent.resounding_clarity)&(buff.shadow_dance.up|!talent.danse_macabre)
CDsAPL:AddSpell(
    EchoingReprimand:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and DefaultAPL:GetVariable('snd_condition') and
                Player:GetComboPointsDeficit() >= 3 and
                (DefaultAPL:GetVariable('priority_rotation') or
                    Player:GetEnemies(10) <= 4 or
                    ResoundingClarity:IsKnown()) and
                (Player:GetAuras():FindMy(ShadowDance):IsUp() or
                    not DanseMacabre:IsKnown())
        end
    ):SetTarget(Target)
)

-- # With SF, if not already done, use Tornado with SoD up.
-- actions.cds+=/shuriken_tornado,if=variable.snd_condition&buff.symbols_of_death.up&combo_points<=2&(!buff.premeditation.up|spell_targets.shuriken_storm>4)
CDsAPL:AddSpell(
    ShurikenTornado:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and DefaultAPL:GetVariable('snd_condition') and
                Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() and
                DefaultAPL:GetVariable('effective_combo_points') <= 2 and
                (not Player:GetAuras():FindMy(Premeditation):IsUp() or
                    Player:GetEnemies(10) > 4)
        end
    ):SetTarget(Target)
)

-- actions.cds+=/shuriken_tornado,if=cooldown.shadow_dance.ready&!stealthed.all&spell_targets.shuriken_storm>=3&!talent.flagellation.enabled
CDsAPL:AddSpell(
    ShurikenTornado:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and ShadowDance:GetCooldownRemaining() == 0 and
                not Player:IsStealthed() and
                Player:GetEnemies(10) >= 3 and
                not Flagellation:IsKnown()
        end
    ):SetTarget(Target)
)

-- actions.cds+=/shadow_dance,if=!buff.shadow_dance.up&fight_remains<=8+talent.subterfuge.enabled
CDsAPL:AddSpell(
    ShadowDance:CastableIf(
        function(self)
            return Player:IsAffectingCombat() and self:IsKnownAndUsable() and
                not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
                Target:TimeToDie() <= 8 + (Subterfuge:IsKnown() and 1 or 0)
        end
    ):SetTarget(Target)
)

-- actions.cds+=/thistle_tea,if=cooldown.symbols_of_death.remains>=3&!buff.thistle_tea.up&(energy.deficit>=100|cooldown.thistle_tea.charges_fractional>=2.75&buff.shadow_dance.up)|buff.shadow_dance.remains>=4&!buff.thistle_tea.up&spell_targets.shuriken_storm>=3|!buff.thistle_tea.up&fight_remains<=(6*cooldown.thistle_tea.charges)
CDsAPL:AddSpell(
    ThistleTea:CastableIf(
        function(self)
            return Player:IsAffectingCombat() and self:IsKnownAndUsable() and
                (SymbolsOfDeath:GetCooldownRemaining() >= 3
                    and not Player:GetAuras():FindMy(ThistleTea):IsUp() and
                    (Player:GetPowerDeficit() >= 100 or
                        self:GetChargesFractional() >= 2.75 and
                        Player:GetAuras():FindMy(ShadowDance):IsUp()) or
                    (Player:GetAuras():FindMy(ShadowDance):GetRemainingTime() >= 4 and
                        not Player:GetAuras():FindMy(ThistleTea):IsUp() and
                        Player:GetEnemies(10) >= 3) or
                    (not Player:GetAuras():FindMy(ThistleTea):IsUp() and
                        Player:TimeToDie() <= (6 * self:GetCharges())))
        end
    ):SetTarget(Player)
)

-- actions.cds+=/potion,if=buff.bloodlust.react|fight_remains<30|buff.symbols_of_death.up&(buff.shadow_blades.up|cooldown.shadow_blades.remains<=10)
-- actions.cds+=/blood_fury,if=buff.symbols_of_death.up
-- actions.cds+=/berserking,if=buff.symbols_of_death.up
-- actions.cds+=/fireblood,if=buff.symbols_of_death.up
-- actions.cds+=/ancestral_call,if=buff.symbols_of_death.up
-- actions.cds+=/use_item,name=manic_grieftorch,use_off_gcd=1,if=gcd.remains>gcd.max-0.1,if=!stealthed.all
-- # Default fallback for usable items: Use with Symbols of Death.
-- actions.cds+=/use_items,if=buff.symbols_of_death.up|fight_remains<20
CDsAPL:AddAPL(
    ItemsAPL,
    function()
        return Player:GetAuras():FindMy(SymbolsOfDeath):IsUp() or (Target:IsBoss() and Target:TimeToDie() < 20)
    end
)

-- # Finishers  While using Premeditation, avoid casting Slice and Dice when Shadow Dance is soon to be used, except for Kyrian
-- actions.finish=variable,name=premed_snd_condition,value=talent.premeditation.enabled&spell_targets.shuriken_storm<5
FinishAPL:AddVariable(
    'premed_snd_condition',
    function()
        return Premeditation:IsKnown() and Player:GetEnemies(10) < 5
    end
)

--     return ( cp + 1 ) * p()->buffs.slice_and_dice->data().duration();
function GetTriggeredDuration()
    return (Player:GetComboPoints() + 1) * 6
end

--         return p()->buffs.slice_and_dice->remains() < get_triggered_duration( as<int>( p()->current_effective_cp( false ) ) ) * 0.3;
function Refreshable(aura, target)
    return target:GetAuras():FindMy(aura):GetRemainingTime() < GetTriggeredDuration() * 0.3
end

-- actions.finish+=/slice_and_dice,if=!variable.premed_snd_condition&spell_targets.shuriken_storm<6&!buff.shadow_dance.up&buff.slice_and_dice.remains<fight_remains&refreshable
FinishAPL:AddSpell(
    SliceAndDice:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and not DefaultAPL:GetVariable('premed_snd_condition') and
                Player:GetEnemies(10) < 6 and
                not Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
                Player:GetAuras():FindMy(SliceAndDice):GetRemainingTime() < Target:TimeToDie() and
                Refreshable(SliceAndDice, Player)
        end
    ):SetTarget(Player)
)

-- actions.finish+=/slice_and_dice,if=variable.premed_snd_condition&cooldown.shadow_dance.charges_fractional<1.75&buff.slice_and_dice.remains<cooldown.symbols_of_death.remains&(cooldown.shadow_dance.ready&buff.symbols_of_death.remains-buff.shadow_dance.remains<1.2)
FinishAPL:AddSpell(
    SliceAndDice:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and DefaultAPL:GetVariable('premed_snd_condition') and
                ShadowDance:GetChargesFractional() < 1.75 and
                Player:GetAuras():FindMy(SliceAndDice):GetRemainingTime() < SymbolsOfDeath:GetCooldownRemaining() and
                (ShadowDance:OnCooldown() and
                    Player:GetAuras():FindMy(SymbolsOfDeath):GetRemainingTime() -
                    Player:GetAuras():FindMy(ShadowDanceAura):GetRemainingTime() < 1.2)
        end
    ):SetTarget(Player)
)

-- actions.finish+=/variable,name=skip_rupture,value=buff.thistle_tea.up&spell_targets.shuriken_storm=1|buff.shadow_dance.up&(spell_targets.shuriken_storm=1|dot.rupture.ticking&spell_targets.shuriken_storm>=2)
FinishAPL:AddVariable(
    'skip_rupture',
    function()
        return (Player:GetAuras():FindMy(ThistleTea):IsUp() and Player:GetEnemies(10) == 1) or
            (Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
                (Player:GetEnemies(10) == 1 or
                    Target:GetAuras():FindMy(Rupture):IsUp() and Player:GetEnemies(10) >= 2))
    end
)

-- # Keep up Rupture if it is about to run out.
-- actions.finish+=/rupture,if=(!variable.skip_rupture|variable.priority_rotation)&target.time_to_die-remains>6&refreshable
FinishAPL:AddSpell(
    Rupture:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and
                (not DefaultAPL:GetVariable('skip_rupture') or
                    DefaultAPL:GetVariable('priority_rotation')) and
                Target:TimeToDie() - Target:GetAuras():FindMy(Rupture):GetRemainingTime() > 6 and
                Refreshable(Rupture, Target)
        end
    ):SetTarget(Target)
)

-- # Refresh Rupture early for Finality
-- actions.finish+=/rupture,if=!variable.skip_rupture&buff.finality_rupture.up&cooldown.shadow_dance.remains<12&cooldown.shadow_dance.charges_fractional<=1&spell_targets.shuriken_storm=1&(talent.dark_brew|talent.danse_macabre)
FinishAPL:AddSpell(
    Rupture:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and not DefaultAPL:GetVariable('skip_rupture') and
                Player:GetAuras():FindMy(FinalityRupture):IsUp() and
                ShadowDance:GetCooldownRemaining() < 12 and
                ShadowDance:GetChargesFractional() <= 1 and
                Player:GetEnemies(10) == 1 and
                (DarkBrew:IsKnown() or DanseMacabre:IsKnown())
        end
    ):SetTarget(Target)
)

-- # Sync Cold Blood with Secret Technique when possible
-- actions.finish+=/cold_blood,if=buff.shadow_dance.up&(buff.danse_macabre.stack>=3|!talent.danse_macabre)&cooldown.secret_technique.ready
FinishAPL:AddSpell(
    ColdBlood:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
                (Player:GetAuras():FindMy(DanseMacabre):GetCount() >= 3 or
                    not DanseMacabre:IsKnown()) and
                SecretTechnique:OnCooldown()
        end
    ):SetTarget(Target)
)

-- actions.finish+=/secret_technique,if=buff.shadow_dance.up&(buff.danse_macabre.stack>=3|!talent.danse_macabre)&(!talent.cold_blood|cooldown.cold_blood.remains>buff.shadow_dance.remains-2)
FinishAPL:AddSpell(
    SecretTechnique:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and
                Player:GetAuras():FindMy(ShadowDanceAura):IsUp() and
                (Player:GetAuras():FindMy(DanseMacabre):GetCount() >= 3 or
                    not DanseMacabre:IsKnown()) and
                (not ColdBlood:IsKnown() or
                    ColdBlood:GetCooldownRemaining() > Player:GetAuras():FindMy(ShadowDanceAura):GetRemainingTime() - 2)
        end
    ):SetTarget(Target)
)

-- # Multidotting targets that will live for the duration of Rupture, refresh during pandemic.
-- actions.finish+=/rupture,cycle_targets=1,if=!variable.skip_rupture&!variable.priority_rotation&spell_targets.shuriken_storm>=2&target.time_to_die>=(2*combo_points)&refreshable
FinishAPL:AddSpell(
    Rupture:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(RuptureTarget) and
                not DefaultAPL:GetVariable('skip_rupture') and
                not DefaultAPL:GetVariable('priority_rotation') and
                Player:GetEnemies(10) >= 2 and
                RuptureTarget:TimeToDie() >= (2 * Player:GetComboPoints()) and
                Refreshable(Rupture, RuptureTarget)
        end
    ):SetTarget(RuptureTarget)
)


-- # Refresh Rupture early if it will expire during Symbols. Do that refresh if SoD gets ready in the next 5s.
-- actions.finish+=/rupture,if=!variable.skip_rupture&remains<cooldown.symbols_of_death.remains+10&cooldown.symbols_of_death.remains<=5&target.time_to_die-remains>cooldown.symbols_of_death.remains+5
FinishAPL:AddSpell(
    Rupture:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and not DefaultAPL:GetVariable('skip_rupture') and
                Target:GetAuras():FindMy(Rupture):GetRemainingTime() <
                SymbolsOfDeath:GetCooldownRemaining() + 10 and
                SymbolsOfDeath:GetCooldownRemaining() <= 5 and
                Target:TimeToDie() - Target:GetAuras():FindMy(Rupture):GetRemainingTime() >
                SymbolsOfDeath:GetCooldownRemaining() + 5
        end
    ):SetTarget(Target)
)

-- actions.finish+=/black_powder,if=!variable.priority_rotation&spell_targets>=3
FinishAPL:AddSpell(
    BlackPowder:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and not DefaultAPL:GetVariable('priority_rotation') and
                Player:GetEnemies(10) >= 3
        end
    ):SetTarget(Target)
)

-- actions.finish+=/eviscerate
FinishAPL:AddSpell(
    Eviscerate:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and true
        end
    ):SetTarget(Target)
)

-- # Stealth Cooldowns  Helper Variable
-- actions.stealth_cds=variable,name=shd_threshold,value=cooldown.shadow_dance.charges_fractional>=0.75+talent.shadow_dance
StealthCDsAPL:AddVariable(
    'shd_threshold',
    function(self)
        return ShadowDance:GetChargesFractional() >= 0.75 + (ShadowDance:IsKnown() and 1 or 0)
    end
)

-- # Vanish if we are capping on Dance charges. Early before first dance if we have no Nightstalker but Dark Shadow in order to get Rupture up (no Master Assassin).
-- actions.stealth_cds+=/vanish,if=(!talent.danse_macabre|spell_targets.shuriken_storm>=3)&!variable.shd_threshold&combo_points.deficit>1
StealthCDsAPL:AddSpell(
    Vanish:CastableIf(
        function(self)
            return Player:IsAffectingCombat() and not Player:GetAuras():FindMy(Stealth):IsUp() and
                self:IsKnownAndUsable() and
                (not DanseMacabre:IsKnown() or Player:GetEnemies(10) >= 3) and
                not StealthCDsAPL:GetVariable('shd_threshold') and
                Player:GetComboPointsDeficit() > 1
        end
    ):SetTarget(Target)
)

-- # Pool for Shadowmeld + Shadowstrike unless we are about to cap on Dance charges. Only when Find Weakness is about to run out.
-- actions.stealth_cds+=/pool_resource,for_next=1,extra_amount=40,if=race.night_elf


-- actions.stealth_cds+=/shadowmeld,if=energy>=40&energy.deficit>=10&!variable.shd_threshold&combo_points.deficit>4
StealthCDsAPL:AddSpell(
    Shadowmeld:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and Player:GetEnergy() >= 40 and
                Player:GetPowerDeficit() >= 10 and
                not StealthCDsAPL:GetVariable('shd_threshold') and
                Player:GetComboPointsDeficit() > 4
        end
    ):SetTarget(Target)
)

-- # CP thresholds for entering Shadow Dance Default to start dance with 0 or 1 combo point
-- actions.stealth_cds+=/variable,name=shd_combo_points,value=combo_points<=1
StealthCDsAPL:AddVariable(
    'shd_combo_points',
    function(self)
        return Player:GetComboPoints() <= 1
    end
)

-- # Use stealth cooldowns with high combo points when playing shuriken tornado or with high target counts
-- actions.stealth_cds+=/variable,name=shd_combo_points,value=combo_points.deficit<=1,if=spell_targets.shuriken_storm>(4-2*talent.shuriken_tornado.enabled)|variable.priority_rotation&spell_targets.shuriken_storm>=4
StealthCDsAPL:AddVariable(
    'shd_combo_points',
    function(self)
        return Player:GetComboPointsDeficit() <= 1 and
            ((Player:GetEnemies(10) > (4 - 2 * (ShurikenTornado:IsKnown() and 1 or 0))) or
                (DefaultAPL:GetVariable('priority_rotation') and
                    Player:GetEnemies(10) >= 4))
    end
)

-- # Use stealth cooldowns on any combo point on 4 targets
-- actions.stealth_cds+=/variable,name=shd_combo_points,value=1,if=spell_targets.shuriken_storm=(4-talent.seal_fate)
StealthCDsAPL:AddVariable(
    'shd_combo_points',
    function(self)
        return Player:GetEnemies(10) == (4 - (SealFate:IsKnown() and 1 or 0))
    end
)

-- # Dance during Symbols or above threshold.
-- actions.stealth_cds+=/shadow_dance,if=(variable.shd_combo_points&(buff.symbols_of_death.remains>=(2.2-talent.flagellation.enabled)|variable.shd_threshold)|buff.flagellation.up|buff.flagellation_persist.remains>=6|spell_targets.shuriken_storm>=4&cooldown.symbols_of_death.remains>10)&!buff.the_rotten.up
StealthCDsAPL:AddSpell(
    ShadowDance:CastableIf(
        function(self)
            return Player:IsAffectingCombat() and self:IsKnownAndUsable() and
                ((StealthCDsAPL:GetVariable('shd_combo_points') and
                    (Player:GetAuras():FindMy(SymbolsOfDeath):GetRemainingTime() >=
                        (2.2 - (Flagellation:IsKnown() and 1 or 0)) or
                        StealthCDsAPL:GetVariable('shd_threshold'))) or
                    Player:GetAuras():FindMy(Flagellation):IsUp() or
                    Player:GetAuras():FindMy(FlagellationPersist):GetRemainingTime() >= 6 or
                    Player:GetEnemies(10) >= 4 and
                    SymbolsOfDeath:GetCooldownRemaining() > 10) and
                not Target:GetAuras():FindMy(TheRotten):IsUp()
        end
    ):SetTarget(Target)
)

-- # Burn Dances charges if before the fight ends if SoD won't be ready in time.
-- actions.stealth_cds+=/shadow_dance,if=variable.shd_combo_points&fight_remains<cooldown.symbols_of_death.remains|!talent.shadow_dance&dot.rupture.ticking&spell_targets.shuriken_storm<=4&!buff.the_rotten.up
StealthCDsAPL:AddSpell(
    ShadowDance:CastableIf(
        function(self)
            return Player:IsAffectingCombat() and self:IsKnownAndUsable() and
                ((StealthCDsAPL:GetVariable('shd_combo_points') and
                    Target:TimeToDie() < SymbolsOfDeath:GetCooldownRemaining()) or
                    (
                    Target:GetAuras():FindMy(Rupture):IsUp() and
                        Player:GetEnemies(10) <= 4 and
                        not Target:GetAuras():FindMy(TheRotten):IsUp()))
        end
    ):SetTarget(Target)
)

-- # Stealthed Rotation  If Stealth/vanish are up, use Shadowstrike to benefit from the passive bonus and Find Weakness, even if we are at max CP (unless using Master Assassin)
-- actions.stealthed=shadowstrike,if=(buff.stealth.up|buff.vanish.up)&(spell_targets.shuriken_storm<4|variable.priority_rotation)
StealthedAPL:AddSpell(
    Shadowstrike:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and (Player:GetAuras():FindMy(Stealth):IsUp() or
                Player:GetAuras():FindMy(Vanish):IsUp()) and
                (Player:GetEnemies(10) < 4 or
                    DefaultAPL:GetVariable('priority_rotation'))
        end
    ):SetTarget(Target)
)

-- # Variable to Gloomblade / Backstab when on 4 or 5 combo points with premediation and when the combo point is not anima charged
-- actions.stealthed+=/variable,name=gloomblade_condition,value=buff.danse_macabre.stack<5&(combo_points.deficit=2|combo_points.deficit=3)&(buff.premeditation.up|effective_combo_points<7)&(spell_targets.shuriken_storm<=8|talent.lingering_shadow)
StealthedAPL:AddVariable(
    'gloomblade_condition',
    function(self)
        return Player:GetAuras():FindMy(DanseMacabre):GetCount() < 5 and
            (Player:GetComboPointsDeficit() == 2 or
                Player:GetComboPointsDeficit() == 3) and
            (Player:GetAuras():FindMy(Premeditation):IsUp() or
                DefaultAPL:GetVariable('effective_combo_points') < 7) and
            (Player:GetEnemies(10) <= 8 or
                LingeringShadow:IsKnown())
    end
)

-- actions.stealthed+=/shuriken_storm,if=variable.gloomblade_condition&buff.silent_storm.up&!debuff.find_weakness.remains&talent.improved_shuriken_storm.enabled
StealthedAPL:AddSpell(
    ShurikenStorm:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and StealthedAPL:GetVariable('gloomblade_condition') and
                Player:GetAuras():FindMy(SilentStorm):IsUp() and
                not Target:GetAuras():FindMy(FindWeakness):GetRemainingTime() and
                ImprovedShurikenStorm:IsKnown()
        end
    ):SetTarget(Target)
)

-- actions.stealthed+=/gloomblade,if=variable.gloomblade_condition
StealthedAPL:AddSpell(
    Gloomblade:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and
                StealthedAPL:GetVariable('gloomblade_condition')
        end
    ):SetTarget(Target)
)

-- actions.stealthed+=/backstab,if=variable.gloomblade_condition&talent.danse_macabre&buff.danse_macabre.stack<=2&spell_targets.shuriken_storm<=2
StealthedAPL:AddSpell(
    Backstab:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and
                StealthedAPL:GetVariable('gloomblade_condition') and
                DanseMacabre:IsKnown() and
                Player:GetAuras():FindMy(DanseMacabre):GetCount() <= 2 and
                Player:GetEnemies(10) <= 2
        end
    ):SetTarget(Target)
)

--[[
      double consume_cp_max() const
  {
    return COMBO_POINT_MAX + as<double>( talent.rogue.deeper_stratagem->effectN( 2 ).base_value() +
                                         talent.outlaw.devious_stratagem->effectN( 2 ).base_value() +
                                         talent.subtlety.secret_stratagem->effectN( 2 ).base_value() );
  }
]]

function ConsumeCPMax()
    return 5 + (DeeperStratagem:IsKnownAndUsable() and 1 or 0) + (DeviousStratagem:IsKnownAndUsable() and 1 or 0) +
        (SecretStratagem:IsKnownAndUsable() and 1 or 0)
end

-- actions.stealthed+=/call_action_list,name=finish,if=variable.effective_combo_points>=cp_max_spend
StealthedAPL:AddAPL(
    FinishAPL,
    function(self)
        return DefaultAPL:GetVariable('effective_combo_points') >= ConsumeCPMax()
    end
)

-- # Finish earlier with Shuriken tornado up.
-- actions.stealthed+=/call_action_list,name=finish,if=buff.shuriken_tornado.up&combo_points.deficit<=2
StealthedAPL:AddAPL(
    FinishAPL,
    function(self)
        return Player:GetAuras():FindMy(ShurikenTornado):IsUp() and
            Player:GetComboPointsDeficit() <= 2
    end
)

-- # Also safe to finish at 4+ CP with exactly 4 targets. (Same as outside stealth.)
-- actions.stealthed+=/call_action_list,name=finish,if=spell_targets.shuriken_storm>=4-talent.seal_fate&variable.effective_combo_points>=4
StealthedAPL:AddAPL(
    FinishAPL,
    function()
        return Player:GetEnemies(10) >= 4 - ((SealFate:IsKnown() and
            DefaultAPL:GetVariable('effective_combo_points') >= 4) and 1 or 0)
    end
)

-- # Finish at lower combo points if you are talented in DS, SS or Seal Fate
-- actions.stealthed+=/call_action_list,name=finish,if=combo_points.deficit<=1+(talent.seal_fate|talent.deeper_stratagem|talent.secret_stratagem)
StealthedAPL:AddAPL(
    FinishAPL,
    function()
        return Player:GetComboPointsDeficit() <=
            1 + ((SealFate:IsKnown() or DeeperStratagem:IsKnown() or SecretStratagem:IsKnown()) and 1 or 0)
    end
)

-- # Use Gloomblade or Backstab when close to hitting max PV stacks
-- actions.stealthed+=/gloomblade,if=buff.perforated_veins.stack>=5&spell_targets.shuriken_storm<3
StealthedAPL:AddSpell(
    Gloomblade:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and
                Player:GetAuras():FindMy(PerforatedVeins):GetCount() >= 5 and
                Player:GetEnemies(10) < 3
        end
    ):SetTarget(Target)
)

-- actions.stealthed+=/backstab,if=buff.perforated_veins.stack>=5&spell_targets.shuriken_storm<3
StealthedAPL:AddSpell(
    Backstab:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and
                Player:GetAuras():FindMy(PerforatedVeins):GetCount() >= 5 and
                Player:GetEnemies(10) < 3
        end
    ):SetTarget(Target)
)

-- actions.stealthed+=/shadowstrike,if=stealthed.sepsis&spell_targets.shuriken_storm<4
StealthedAPL:AddSpell(
    Shadowstrike:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and Player:GetAuras():FindMy(Sepsis):IsUp() and
                Player:GetEnemies(10) < 4
        end
    ):SetTarget(Target)
)

-- actions.stealthed+=/shuriken_storm,if=spell_targets>=3+buff.the_rotten.up&(!buff.premeditation.up|spell_targets>=7)
StealthedAPL:AddSpell(
    ShurikenStorm:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and
                Player:GetEnemies(10) >= 3 + ((Player:GetAuras():FindMy(TheRotten):IsUp() and
                    (not Player:GetAuras():FindMy(Premeditation):IsUp() or Player:GetEnemies(10) >= 7)) and 1 or 0)
        end
    ):SetTarget(Target)
)

-- # Shadowstrike to refresh Find Weakness and to ensure we can carry over a full FW into the next SoD if possible.
-- actions.stealthed+=/shadowstrike,if=debuff.find_weakness.remains<=1|cooldown.symbols_of_death.remains<18&debuff.find_weakness.remains<cooldown.symbols_of_death.remains
StealthedAPL:AddSpell(
    Shadowstrike:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target) and
                (Target:GetAuras():FindMy(FindWeakness):GetRemainingTime() <= 1 or
                    (SymbolsOfDeath:GetCooldownRemaining() < 18 and
                        Target:GetAuras():FindMy(FindWeakness):GetRemainingTime() < SymbolsOfDeath:GetCooldownRemaining()
                    ))
        end
    ):SetTarget(Target)
)

-- actions.stealthed+=/shadowstrike
StealthedAPL:AddSpell(
    Shadowstrike:CastableIf(
        function(self)
            return self:IsKnownAndUsable() and self:IsInRange(Target)
        end
    ):SetTarget(Target)
)

Stealth:CastableIf(
    function(self)
        return self:IsKnownAndUsable() and not Player:GetAuras():FindMy(Stealth):IsUp() and
            not Player:IsAffectingCombat() and not IsMounted()
    end
)

SubModulue:Sync(function()
    print(Player:GetEnemies(10))
    DefaultAPL:Execute()
end)

Bastion:Register(SubModulue)
