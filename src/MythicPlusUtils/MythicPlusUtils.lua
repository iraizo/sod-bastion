local Tinkr, Bastion = ...

local MythicPlusUtils = {
    debuffLogging = false,
    random = ''
}

MythicPlusUtils.__index = MythicPlusUtils

function MythicPlusUtils:New()
    local self = setmetatable({}, MythicPlusUtils)

    self.random = math.random(1000000, 9999999)

    Bastion.EventManager:RegisterWoWEvent('UNIT_AURA', function(unit, auras)
        local u = Bastion.UnitManager[unit]

        if not self.unit:IsUnit(unit) then
            return
        end

        local addedAuras = auras.addedAuras

        if #addedAuras > 0 then
            for i = 1, #addedAuras do
                local aura = Bastion.Aura:CreateFromUnitAuraInfo(addedAuras[i])
                if not aura:IsBuff() then
                    WriteFile('bastion-MPlusDebuffs-' .. self.random .. '.lua', [[
                        AuraName: ]] .. aura:GetName() .. [[
                        AuraID: ]] .. aura:GetID() .. [[
                    ]], true)
                end
            end
        end
    end)

    return self
end

function MythicPlusUtils:ToggleDebuffLogging()
    self.debuffLogging = not self.debuffLogging
end

function MythicPlusUtils:HasCriticalDispel(unit)

end
