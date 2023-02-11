local Tinkr, Bastion = ...

---@class MythicPlusUtils
local MythicPlusUtils = {
    debuffLogging = false,
    castLogging = false,
    random = '',
    loggedCasts = {},
    loggedDebuffs = {},
    kickList = {},
}

MythicPlusUtils.__index = MythicPlusUtils

---@return MythicPlusUtils
function MythicPlusUtils:New()
    local self = setmetatable({}, MythicPlusUtils)

    self.random = math.random(1000000, 9999999)
    self.kickList = {
        -- Algeth'ar Academy
        [396812] = { true, true }, -- https://www.wowhead.com/spell=396812/mystic-blast
        [388392] = { true, true }, -- https://www.wowhead.com/spell=388392/monotonous-lecture
        [388863] = { true, true }, -- https://www.wowhead.com/spell=388863/mana-void
        [388862] = { true, true }, -- https://www.wowhead.com/spell=388862/surge
        [377389] = { true, true }, -- https://www.wowhead.com/spell=377389/call-of-the-flock
        [388623] = { true, true }, -- https://www.wowhead.com/spell=388623/branch-out
        [396640] = { true, true }, -- https://www.wowhead.com/spell=396640/healing-touch
        [387975] = { true, true }, -- https://www.wowhead.com/spell=387975/arcane-missiles
        [387843] = { true, true }, -- https://www.wowhead.com/spell=387843/astral-bomb
        -- Court of Stars
        [211401] = { true, true }, -- https://www.wowhead.com/spell=211401/drifting-embers
        [207980] = { true, true }, -- https://www.wowhead.com/spell=207980/disintegration-beam
        [208165] = { true, true }, -- https://www.wowhead.com/spell=208165/withering-soul
        [207881] = { true, true }, -- https://www.wowhead.com/spell=207881/infernal-eruption
        [209413] = { true, false }, -- https://www.wowhead.com/spell=209413/suppress
        [209485] = { true, true }, -- https://www.wowhead.com/spell=209485/drain-magic
        [209410] = { true, true }, -- https://www.wowhead.com/spell=209410/nightfall-orb
        [211470] = { true, true }, -- https://www.wowhead.com/spell=211470/bewitch
        [225100] = { true, false }, -- https://www.wowhead.com/spell=225100/charging-station
        [211299] = { true, false }, -- https://www.wowhead.com/spell=211299/searing-glare
        -- Halls of Valor
        [198595] = { true, true }, -- https://www.wowhead.com/spell=198595/thunderous-bolt
        [198959] = { true, true }, -- https://www.wowhead.com/spell=198959/etch
        [215433] = { true, true }, -- https://www.wowhead.com/spell=215433/holy-radiance
        [192288] = { true, true }, -- https://www.wowhead.com/spell=192288/searing-light
        [199726] = { true, true }, -- https://www.wowhead.com/spell=199726/unruly-yell
        [198750] = { true, true }, -- https://www.wowhead.com/spell=198750/surge
        [198934] = { true, true }, -- https://www.wowhead.com/spell=198934/rune-of-healing
        [192563] = { true, true }, -- https://www.wowhead.com/spell=192563/cleansing-flames
        -- Ruby Life Pools
        [372749] = { true, true }, -- https://www.wowhead.com/spell=372749/ice-shield
        -- [373803] = { true, true }, -- https://www.wowhead.com/spell=373803/cold-claws
        [373017] = { true, true }, -- https://www.wowhead.com/spell=373017/roaring-blaze
        [392398] = { true, true }, -- https://www.wowhead.com/spell=392398/crackling-detonation
        [392451] = { true, true }, -- https://www.wowhead.com/spell=392451/flashfire
        [385310] = { true, true }, -- https://www.wowhead.com/spell=385310/lightning-bolt
        [384194] = { true, true }, -- https://www.wowhead.com/spell=384194/cinderbolt
        [373680] = { true, false }, -- https://www.wowhead.com/spell=373680/frost-overload
        -- Shadowmoon Burial Grounds
        [152818] = { true, true }, -- https://www.wowhead.com/spell=152818/shadow-mend
        [156776] = { true, true }, -- https://www.wowhead.com/spell=156776/rending-voidlash
        [156722] = { true, true }, -- https://www.wowhead.com/spell=156722/void-bolt
        [398206] = { true, true }, -- https://www.wowhead.com/spell=398206/death-blast
        [153524] = { true, true }, -- https://www.wowhead.com/spell=153524/plague-spit
        [156718] = { true, true }, -- https://www.wowhead.com/spell=156718/necrotic-burst
        -- Temple of the Jade Serpent
        [397888] = { true, false }, -- https://www.wowhead.com/spell=397888/hydrolance
        [395859] = { true, true }, -- https://www.wowhead.com/spell=395859/haunting-scream
        [396073] = { true, true }, -- https://www.wowhead.com/spell=396073/cat-nap
        [397914] = { true, true }, -- https://www.wowhead.com/spell=397914/defiling-mist
        [397899] = { false, true }, -- https://www.wowhead.com/spell=397899/leg-sweep
        [397801] = { true, false }, -- https://www.wowhead.com/spell=397801/hydrolance
        [395872] = { true, true }, -- https://www.wowhead.com/spell=395872/sleepy-soliloquy
        -- The Azure Vault
        [375602] = { true, true }, -- https://www.wowhead.com/spell=375602/erratic-growth
        [387564] = { true, true }, -- https://www.wowhead.com/spell=387564/mystic-vapors
        [373932] = { true, true }, -- https://www.wowhead.com/spell=373932/illusionary-bolt
        [386546] = { true, true }, -- https://www.wowhead.com/spell=386546/waking-bane
        [389804] = { true, true }, -- https://www.wowhead.com/spell=389804/heavy-tome
        [377488] = { true, true }, -- https://www.wowhead.com/spell=377488/icy-bindings
        [377503] = { true, true }, -- https://www.wowhead.com/spell=377503/condensed-frost
        [375596] = { true, true }, -- https://www.wowhead.com/spell=375596/erratic-growth
        -- NO
        [384365] = { true, true }, -- https://www.wowhead.com/spell=384365/disruptive-shout
        [386012] = { true, false }, -- https://www.wowhead.com/spell=386012/stormbolt
        [386024] = { true, true }, -- https://www.wowhead.com/spell=386024/tempest
        [387411] = { true, true }, -- https://www.wowhead.com/spell=387411/death-bolt-volley
        [387606] = { true, true }, -- https://www.wowhead.com/spell=387606/dominate
        [373395] = { true, true }, -- https://www.wowhead.com/spell=373395/bloodcurdling-shout
        [376725] = { true, true }, -- https://www.wowhead.com/spell=376725/storm-bolt
        [384808] = { true, true }, -- https://www.wowhead.com/spell=384808/guardian-wind
        -- [363607] = {true, true}, -- https://www.wowhead.com/spell=363607/domination-bolt
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

                    if not self.loggedDebuffs[aura:GetSpell():GetID()] and not aura:IsBuff() then
                        WriteFile('bastion-MPlusDebuffs-' .. self.random .. '.lua', [[
                        AuraName: ]] .. aura:GetName() .. [[
                        AuraID: ]] .. aura:GetSpell():GetID() .. "\n" .. [[
                    ]], true)
                    end
                end
            end
        end
    end)

    Bastion.EventManager:RegisterWoWEvent('UNIT_SPELLCAST_START', function(unitTarget, castGUID, spellID)
        if not self.castLogging then
            return
        end

        if self.loggedCasts[spellID] then
            return
        end

        local name = GetSpellInfo(spellID)

        self.loggedCasts[spellID] = true

        WriteFile('bastion-MPlusCasts-' .. self.random .. '.lua', [[
            CastName: ]] .. name .. [[
            CastID: ]] .. spellID .. "\n" .. [[
        ]], true)
    end)

    Bastion.EventManager:RegisterWoWEvent('UNIT_SPELLCAST_CHANNEL_START', function(unitTarget, castGUID, spellID)
        if not self.castLogging then
            return
        end

        if self.loggedCasts[spellID] then
            return
        end

        local name = GetSpellInfo(spellID)

        self.loggedCasts[spellID] = true

        WriteFile('bastion-MPlusCasts-' .. self.random .. '.lua', [[
            CastName: ]] .. name .. [[
            CastID: ]] .. spellID .. "\n" .. [[
        ]], true)
    end)

    return self
end

---@return nil
function MythicPlusUtils:ToggleDebuffLogging()
    self.debuffLogging = not self.debuffLogging
end

---@return nil
function MythicPlusUtils:ToggleCastLogging()
    self.castLogging = not self.castLogging
end

---@param unit Unit
---@param percent number
---@return boolean
function MythicPlusUtils:CastingCriticalKick(unit, percent)
    local castingSpell = unit:GetCastingOrChannelingSpell()

    if castingSpell then
        local spellID = castingSpell:GetID()
        local isKick = unpack(self.kickList[spellID] or { false, false })

        if isKick and unit:IsInterruptibleAt(percent) then
            return true
        end
    end

    return false
end

---@param unit Unit
---@param percent number
---@return boolean
function MythicPlusUtils:CastingCriticalStun(unit, percent)
    local castingSpell = unit:GetCastingOrChannelingSpell()

    if castingSpell then
        local spellID = castingSpell:GetID()
        local _, isStun = unpack(self.kickList[spellID] or { false, false })
        if isStun and unit:IsInterruptibleAt(percent, true) then
            return true
        end
    end

    return false
end

return MythicPlusUtils
