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
        [396812] = true, -- https://www.wowhead.com/spell=396812/mystic-blast
        [388392] = true, -- https://www.wowhead.com/spell=388392/monotonous-lecture
        [388863] = true, -- https://www.wowhead.com/spell=388863/mana-void
        [388862] = true, -- https://www.wowhead.com/spell=388862/surge
        [377389] = true, -- https://www.wowhead.com/spell=377389/call-of-the-flock
        [388623] = true, -- https://www.wowhead.com/spell=388623/branch-out
        [396640] = true, -- https://www.wowhead.com/spell=396640/healing-touch
        [387975] = true, -- https://www.wowhead.com/spell=387975/arcane-missiles
        [387843] = true, -- https://www.wowhead.com/spell=387843/astral-bomb

        -- Court of Stars
        [211401] = true, -- https://wowhead.com/spell=211401
        [207980] = true, -- https://wowhead.com/spell=207980
        [208165] = true, -- https://wowhead.com/spell=208165
        [207881] = true, -- https://wowhead.com/spell=207881
        [209413] = true, -- https://wowhead.com/spell=209413

        -- Halls of Valor
        [198595] = true, -- https://wowhead.com/spell=198595
        [198959] = true, -- https://wowhead.com/spell=198959
        [215433] = true, -- https://wowhead.com/spell=215433
        [192288] = true, -- https://wowhead.com/spell=192288
        [199726] = true, -- https://wowhead.com/spell=199726
        [198750] = true, -- https://wowhead.com/spell=198750

        -- Ruby Life Pools
        [372749] = true, -- https://wowhead.com/spell=372749
        [373803] = true, -- https://wowhead.com/spell=373803
        [373017] = true, -- https://wowhead.com/spell=373017
        [392398] = true, -- https://wowhead.com/spell=392398
        [392451] = true, -- https://wowhead.com/spell=392451
        [385310] = true, -- https://wowhead.com/spell=385310

        -- Shadowmoon Burial Grounds
        [152818] = true, -- https://wowhead.com/spell=152818
        [156776] = true, -- https://wowhead.com/spell=156776
        [156722] = true, -- https://wowhead.com/spell=156722
        [398206] = true, -- https://wowhead.com/spell=398206
        [153524] = true, -- https://wowhead.com/spell=153524
        [156718] = true, -- https://wowhead.com/spell=156718

        -- Temple of the Jade Serpent
        [397888] = true, -- https://wowhead.com/spell=397888
        [395859] = true, -- https://wowhead.com/spell=395859
        [396073] = true, -- https://wowhead.com/spell=396073
        [397914] = true, -- https://wowhead.com/spell=397914

        -- The Azure Vault
        [375602] = true, -- https://wowhead.com/spell=375602
        [387564] = true, -- https://wowhead.com/spell=387564
        [373932] = true, -- https://wowhead.com/spell=373932
        [386546] = true, -- https://wowhead.com/spell=386546
        [389804] = true, -- https://wowhead.com/spell=389804
        [377488] = true, -- https://wowhead.com/spell=377488
        [377503] = true, -- https://wowhead.com/spell=377503

        -- NO
        [384365] = true, -- https://wowhead.com/spell=384365
        [386012] = true, -- https://wowhead.com/spell=386012
        [386024] = true, -- https://wowhead.com/spell=386024
        [387411] = true, -- https://wowhead.com/spell=387411
        [387606] = true, -- https://wowhead.com/spell=387606
        [373395] = true, -- https://wowhead.com/spell=373395
        [376725] = true, -- https://wowhead.com/spell=376725
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
