local Tinkr, Bastion = ...

---@class ObjectManager
local ObjectManager = {}
ObjectManager.__index = ObjectManager

function ObjectManager:New()
    local self = setmetatable({}, ObjectManager)

    self._objects = {}

    self.enemies = Bastion.List:New()
    self.friends = Bastion.List:New()
    self.activeEnemies = Bastion.List:New()
    self.explosives = Bastion.List:New()

    return self
end

function ObjectManager:Refresh()
    self.enemies:clear()
    self.friends:clear()
    self.activeEnemies:clear()
    self.explosives:clear()

    local objects = Objects()

    for _, object in pairs(objects) do
        if ObjectType(object) == 5 or ObjectType(object) == 6 then
            local unit = Bastion.UnitManager:GetObject(ObjectGUID(object))
            if not unit then
                unit = Bastion.Unit:New(object)
                Bastion.UnitManager:SetObject(unit)
            end

            if unit:GetID() == 120651 then
                self.explosives:push(unit)
            elseif unit:IsPlayer() and unit:IsInParty() then
                self.friends:push(unit)
            elseif unit:IsEnemy() then
                self.enemies:push(unit)

                if unit:IsAffectingCombat() then
                    self.activeEnemies:push(unit)
                end
            end
        end
    end
end

return ObjectManager
