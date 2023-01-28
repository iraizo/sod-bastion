local Tinkr, Bastion = ...

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
        [396812] = true,
        [388392] = true,
        [388863] = true,
        [388862] = true,
        [377389] = true,
        [388623] = true,
        [396640] = true,
        [387975] = true,
        [387843] = true,

        -- Court of Stars
        [211401] = true,
        [207980] = true,
        [208165] = true,
        [207881] = true,
        [209413] = true,

        -- Halls of Valor
        [198595] = true,
        [198959] = true,
        [215433] = true,
        [192288] = true,
        [199726] = true,
        [198750] = true,

        -- Ruby Life Pools
        [372749] = true,
        [373803] = true,
        [373017] = true,
        [392398] = true,
        [392451] = true,
        [385310] = true,

        -- Shadowmoon Burial Grounds
        [152818] = true,
        [156776] = true,
        [156722] = true,
        [398206] = true,
        [153524] = true,
        [156718] = true,

        -- Temple of the Jade Serpent
        [397888] = true,
        [395859] = true,
        [396073] = true,
        [397914] = true,

        -- The Azure Vault
        [375602] = true,
        [387564] = true,
        [373932] = true,
        [386546] = true,
        [389804] = true,
        [377488] = true,
        [377503] = true,

        -- NO
        [384365] = true,
        [386012] = true,
        [386024] = true,
        [387411] = true,
        [387606] = true,
        [373395] = true,
        [376725] = true,
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
