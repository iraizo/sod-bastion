-- local Tinkr, Bastion = ...

-- local OutlawModule = Bastion.Module:New('outlaw')
-- local Evaluator = Tinkr.Util.Evaluator
-- local Player = Bastion.UnitManager:Get('player')
-- local None = Bastion.UnitManager:Get('none')
-- local Target = Bastion.UnitManager:Get('target')

-- local Stealth                = Bastion.SpellBook:GetSpell(115191)
-- local Kick                   = Bastion.SpellBook:GetSpell(1766)
-- local CountTheOdds           = Bastion.SpellBook:GetSpell(381982)
-- local Shadowmeld             = Bastion.SpellBook:GetSpell(58984)
-- local ShadowDance            = Bastion.SpellBook:GetSpell(185313)
-- local ShadowDanceAura        = Bastion.SpellBook:GetSpell(185422)
-- local HiddenOpportunity      = Bastion.SpellBook:GetSpell(383281)
-- local RollTheBones           = Bastion.SpellBook:GetSpell(315508)
-- local FanTheHammer           = Bastion.SpellBook:GetSpell(381846)
-- local ImprovedAmbush         = Bastion.SpellBook:GetSpell(381620)
-- local SummarilyDispatched    = Bastion.SpellBook:GetSpell(381990)
-- local BladeFlurry            = Bastion.SpellBook:GetSpell(13877)
-- local KillingSpree           = Bastion.SpellBook:GetSpell(51690)
-- local ArcaneTorrent          = Bastion.SpellBook:GetSpell(25046)
-- local ArcanePulse            = Bastion.SpellBook:GetSpell(260364)
-- local LightsJudgment         = Bastion.SpellBook:GetSpell(255647)
-- local BagOfTricks            = Bastion.SpellBook:GetSpell(312411)
-- local Sepsis                 = Bastion.SpellBook:GetSpell(385408)
-- local BetweenTheEyes         = Bastion.SpellBook:GetSpell(315341)
-- local GhostlyStrike          = Bastion.SpellBook:GetSpell(196937)
-- local Dreadblades            = Bastion.SpellBook:GetSpell(343142)
-- local Subterfuge             = Bastion.SpellBook:GetSpell(108208)
-- local EchoingReprimand       = Bastion.SpellBook:GetSpell(385616)
-- local Ambush                 = Bastion.SpellBook:GetSpell(8676)
-- local KeepItRolling          = Bastion.SpellBook:GetSpell(381989)
-- local Audacity               = Bastion.SpellBook:GetSpell(381845)
-- local FindWeakness           = Bastion.SpellBook:GetSpell(91023)
-- local PistolShot             = Bastion.SpellBook:GetSpell(185763)
-- local Opportunity            = Bastion.SpellBook:GetSpell(279876)
-- local OpportunityAura        = Bastion.SpellBook:GetSpell(195627)
-- local GreenskinsWickers      = Bastion.SpellBook:GetSpell(386823)
-- local QuickDraw              = Bastion.SpellBook:GetSpell(196938)
-- local Weaponmaster           = Bastion.SpellBook:GetSpell(200733)
-- local SinisterStrike         = Bastion.SpellBook:GetSpell(193315)
-- local AdrenalineRush         = Bastion.SpellBook:GetSpell(13750)
-- local ImprovedAdrenalineRush = Bastion.SpellBook:GetSpell(395422)
-- local BladeRush              = Bastion.SpellBook:GetSpell(271877)
-- local MarkedForDeath         = Bastion.SpellBook:GetSpell(137619)
-- local ThistleTea             = Bastion.SpellBook:GetSpell(381623)
-- local PotionOfUnbridledFury  = Bastion.SpellBook:GetSpell(169299)
-- local Bloodlust              = Bastion.SpellBook:GetSpell(2825)
-- local BloodFury              = Bastion.SpellBook:GetSpell(20572)
-- local Berserking             = Bastion.SpellBook:GetSpell(26297)
-- local Fireblood              = Bastion.SpellBook:GetSpell(265221)
-- local AncestralCall          = Bastion.SpellBook:GetSpell(274738)
-- local SliceAndDice           = Bastion.SpellBook:GetSpell(315496)
-- local SwiftSlasher           = Bastion.SpellBook:GetSpell(381988)
-- local ColdBlood              = Bastion.SpellBook:GetSpell(382245)
-- local Dispatch               = Bastion.SpellBook:GetSpell(2098)
-- local Vanish                 = Bastion.SpellBook:GetSpell(1856)

-- local Broadside          = Bastion.SpellBook:GetSpell(193356)
-- local GrandMelee         = Bastion.SpellBook:GetSpell(193358)
-- local SkullAndCrossbones = Bastion.SpellBook:GetSpell(199603)
-- local TrueBearing        = Bastion.SpellBook:GetSpell(193359)
-- local LoadedDice         = Bastion.SpellBook:GetSpell(256171)
-- local BuriedTreasure     = Bastion.SpellBook:GetSpell(199600)
-- local RuthlessPrecision  = Bastion.SpellBook:GetSpell(193357)

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

--         if Player:InMelee(unit) and unit:IsInterruptible(5) and Player:IsFacing(unit) then
--             purge = unit
--             return true
--         end
--     end)

--     if purge == nil then
--         purge = None
--     end

--     return purge
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

-- local Explosive = Bastion.UnitManager:CreateCustomUnit('explosive', function(unit)
--     local explosive = nil

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

--         if Player:InMelee(unit) and unit:GetID() == 120651 and Player:IsFacing(unit) then

--             explosive = unit
--             return true
--         end
--     end)

--     if explosive == nil then
--         explosive = None
--     end

--     return explosive
-- end)

-- local DefaultAPL = Bastion.APL:New('default')
-- local StealthAPL = Bastion.APL:New('stealth')
-- local CDsAPL = Bastion.APL:New('cds')
-- local FinishAPL = Bastion.APL:New('finish')
-- local BuildAPL = Bastion.APL:New('build')
-- local StealthCDsAPL = Bastion.APL:New('stealthcds')

-- -- # Executed every time the actor is available.
-- -- # Restealth if possible (no vulnerable enemies in combat)
-- -- actions=stealth

-- DefaultAPL:AddSpell(
--     Stealth:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and not Player:GetAuras():FindMy(Stealth):IsUp() and
--                 not Player:IsAffectingCombat() and not IsMounted()
--         end
--     ):SetTarget(Player)
-- )

-- -- # Interrupt on cooldown to allow simming interactions with that
-- -- actions+=/kick
-- DefaultAPL:AddSpell(
--     Kick:CastableIf(function(self)
--         return self:IsKnownAndUsable() and KickTarget:Exists() and self:IsInRange(KickTarget) and
--             self:IsKnownAndUsable() and
--             not Player:IsCastingOrChanneling() and Player:IsFacing(Target)
--     end):SetTarget(KickTarget)
-- )
-- -- # Checks if we are in an appropriate Stealth state for triggering the Count the Odds bonus
-- -- actions+=/variable,name=stealthed_cto,value=talent.count_the_odds&(stealthed.basic|buff.shadowmeld.up|buff.shadow_dance.up)
-- DefaultAPL:AddVariable(
--     'stealthed_cto',
--     function()
--         return CountTheOdds:IsKnown() and (Player:GetAuras():FindMy(Stealth):IsUp() or
--             Player:GetAuras():FindMy(Shadowmeld):IsUp() or
--             Player:GetAuras():FindMy(ShadowDanceAura):IsUp())
--     end
-- )

-- local function GetRTBCount()
--     local count = 0

--     if Player:GetAuras():FindMy(Broadside):IsUp() then
--         count = count + 1
--     end

--     if Player:GetAuras():FindMy(GrandMelee):IsUp() then
--         count = count + 1
--     end

--     if Player:GetAuras():FindMy(SkullAndCrossbones):IsUp() then
--         count = count + 1
--     end

--     if Player:GetAuras():FindMy(TrueBearing):IsUp() then
--         count = count + 1
--     end

--     if Player:GetAuras():FindMy(LoadedDice):IsUp() then
--         count = count + 1
--     end

--     if Player:GetAuras():FindMy(BuriedTreasure):IsUp() then
--         count = count + 1
--     end

--     if Player:GetAuras():FindMy(RuthlessPrecision):IsUp() then
--         count = count + 1
--     end

--     return count
-- end

-- -- # Roll the Bones Reroll Conditions
-- -- actions+=/variable,name=rtb_reroll,if=!talent.hidden_opportunity,value=rtb_buffs<2&(!buff.broadside.up&(!talent.fan_the_hammer|!buff.skull_and_crossbones.up)&!buff.true_bearing.up|buff.loaded_dice.up)|rtb_buffs=2&(buff.buried_treasure.up&buff.grand_melee.up|!buff.broadside.up&!buff.true_bearing.up&buff.loaded_dice.up)
-- DefaultAPL:AddVariable(
--     'rtb_reroll',
--     function()
--         if not HiddenOpportunity:IsKnown() then
--             return GetRTBCount() < 2 and
--                 (not Player:GetAuras():FindMy(Broadside):IsUp() and
--                     (not FanTheHammer:IsKnown() or
--                         not Player:GetAuras():FindMy(SkullAndCrossbones):IsUp()) and
--                     not Player:GetAuras():FindMy(TrueBearing):IsUp() or
--                     Player:GetAuras():FindMy(LoadedDice):IsUp()) or
--                 GetRTBCount() == 2 and
--                 (Player:GetAuras():FindMy(BuriedTreasure):IsUp() and
--                     Player:GetAuras():FindMy(GrandMelee):IsUp() or
--                     not Player:GetAuras():FindMy(Broadside):IsUp() and
--                     not Player:GetAuras():FindMy(TrueBearing):IsUp() and
--                     Player:GetAuras():FindMy(LoadedDice):IsUp())
--         end
--     end
-- )

-- -- # Additional Reroll Conditions for Keep it Rolling or Count the Odds
-- -- actions+=/variable,name=rtb_reroll,if=!talent.hidden_opportunity&(talent.keep_it_rolling|talent.count_the_odds),value=variable.rtb_reroll|((rtb_buffs.normal=0&rtb_buffs.longer>=1)&!(buff.broadside.up&buff.true_bearing.up&buff.skull_and_crossbones.up)&!(buff.broadside.remains>39|buff.true_bearing.remains>39|buff.ruthless_precision.remains>39|buff.skull_and_crossbones.remains>39))
-- DefaultAPL:AddVariable(
--     'rtb_reroll',
--     function()
--         if not HiddenOpportunity:IsKnown() then
--             return GetRTBCount() < 2 and
--                 (not Player:GetAuras():FindMy(Broadside):IsUp() and
--                     (not FanTheHammer:IsKnown() or
--                         not Player:GetAuras():FindMy(SkullAndCrossbones):IsUp()) and
--                     not Player:GetAuras():FindMy(TrueBearing):IsUp() or
--                     Player:GetAuras():FindMy(LoadedDice):IsUp()) or
--                 GetRTBCount() == 2 and
--                 (Player:GetAuras():FindMy(BuriedTreasure):IsUp() and
--                     Player:GetAuras():FindMy(GrandMelee):IsUp() or
--                     not Player:GetAuras():FindMy(Broadside):IsUp() and
--                     not Player:GetAuras():FindMy(TrueBearing):IsUp() and
--                     Player:GetAuras():FindMy(LoadedDice):IsUp())
--         end
--     end
-- )

-- -- # With Hidden Opportunity, prioritize rerolling for Skull and Crossbones over everything else
-- -- actions+=/variable,name=rtb_reroll,if=talent.hidden_opportunity,value=!rtb_buffs.will_lose.skull_and_crossbones&(rtb_buffs.will_lose-rtb_buffs.will_lose.grand_melee)<2+buff.loaded_dice.up
-- DefaultAPL:AddVariable(
--     'rtb_reroll',
--     function()
--         if HiddenOpportunity:IsKnown() then
--             return not Player:GetAuras():FindMy(SkullAndCrossbones):IsUp() and
--                 ((Player:GetAuras():FindMy(SkullAndCrossbones):IsUp() and 1 or 0) -
--                     (Player:GetAuras():FindMy(GrandMelee):IsUp() and 1 or 0)) <
--                 2 + (Player:GetAuras():FindMy(LoadedDice):IsUp() and 1 or 0)
--         end
--     end
-- )

-- -- # Avoid rerolls when we will not have time remaining on the fight or add wave to recoup the opportunity cost of the global
-- -- actions+=/variable,name=rtb_reroll,op=reset,if=!(raid_event.adds.remains>12|raid_event.adds.up&(raid_event.adds.in-raid_event.adds.remains)<6|target.time_to_die>12)|fight_remains<12
-- DefaultAPL:AddVariable(
--     'rtb_reroll',
--     function()
--         if not HiddenOpportunity:IsKnown() then
--             return GetRTBCount() < 2 and
--                 (not Player:GetAuras():FindMy(Broadside):IsUp() and
--                     (not FanTheHammer:IsKnown() or
--                         not Player:GetAuras():FindMy(SkullAndCrossbones):IsUp()) and
--                     not Player:GetAuras():FindMy(TrueBearing):IsUp() or
--                     Player:GetAuras():FindMy(LoadedDice):IsUp()) or
--                 GetRTBCount() == 2 and
--                 (Player:GetAuras():FindMy(BuriedTreasure):IsUp() and
--                     Player:GetAuras():FindMy(GrandMelee):IsUp() or
--                     not Player:GetAuras():FindMy(Broadside):IsUp() and
--                     not Player:GetAuras():FindMy(TrueBearing):IsUp() and
--                     Player:GetAuras():FindMy(LoadedDice):IsUp())
--         end
--     end
-- )

-- -- # Ensure we get full Ambush CP gains and aren't rerolling Count the Odds buffs away
-- -- actions+=/variable,name=ambush_condition,value=combo_points.deficit>=2+talent.improved_ambush+buff.broadside.up&energy>=50&(!talent.count_the_odds|buff.roll_the_bones.remains>=10)
-- DefaultAPL:AddVariable(
--     'ambush_condition',
--     function()
--         return Player:GetComboPointsDeficit() >= 2 + (ImprovedAmbush:IsKnown() and 1 or 0) +
--             (Player:GetAuras():FindMy(Broadside):IsUp() and 1 or 0) and
--             Player:GetPower() >= 50 and
--             (not CountTheOdds:IsKnown() or
--                 Player:GetAuras():FindMy(RollTheBones):GetRemainingTime() >= 10)
--     end
-- )

-- -- # Finish at 6 (5 with Summarily Dispatched talented) CP or CP Max-1, whichever is greater of the two
-- -- actions+=/variable,name=finish_condition,value=combo_points>=((cp_max_spend-1)<?(6-talent.summarily_dispatched))|effective_combo_points>=cp_max_spend
-- DefaultAPL:AddVariable(
--     'finish_condition',
--     function()
--         return Player:GetComboPoints() >=
--             math.min(Player:GetComboPointsMax() - 1, 6 - (SummarilyDispatched:IsKnown() and 1 or 0)) or
--             Player:GetComboPoints() >= Player:GetComboPointsMax()
--     end
-- )

-- -- # With multiple targets, this variable is checked to decide whether some CDs should be synced with Blade Flurry
-- -- actions+=/variable,name=blade_flurry_sync,value=spell_targets.blade_flurry<2&raid_event.adds.in>20|buff.blade_flurry.remains>1+talent.killing_spree.enabled
-- DefaultAPL:AddVariable(
--     'blade_flurry_sync',
--     function()
--         return Player:GetMeleeAttackers() < 2 and
--             (not Player:GetAuras():FindMy(BladeFlurry):IsUp() or
--                 Player:GetAuras():FindMy(BladeFlurry):GetRemainingTime() > 1 +
--                 (KillingSpree:IsKnown() and 1 or 0))
--     end
-- )

-- -- # Higher priority Stealth list for Count the Odds or true Stealth/Vanish that will break in a single global
-- -- actions+=/call_action_list,name=stealth,if=stealthed.basic|buff.shadowmeld.up
-- DefaultAPL:AddAPL(
--     StealthAPL,
--     function()
--         return Player:IsStealthed() or Player:GetAuras():FindMy(Shadowmeld):IsUp()
--     end
-- )

-- -- actions+=/call_action_list,name=cds
-- DefaultAPL:AddAPL(
--     CDsAPL,
--     function()
--         return true
--     end
-- )

-- -- # Lower priority Stealth list for Shadow Dance
-- -- actions+=/call_action_list,name=stealth,if=variable.stealthed_cto
-- DefaultAPL:AddAPL(
--     StealthAPL,
--     function()
--         return DefaultAPL:GetVariable('stealthed_cto')
--     end
-- )

-- -- actions+=/run_action_list,name=finish,if=variable.finish_condition
-- DefaultAPL:AddAPL(
--     FinishAPL,
--     function()
--         return DefaultAPL:GetVariable('finish_condition')
--     end
-- )

-- -- actions+=/call_action_list,name=build
-- DefaultAPL:AddAPL(
--     BuildAPL,
--     function()
--         return true
--     end
-- )

-- -- actions+=/arcane_torrent,if=energy.base_deficit>=15+energy.regen
-- DefaultAPL:AddSpell(
--     ArcaneTorrent:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and Player:GetPowerDeficit() >= 15 + Player:GetPowerRegen()
--         end
--     ):SetTarget(Target)

-- )

-- -- actions+=/arcane_pulse
-- DefaultAPL:AddSpell(
--     ArcanePulse:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and true
--         end
--     ):SetTarget(Target)
-- )

-- -- actions+=/lights_judgment
-- DefaultAPL:AddSpell(
--     LightsJudgment:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and true
--         end
--     ):SetTarget(Target)
-- )

-- -- actions+=/bag_of_tricks
-- DefaultAPL:AddSpell(
--     BagOfTricks:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and true
--         end
--     ):SetTarget(Target)
-- )

-- -- # Builders
-- -- actions.build=sepsis,target_if=max:target.time_to_die*debuff.between_the_eyes.up,if=target.time_to_die>11&debuff.between_the_eyes.up|fight_remains<11
-- BuildAPL:AddSpell(
--     Sepsis:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and ((Target:TimeToDie() > 11 and
--                 Target:GetAuras():FindMy(BetweenTheEyes):IsUp()) or
--                 Player:TimeToDie() < 11)
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.build+=/ghostly_strike,if=debuff.ghostly_strike.remains<=3&(spell_targets.blade_flurry<=2|buff.dreadblades.up)&!buff.subterfuge.up&target.time_to_die>=5
-- BuildAPL:AddSpell(
--     GhostlyStrike:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and Target:GetAuras():FindMy(GhostlyStrike):GetRemainingTime() <= 3 and
--                 (Player:GetMeleeAttackers() <= 2 or Player:GetAuras():FindMy(Dreadblades):IsUp()) and
--                 not Player:GetAuras():FindMy(Subterfuge):IsUp() and Target:TimeToDie() >= 5
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.build+=/echoing_reprimand,if=!buff.dreadblades.up
-- BuildAPL:AddSpell(
--     EchoingReprimand:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and not Player:GetAuras():FindMy(Dreadblades):IsUp()
--         end
--     ):SetTarget(Target)
-- )

-- -- # High priority Ambush line to apply Find Weakness or consume Audacity/Sepsis buff before Pistol Shot
-- -- actions.build+=/ambush,if=(talent.hidden_opportunity|talent.keep_it_rolling)&(buff.audacity.up|buff.sepsis_buff.up|buff.subterfuge.up&cooldown.keep_it_rolling.ready)|talent.find_weakness&debuff.find_weakness.down
-- BuildAPL:AddSpell(
--     Ambush:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and ((HiddenOpportunity:IsKnown() or KeepItRolling:IsKnown()) and
--                 (Player:GetAuras():FindMy(Audacity):IsUp() or Player:GetAuras():FindMy(Sepsis):IsUp() or
--                     (Player:GetAuras():FindMy(Subterfuge):IsUp() and KeepItRolling:OnCooldown())) or
--                 (FindWeakness:IsKnown() and Target:GetAuras():FindMy(FindWeakness):IsDown()))
--         end
--     ):SetTarget(Target)
-- )

-- -- # With Audacity + Hidden Opportunity + Fan the Hammer, use Pistol Shot to proc Audacity any time Ambush is not available
-- -- actions.build+=/pistol_shot,if=talent.fan_the_hammer&talent.audacity&talent.hidden_opportunity&buff.opportunity.up&!buff.audacity.up&!buff.subterfuge.up&!buff.shadow_dance.up
-- BuildAPL:AddSpell(
--     PistolShot:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and FanTheHammer:IsKnown() and Audacity:IsKnown() and
--                 HiddenOpportunity:IsKnown() and
--                 Player:GetAuras():FindMy(OpportunityAura):IsUp() and not Player:GetAuras():FindMy(Audacity):IsUp() and
--                 not Player:GetAuras():FindMy(Subterfuge):IsUp() and not Player:GetAuras():FindMy(ShadowDance):IsUp()
--         end
--     ):SetTarget(Target)
-- )

-- -- # Use Greenskins Wickers buff immediately with Opportunity unless running Fan the Hammer
-- -- actions.build+=/pistol_shot,if=buff.greenskins_wickers.up&(!talent.fan_the_hammer&buff.opportunity.up|buff.greenskins_wickers.remains<1.5)
-- BuildAPL:AddSpell(
--     PistolShot:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and Player:GetAuras():FindMy(GreenskinsWickers):IsUp() and
--                 (not FanTheHammer:IsKnown() and Player:GetAuras():FindMy(OpportunityAura):IsUp() or
--                     Player:GetAuras():FindMy(GreenskinsWickers):GetRemainingTime() < 1.5)
--         end
--     ):SetTarget(Target)
-- )

-- --   const int stacks = 1 + as<int>( p()->talent.outlaw.fan_the_hammer->effectN( 1 ).base_value() );
-- local function MaxOpportunity()
--     return 1 + (FanTheHammer:IsKnown() and 1 or 0)
-- end

-- -- # With Fan the Hammer, consume Opportunity at max stacks or if we will get max 4+ CP and Dreadblades is not up
-- -- actions.build+=/pistol_shot,if=talent.fan_the_hammer&buff.opportunity.up&(buff.opportunity.stack>=buff.opportunity.max_stack|buff.opportunity.remains<2)
-- BuildAPL:AddSpell(
--     PistolShot:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and FanTheHammer:IsKnown() and
--                 Player:GetAuras():FindMy(OpportunityAura):IsUp() and
--                 (
--                 Player:GetAuras():FindMy(OpportunityAura):GetCount() >=
--                     MaxOpportunity()
--                     or
--                     Player:GetAuras():FindMy(OpportunityAura):GetRemainingTime() < 2)
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.build+=/pistol_shot,if=talent.fan_the_hammer&buff.opportunity.up&combo_points.deficit>((1+talent.quick_draw)*talent.fan_the_hammer.rank)&!buff.dreadblades.up&(!talent.hidden_opportunity|!buff.subterfuge.up&!buff.shadow_dance.up)
-- BuildAPL:AddSpell(
--     PistolShot:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and FanTheHammer:IsKnown() and
--                 Player:GetAuras():FindMy(OpportunityAura):IsUp() and
--                 Player:GetComboPointsDeficit() > ((1 + (QuickDraw:IsKnown() and 1 or 0)) * 1) and
--                 not Player:GetAuras():FindMy(Dreadblades):IsUp() and
--                 (not HiddenOpportunity:IsKnown() or not Player:GetAuras():FindMy(Subterfuge):IsUp() and
--                     not Player:GetAuras():FindMy(ShadowDance):IsUp())
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.build+=/pool_resource,for_next=1
-- -- actions.build+=/ambush,if=talent.hidden_opportunity|talent.find_weakness&debuff.find_weakness.down
-- BuildAPL:AddSpell(
--     Ambush:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and (HiddenOpportunity:IsKnown() or
--                 (FindWeakness:IsKnown() and Target:GetAuras():FindMy(FindWeakness):IsDown()))
--         end
--     ):SetTarget(Target)
-- )

-- -- # Use Pistol Shot with Opportunity if Combat Potency won't overcap energy, when it will exactly cap CP, or when using Quick Draw
-- -- actions.build+=/pistol_shot,if=!talent.fan_the_hammer&buff.opportunity.up&(energy.base_deficit>energy.regen*1.5|!talent.weaponmaster&combo_points.deficit<=1+buff.broadside.up|talent.quick_draw.enabled|talent.audacity.enabled&!buff.audacity.up)
-- BuildAPL:AddSpell(
--     PistolShot:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and not FanTheHammer:IsKnown() and
--                 Player:GetAuras():FindMy(OpportunityAura):IsUp() and
--                 (Player:GetPowerDeficit() > Player:GetPowerRegen() * 1.5 or
--                     (not Weaponmaster:IsKnown() and
--                         Player:GetComboPointsDeficit() <= 1 + (Player:GetAuras():FindMy(Broadside):IsUp() and 1 or 0)) or
--                     QuickDraw:IsKnown() or
--                     (Audacity:IsKnown() and not Player:GetAuras():FindMy(Audacity):IsUp()))
--         end
--     ):SetTarget(Target)
-- )


-- -- actions.build+=/sinister_strike
-- BuildAPL:AddSpell(
--     SinisterStrike:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and true
--         end
--     ):SetTarget(Target)
-- )

-- -- # Cooldowns
-- -- actions.cds=adrenaline_rush,if=!buff.adrenaline_rush.up&(!talent.improved_adrenaline_rush|combo_points<=2)
-- CDsAPL:AddSpell(
--     AdrenalineRush:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and not Player:GetAuras():FindMy(AdrenalineRush):IsUp() and
--                 (not ImprovedAdrenalineRush:IsKnown() or Player:GetComboPoints() <= 2)
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.cds+=/blade_flurry,if=spell_targets>=2&buff.blade_flurry.remains<gcd
-- CDsAPL:AddSpell(
--     BladeFlurry:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and Target:GetMeleeAttackers() >= 2 and
--                 Player:GetAuras():FindMy(BladeFlurry):GetRemainingTime() < Player:GetGCD()
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.cds+=/roll_the_bones,if=buff.dreadblades.down&(rtb_buffs.total=0|variable.rtb_reroll)
-- CDsAPL:AddSpell(
--     RollTheBones:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and Player:GetAuras():FindMy(Dreadblades):IsDown() and
--                 (GetRTBCount() == 0 or
--                     DefaultAPL:GetVariable("rtb_reroll"))
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.cds+=/keep_it_rolling,if=!variable.rtb_reroll&(buff.broadside.up+buff.true_bearing.up+buff.skull_and_crossbones.up+buff.ruthless_precision.up)>2&(buff.shadow_dance.down|rtb_buffs>=6)
-- CDsAPL:AddSpell(
--     RollTheBones:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and not DefaultAPL:GetVariable("rtb_reroll") and
--                 ((Player:GetAuras():FindMy(Broadside):IsUp() and 1 or 0) +
--                     (Player:GetAuras():FindMy(TrueBearing):IsUp() and 1 or 0) +
--                     (Player:GetAuras():FindMy(SkullAndCrossbones):IsUp() and 1 or 0) +
--                     (Player:GetAuras():FindMy(RuthlessPrecision):IsUp() and 1 or 0)) > 2 and
--                 (Player:GetAuras():FindMy(ShadowDance):IsDown() or
--                     GetRTBCount() >= 6)
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.cds+=/blade_rush,if=variable.blade_flurry_sync&!buff.dreadblades.up&(energy.base_time_to_max>4+stealthed.rogue-spell_targets%3)
-- CDsAPL:AddSpell(
--     BladeRush:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and DefaultAPL:GetVariable("blade_flurry_sync") and
--                 not Player:GetAuras():FindMy(Dreadblades):IsUp() and
--                 (Player:GetTimeToPowerPercent() > 4 + (Player:GetAuras():FindMy(Subterfuge):IsUp() and 1 or 0) +
--                     (Player:GetAuras():FindMy(ShadowDance):IsUp() and 1 or 0) - Target:GetMeleeAttackers() % 3)
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.cds+=/call_action_list,name=stealth_cds,if=!stealthed.all|talent.count_the_odds&!variable.stealthed_cto
-- CDsAPL:AddAPL(
--     StealthCDsAPL,
--     function()
--         return not Player:GetAuras():FindMy(Stealth):IsUp() or
--             (CountTheOdds:IsKnown() and not DefaultAPL:GetVariable("stealthed_cto"))
--     end
-- )

-- -- actions.cds+=/dreadblades,if=!(variable.stealthed_cto|stealthed.basic|talent.hidden_opportunity&stealthed.rogue)&combo_points<=2&(!talent.marked_for_death|!cooldown.marked_for_death.ready)&target.time_to_die>=10
-- CDsAPL:AddSpell(
--     Dreadblades:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and
--                 not (DefaultAPL:GetVariable("stealthed_cto") or Player:GetAuras():FindMy(Stealth):IsUp() or
--                     (HiddenOpportunity:IsKnown() and Player:GetAuras():FindMy(Subterfuge):IsUp())) and
--                 Player:GetComboPoints() <= 2 and
--                 (not MarkedForDeath:IsKnown() or not MarkedForDeath:CooldownUp()) and
--                 Target:TimeToDie() >= 10
--         end
--     ):SetTarget(Target)
-- )

-- -- # If adds are up, snipe the one with lowest TTD. Use when dying faster than CP deficit or without any CP.
-- -- actions.cds+=/marked_for_death,line_cd=1.5,target_if=min:target.time_to_die,if=raid_event.adds.up&(target.time_to_die<combo_points.deficit|combo_points.deficit>=cp_max_spend-1)&!buff.dreadblades.up

-- -- # If no adds will die within the next 30s, use MfD on boss without any CP.
-- -- actions.cds+=/marked_for_death,if=raid_event.adds.in>30-raid_event.adds.duration&combo_points.deficit>=cp_max_spend-1&!buff.dreadblades.up

-- -- actions.cds+=/thistle_tea,if=!buff.thistle_tea.up&(energy.base_deficit>=100|fight_remains<charges*6)
-- CDsAPL:AddSpell(
--     ThistleTea:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and Player:GetAuras():FindMy(ThistleTea):IsDown() and
--                 (Player:GetPowerDeficit() >= 100 or Target:TimeToDie() < ThistleTea:Charges() * 6)
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.cds+=/killing_spree,if=variable.blade_flurry_sync&!stealthed.rogue&debuff.between_the_eyes.up&energy.base_time_to_max>4
-- CDsAPL:AddSpell(
--     KillingSpree:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and DefaultAPL:GetVariable("blade_flurry_sync") and
--                 not Player:GetAuras():FindMy(Subterfuge):IsUp() and
--                 Target:GetAuras():FindMy(BetweenTheEyes):IsUp() and
--                 Player:GetTimeToPowerPercent() > 4
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.cds+=/shadowmeld,if=!stealthed.all&(talent.count_the_odds&variable.finish_condition|!talent.weaponmaster.enabled&variable.ambush_condition)
-- CDsAPL:AddSpell(
--     Shadowmeld:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and not Player:GetAuras():FindMy(Stealth):IsUp() and
--                 (CountTheOdds:IsKnown() and DefaultAPL:GetVariable("finish_condition") or
--                     not Weaponmaster:IsKnown() and DefaultAPL:GetVariable("ambush_condition"))
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.cds+=/potion,if=buff.bloodlust.react|fight_remains<30|buff.adrenaline_rush.up
-- -- CDsAPL:AddItem(
-- --     PotionOfUnbridledFury:CastableIf(
-- --         function(self)
-- --             return self:IsKnownAndUsable() and Player:GetAuras():FindMy(Bloodlust):IsUp() or Target:TimeToDie() < 30 or
-- --                 Player:GetAuras():FindMy(AdrenalineRush):IsUp()
-- --         end
-- --     ):SetTarget(Target)
-- -- )

-- -- actions.cds+=/blood_fury
-- CDsAPL:AddSpell(
--     BloodFury:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and true
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.cds+=/berserking
-- CDsAPL:AddSpell(
--     Berserking:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and true
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.cds+=/fireblood
-- CDsAPL:AddSpell(
--     Fireblood:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and true
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.cds+=/ancestral_call
-- CDsAPL:AddSpell(
--     AncestralCall:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and true
--         end
--     ):SetTarget(Target)
-- )

-- -- # Default conditions for usable items.
-- -- actions.cds+=/use_item,name=manic_grieftorch,if=!stealthed.all&!buff.adrenaline_rush.up|fight_remains<5
-- -- actions.cds+=/use_item,name=stormeaters_boon,if=spell_targets.blade_flurry>desired_targets|raid_event.adds.in>60|fight_remains<10
-- -- actions.cds+=/use_item,name=windscar_whetstone,if=spell_targets.blade_flurry>desired_targets|raid_event.adds.in>60|fight_remains<7
-- -- actions.cds+=/use_items,slots=trinket1,if=debuff.between_the_eyes.up|trinket.1.has_stat.any_dps|fight_remains<=20
-- -- actions.cds+=/use_items,slots=trinket2,if=debuff.between_the_eyes.up|trinket.2.has_stat.any_dps|fight_remains<=20

-- -- # Finishers  BtE to keep the Crit debuff up, if RP is up, or for Greenskins, unless the target is about to die.
-- -- actions.finish=between_the_eyes,if=target.time_to_die>3&(debuff.between_the_eyes.remains<4|talent.greenskins_wickers&!buff.greenskins_wickers.up|!talent.greenskins_wickers&buff.ruthless_precision.up)
-- FinishAPL:AddSpell(
--     BetweenTheEyes:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and Target:TimeToDie() > 3 and
--                 (Target:GetAuras():FindMy(BetweenTheEyes):GetRemainingTime() < 4 or
--                     GreenskinsWickers:IsKnown() and Player:GetAuras():FindMy(GreenskinsWickers):IsDown() or
--                     not GreenskinsWickers:IsKnown() and Player:GetAuras():FindMy(RuthlessPrecision):IsUp())
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.finish+=/slice_and_dice,if=buff.slice_and_dice.remains<fight_remains&refreshable&(!talent.swift_slasher|combo_points>=cp_max_spend)
-- FinishAPL:AddSpell(
--     SliceAndDice:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and
--                 Player:GetAuras():FindMy(SliceAndDice):GetRemainingTime() < Target:TimeToDie() and
--                 Player:GetAuras():FindMy(SliceAndDice):GetRemainingTime() < 6 and
--                 (not SwiftSlasher:IsKnown() or Player:GetComboPoints() >= Player:GetComboPointsMax())
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.finish+=/cold_blood
-- FinishAPL:AddSpell(
--     ColdBlood:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and true
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.finish+=/dispatch
-- FinishAPL:AddSpell(
--     Dispatch:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and true
--         end
--     ):SetTarget(Target)
-- )

-- -- # Stealth
-- -- actions.stealth=blade_flurry,if=talent.subterfuge&talent.hidden_opportunity&spell_targets>=2&!buff.blade_flurry.up
-- StealthAPL:AddSpell(
--     BladeFlurry:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and Subterfuge:IsKnown() and HiddenOpportunity:IsKnown() and
--                 Target:GetMeleeAttackers() >= 2 and
--                 not Player:GetAuras():FindMy(BladeFlurry):IsUp()
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.stealth+=/cold_blood,if=variable.finish_condition
-- StealthAPL:AddSpell(
--     ColdBlood:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and DefaultAPL:GetVariable('finish_condition')
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.stealth+=/dispatch,if=variable.finish_condition
-- StealthAPL:AddSpell(
--     Dispatch:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and DefaultAPL:GetVariable('finish_condition')
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.stealth+=/ambush,if=variable.stealthed_cto|stealthed.basic&talent.find_weakness&!debuff.find_weakness.up|talent.hidden_opportunity
-- StealthAPL:AddSpell(
--     Ambush:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and (DefaultAPL:GetVariable('stealthed_cto') or
--                 Player:IsStealthed() and FindWeakness:IsKnown() and not Target:GetAuras():FindMy(FindWeakness):IsUp() or
--                 HiddenOpportunity:IsKnown())
--         end
--     ):SetTarget(Target)
-- )

-- -- # Stealth Cooldowns
-- -- actions.stealth_cds=variable,name=vanish_condition,value=talent.hidden_opportunity|!talent.shadow_dance|!cooldown.shadow_dance.ready
-- StealthAPL:AddVariable(
--     'vanish_condition',
--     function()
--         return HiddenOpportunity:IsKnown() or not ShadowDance:IsKnown() or not ShadowDance:CooldownUp()
--     end
-- )

-- -- actions.stealth_cds+=/variable,name=vanish_opportunity_condition,value=!talent.shadow_dance&talent.fan_the_hammer.rank+talent.quick_draw+talent.audacity<talent.count_the_odds+talent.keep_it_rolling
-- StealthAPL:AddVariable(
--     'vanish_opportunity_condition',
--     function()
--         return not ShadowDance:IsKnown() and
--             (FanTheHammer:IsKnown() and 1 or 0) + (QuickDraw:IsKnown() and 1 or 0) + (Audacity:IsKnown() and 1 or 0) <
--             (CountTheOdds:IsKnown() and 1 or 0) + (KeepItRolling:IsKnown() and 1 or 0)
--     end
-- )

-- -- actions.stealth_cds+=/vanish,if=talent.find_weakness&!talent.audacity&debuff.find_weakness.down&variable.ambush_condition&variable.vanish_condition
-- StealthAPL:AddSpell(
--     Vanish:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and FindWeakness:IsKnown() and not Audacity:IsKnown() and
--                 not Target:GetAuras():FindMy(FindWeakness):IsUp() and
--                 DefaultAPL:GetVariable('ambush_condition') and StealthAPL:GetVariable('vanish_condition')
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.stealth_cds+=/vanish,if=talent.hidden_opportunity&!buff.audacity.up&(variable.vanish_opportunity_condition|buff.opportunity.stack<buff.opportunity.max_stack)&variable.ambush_condition&variable.vanish_condition
-- StealthAPL:AddSpell(
--     Vanish:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and HiddenOpportunity:IsKnown() and
--                 not Player:GetAuras():FindMy(Audacity):IsUp() and
--                 (StealthAPL:GetVariable('vanish_opportunity_condition') or
--                     Player:GetAuras():FindMy(OpportunityAura):GetCount() <
--                     MaxOpportunity()) and
--                 DefaultAPL:GetVariable('ambush_condition') and StealthAPL:GetVariable('vanish_condition')
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.stealth_cds+=/vanish,if=(!talent.find_weakness|talent.audacity)&!talent.hidden_opportunity&variable.finish_condition&variable.vanish_condition
-- StealthAPL:AddSpell(
--     Vanish:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and (not FindWeakness:IsKnown() or Audacity:IsKnown()) and
--                 not HiddenOpportunity:IsKnown() and
--                 DefaultAPL:GetVariable('finish_condition') and StealthAPL:GetVariable('vanish_condition')
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.stealth_cds+=/variable,name=shadow_dance_condition,value=talent.shadow_dance&debuff.between_the_eyes.up&(!talent.ghostly_strike|debuff.ghostly_strike.up)&(!talent.dreadblades|!cooldown.dreadblades.ready)&(!talent.hidden_opportunity|!buff.audacity.up&(talent.fan_the_hammer.rank<2|!buff.opportunity.up))
-- StealthAPL:AddVariable(
--     'shadow_dance_condition',
--     function()
--         return ShadowDance:IsKnown() and Target:GetAuras():FindMy(BetweenTheEyes):IsUp() and
--             (not GhostlyStrike:IsKnown() or Target:GetAuras():FindMy(GhostlyStrike):IsUp()) and
--             (not Dreadblades:IsKnown() or not Dreadblades:CooldownUp()) and
--             (not HiddenOpportunity:IsKnown() or not Player:GetAuras():FindMy(Audacity):IsUp() and
--                 (1 < 2 or not Player:GetAuras():FindMy(OpportunityAura):IsUp()))
--     end
-- )

-- -- actions.stealth_cds+=/shadow_dance,if=!talent.keep_it_rolling&variable.shadow_dance_condition&buff.slice_and_dice.up&(variable.finish_condition|talent.hidden_opportunity)&(!talent.hidden_opportunity|!cooldown.vanish.ready)
-- StealthAPL:AddSpell(
--     ShadowDance:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and not KeepItRolling:IsKnown() and
--                 StealthAPL:GetVariable('shadow_dance_condition') and
--                 Player:GetAuras():FindMy(SliceAndDice):IsUp() and
--                 (DefaultAPL:GetVariable('finish_condition') or HiddenOpportunity:IsKnown()) and
--                 (not HiddenOpportunity:IsKnown() or not Vanish:CooldownUp())
--         end
--     ):SetTarget(Target)
-- )

-- -- actions.stealth_cds+=/shadow_dance,if=talent.keep_it_rolling&variable.shadow_dance_condition&(cooldown.keep_it_rolling.remains<=30|cooldown.keep_it_rolling.remains>120&(variable.finish_condition|talent.hidden_opportunity))
-- StealthAPL:AddSpell(
--     ShadowDance:CastableIf(
--         function(self)
--             return self:IsKnownAndUsable() and KeepItRolling:IsKnown() and
--                 StealthAPL:GetVariable('shadow_dance_condition') and
--                 (KeepItRolling:GetCooldownRemaining() <= 30 or
--                     KeepItRolling:GetCooldownRemaining() > 120 and
--                     (DefaultAPL:GetVariable('finish_condition') or HiddenOpportunity:IsKnown()))
--         end
--     ):SetTarget(Target)
-- )

-- OutlawModule:Sync(function()
--     print(BetweenTheEyes:IsKnownAndUsable())
--     DefaultAPL:Execute()
-- end)

-- Bastion:Register(OutlawModule)
