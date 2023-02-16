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
        -- Ruby life pools
        [372735] = { -- Techtonic Slam
            [187969] = {
                false, true, true -- Kick, Stun, Disorient
            }
        },
        [384933] = { -- Ice Shield
            [188067] = {
                true, true, true
            }
        },
        [372749] = { -- Ice Shield
            [188067] = {
                true, true, true
            }
        },
        [372743] = { -- Ice Shield
            [188067] = {
                true, true, true
            }
        },
        [371984] = {
            [188067] = {
                true, true, true
            }
        },
        [373680] = {
            [188252] = {
                true, false, false
            }
        },
        [373688] = {
            [188252] = {
                true, false, false
            }
        },
        [385310] = {
            [195119] = {
                true, false, false
            }
        },
        [384194] = {
            [190207] = {
                true, true, true
            }
        },
        [384197] = {
            [190207] = {
                true, true, true
            }
        },
        [373017] = {
            [189886] = {
                true, false, false
            }
        },
        [392576] = {
            [198047] = {
                true, false, false
            }
        },
        [392451] = {
            [197985] = {
                true, true, false,
            }
        },
        [392452] = {
            [197985] = {
                true, true, false,
            }
        },
        -- Nokhud
        [383823] = {
            [192796] = {
                false, true, true
            }
        },
        [384492] = {
            [192794] = {
                false, true, true
            }
        },
        [384365] = {
            [192800] = {
                true, false, false
            },
            [191847] = {
                true, false, false
            }
        },
        [386012] = {
            [194317] = {
                true, false, false
            },
            [195265] = {
                true, false, false
            },
            [194315] = {
                true, false, false
            },
            [194316] = {
                true, false, false
            }

        },
        [386028] = {
            [195696] = {
                true, false, false
            }
        },
        [386024] = {
            [194894] = {
                true, true, true
            }
        },
        [386025] = {
            [194894] = {
                true, true, true
            }
        },
        [387629] = {
            [195876] = {
                false, true, true
            }
        },
        [387608] = {
            [195842] = {
                false, true, true
            }
        },
        [387611] = {
            [195842] = {
                false, true, true
            }
        },
        [387440] = {
            [195878] = {
                false, true, true
            }
        },
        [373395] = {
            [199717] = {
                true, false, false
            }
        },
        [376725] = {
            [190294] = {
                true, true, true
            },
        },
        [370764] = {
            [187160] = {
                false, true, true
            },
            [196116] = {
                false, true, true
            },
        },
        [387564] = {
            [196102] = {
                true, true, true
            }
        },
        [375596] = {
            [196115] = {
                true, false, false
            },
            [191164] = {
                true, false, false
            },

        },
        [386549] = {
            [186741] = {
                true, true, true
            }
        },
        [386546] = {
            [186741] = {
                true, true, true
            }
        },
        [389804] = {
            [187154] = {
                true, false, false
            }
        },
        [377488] = {
            [187155] = {
                true, true, true
            }
        },
        [377105] = {
            [190510] = {
                false, true, true
            }
        },
        [373932] = {
            [190187] = {
                true, false, false
            }
        },
        -- AA
        [387910] = {
            [196200] = {
                false, true, true
            }
        },
        [387975] = {
            [196202] = {
                true, true, true
            }
        },
        [388863] = {
            [196045] = {
                true, true, true
            }
        },
        [388392] = {
            [196044] = {
                true, true, true
            }
        },
        [396812] = {
            [196576] = {
                true, true, true
            }
        },
        [377389] = {
            [192333] = {
                true, false, false
            }
        },
        [397888] = {
            [200126] = {
                true, true, true
            }
        },
        [397801] = {
            [56448] = {
                true, false, false
            }
        },
        [395859] = {
            [59555] = {
                true, true, true
            }
        },
        [395872] = {
            [59546] = {
                true, false, false
            }
        },
        [396018] = {
            [59552] = {
                true, false, false
            }
        },
        [396073] = {
            [59544] = {
                true, true, false
            }
        },
        [397899] = {
            [200131] = {
                false, true, true
            }
        },
        [397914] = {
            [200137] = {
                true, true, true
            }
        },
        -- sbg
        [152818] = {
            [75713] = {
                true, true, false
            }
        },
        [398154] = {
            [75451] = {
                false, true, true
            }
        },
        [156776] = {
            [76446] = {
                true, true, true
            }
        },
        [156772] = {
            [77700] = {
                true, false, false
            }
        },
        [153524] = {
            [75459] = {
                true, true, true
            }
        },
        [156718] = {
            [76104] = {
                true, false, false
            }
        },
        [225100] = {
            [104270] = {
                true, false, false
            }
        },
        [210261] = {
            [104251] = {
                true, true, true
            }
        },
        [209027] = {
            [104246] = {
                false, true, true
            }
        },
        [212031] = {
            [105705] = {
                false, true, false
            }
        },
        [212784] = {
            [105715] = {
                false, true, false
            }
        },
        [198585] = {
            [95842] = {
                true, true, true
            }
        },
        [198959] = {
            [96664] = {
                true, true, true
            }
        },
        [215433] = {
            [95834] = {
                true, true, true
            }
        },
        [199210] = {
            [96640] = {
                false, true, true
            }
        },
        [199090] = {
            [96611] = {
                false, true, true
            }
        },
        [185425] = {
            [96677] = {
                false, true, false
            }
        },
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
        local kickEntry = self.kickList[spellID]
        if not kickEntry then
            return false
        end

        local npcTraits = kickEntry[unit:GetID()]

        if not npcTraits then
            return false
        end

        local isKick, isStun, isDisorient = unpack(npcTraits)

        if isKick and unit:IsInterruptibleAt(percent) then
            print("I want to kick", unit:GetName(), unit:GetID() .. "'s " .. spellID)
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
        local kickEntry = self.kickList[spellID]
        if not kickEntry then
            return false
        end

        local npcTraits = kickEntry[unit:GetID()]

        if not npcTraits then
            return false
        end

        local isKick, isStun, isDisorient = unpack(npcTraits)

        if (isStun or isDisorient) and not isKick and unit:IsInterruptibleAt(percent, true) then
            print("I want to stun", unit:GetName(), unit:GetID() .. "'s " .. spellID)
            return true
        end
    end

    return false
end

return MythicPlusUtils
