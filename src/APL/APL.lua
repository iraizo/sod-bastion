-- APL (Attack priority list) class

local APL = {}
APL.__index = APL

-- Constructor
function APL:New(name)
    local self = setmetatable({}, APL)

    self.apl = {}
    self.variables = {}
    self.name = name

    return self
end

-- Add a variable to the APL
function APL:SetVariable(name, value)
    self.variables[name] = value
end

-- Get and evaluate a variable
function APL:GetVariable(name)
    return self.variables[name]
end

-- Add a manual action to the APL
function APL:AddAction(action, cb)
    table.insert(self.apl, { action = action, cb = cb })
end

-- Add a spell to the APL
function APL:AddSpell(spell, condition)
    local castableFunc = spell.CastableIfFunc
    local target = spell:GetTarget()

    table.insert(self.apl, { spell = spell, condition = condition, castableFunc = castableFunc, target = target })
end

-- Add an item to the APL
function APL:AddItem(item, condition)
    local usableFunc = item.UsableIfFunc
    local target = item:GetTarget()

    table.insert(self.apl, { item = item, condition = condition, usableFunc = usableFunc, target = target })
end

-- Add an APL to the APL (for sub APLs)
function APL:AddAPL(apl, condition)
    table.insert(self.apl, { apl = apl, condition = condition })
end

-- Execute the APL
function APL:Execute()
    for _, actor in ipairs(self.apl) do
        if actor.apl then
            if actor.condition() then
                -- print("Bastion: APL:Execute: Executing sub APL " .. actor.apl.name)
                actor.apl:Execute()
            end
        end
        if actor.spell then
            if actor.condition then
                -- print("Bastion: APL:Execute: Condition for spell " .. actor.spell:GetName())
                actor.spell:CastableIf(actor.castableFunc):Cast(actor.target,
                    actor.condition)
            end

            -- print("Bastion: APL:Execute: No condition for spell " .. actor.spell:GetName())
            actor.spell:CastableIf(actor.castableFunc):Cast(actor.target)
        end
        if actor.item then
            if actor.condition then
                -- print("Bastion: APL:Execute: Condition for spell " .. actor.spell:GetName())
                actor.item:UsableIf(actor.usableFunc):Cast(actor.target,
                    actor.condition)
            end

            -- print("Bastion: APL:Execute: No condition for spell " .. actor.spell:GetName())
            actor.item:UsableIf(actor.usableFunc):Cast(actor.target)
        end
        if actor.action then
            -- print("Bastion: APL:Execute: Executing action " .. actor.action)
            actor.cb(self)
        end
    end
end

-- tostring
function APL:__tostring()
    return "Bastion.__APL(" .. self.name .. ")"
end

return APL
