local Tinkr, Bastion = ...

---@class MythicPlusUtils
local MythicPlusUtils = {
    debuffLogging = false,
    random = ''
}

MythicPlusUtils.__index = MythicPlusUtils

function MythicPlusUtils:New()
    local self = setmetatable({}, MythicPlusUtils)

    self.random = math.random(1000000, 9999999)
    self.kickList = {

        -- Algeth'ar Academy
        [388392] = true, -- Monotonous Lecture
        [396812] = true, -- Mystic Blast
        [377389] = true, -- Call of the Flock
        [396640] = true, -- Healing Touch
        [387843] = true, -- Astral Bomb
        [387955] = true, -- Celestial Shield
        [387910] = true, -- Astral Whirlwind

        -- Azure Vault
        -- [375602] = true, -- Erratic Growth
        [387564] = true, -- Mystic Vapors
        -- [386546] = true, -- Waking Bane
        [389804] = true, -- Heavy Tome
        [377488] = true, -- Icy Bindings

        -- Brackenhide
        [382249] = true, -- Earth Bolt
        [367500] = true, -- Hideous Cackle
        [377950] = true, -- Greater Healing Rapids
        [385029] = true, -- Screech
        [373804] = true, -- Touch of Decay
        [381770] = true, -- Gushing Ooze
        [374544] = true, -- Burst of Decay

        -- Halls of Infusion
        [374066] = true, -- Earth Shield
        [374339] = true, -- Demoralizing Shout
        [374045] = true, -- Expulse
        [374080] = true, -- Blasting Gust
        [389443] = true, -- Purifying Blast
        [395694] = true, -- Elemental Focus
        [374563] = true, -- Dazzle
        [385141] = true, -- Thunderstorm
        [374706] = true, -- Pyretic Burst
        [375384] = true, -- Rumbling Earth
        [375950] = true, -- Ice Shards
        [377348] = true, -- Tidal Divergence
        [377402] = true, -- Aqueous Barrier
        [387618] = true, -- Infuse

        -- Neltharus
        [378282] = true, -- Molten Core
        [372615] = true, -- Ember Reach
        [395427] = true, -- Burning Roar
        [372538] = true, -- Melt
        [384161] = true, -- Mote of Combustion
        [382795] = true, -- Molten Barrier

        -- Nokhud
        [384365] = true, -- Disruptive Shout
        [386024] = true, -- Tempest
        [387411] = true, -- Death Bolt Volley
        [387606] = true, -- Dominate
        [376725] = true, -- Storm Bolt
        [384808] = true, -- Guardian Wind
        [383823] = true, -- Rally the Clan (CC to interrupt)
        [387135] = true, -- Arcing Strike (CC to interrupt)
        [373395] = true, -- Bloodcurdling Shout

        -- Ruby Life Pools
        [373017] = true, -- Roaring Blaze
        [392398] = true, -- Crackling Detonation
        [392451] = true, -- Flashfire
        [385310] = true, -- Lightning Bolt
        [375602] = true, -- Erratic Growth
        -- [386546] = true, -- Waking Bane
        -- [387564] = true, -- Mystic Vapors
        [373932] = true, -- Illusionary Bolt
        [386546] = true, -- Waking Bane

        -- Uldaman
        [369675] = true, -- Chain Lightning
        [369674] = true, -- Stone Spike
        [369823] = true, -- Spiked Carapace
        [369603] = true, -- Defensive Bulwark
        [369399] = true, -- Stone Bolt
        [369400] = true, -- Earthen Ward

        -- Court of Stars
        [211401] = true, -- Drifting Embers
        [211464] = true, -- Fel Detonation
        [207980] = true, -- Disintegration Beam
        [208165] = true, -- Withering Soul
        [207881] = true, -- Infernal Eruption

        -- Halls of Valor
        [198595] = true, -- Thunderous Bolt
        [198959] = true, -- Etch
        [192288] = true, -- Searing Light
        [199726] = true, -- Unruly Yell
        [198750] = true, --  Surge

        -- Shadowmoon Burial Grounds
        [152818] = true, -- Shadow Mend
        [153153] = true, -- Dark Communion (CC to interrupt)
        [156776] = true, -- Rending Voidlash
        [156722] = true, -- Void Bolt
        [398206] = true, -- Death Blast
        [156718] = true, -- Necrotic Burst
        [153524] = true, -- Plague Spit

        -- Temple of the Jade Serpent
        [397888] = true, -- Hydrolance
        [114646] = true, -- Haunting Gaze
        [395859] = true, -- Haunting Scream
        [396073] = true, -- Cat Nap
        [397914] = true, -- Defiling Mist

        [315584] = true
    }

    Bastion.EventManager:RegisterWoWEvent('UNIT_AURA', function(unit, auras)
        if not self.debuffLogging then
            return
        end

        if auras.addedAuras then
            local addedAuras = auras.addedAuras

            if #addedAuras > 0 then
                for i = 1, #addedAuras do
                    local aura = Bastion.Aura:CreateFromUnitAuraInfo(addedAuras[i])
                    if not aura:IsBuff() then
                        WriteFile('bastion-MPlusDebuffs-' .. self.random .. '.lua', [[
                        AuraName: ]] .. aura:GetName() .. [[
                        AuraID: ]] .. aura:GetSpell():GetID() .. "\n" .. [[
                    ]]   , true)
                    end
                end
            end
        end
    end)

    return self
end

function MythicPlusUtils:ToggleDebuffLogging()
    self.debuffLogging = not self.debuffLogging
end

function MythicPlusUtils:CastingCriticalKick(unit, percent)
    local castingSpell = unit:GetCastingOrChannelingSpell()

    if castingSpell then
        local spellID = castingSpell:GetID()
        if self.kickList[spellID] and unit:IsInterruptibleAt(percent) then
            return true
        end
    end

    return false
end

return MythicPlusUtils
