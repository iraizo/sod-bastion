-- Create an APL trait for the APL class
local APLTrait = {}
APLTrait.__index = APLTrait

-- Constructor
function APLTrait:New(cb)
    local self = setmetatable({}, APLTrait)

    self.cb = cb
    self.lastcall = 0

    return self
end

-- Evaulate the APL trait
function APLTrait:Evaluate()
    if GetTime() - self.lastcall > 0.1 then
        self.lastresult = self.cb()
        self.lastcall = GetTime()
        return self.lastresult
    end

    return self.lastresult
end

-- tostring
function APLTrait:__tostring()
    return "Bastion.__APLTrait"
end

-- Create an APL actor for the APL class
local APLActor = {}
APLActor.__index = APLActor

-- Constructor
function APLActor:New(actor)
    local self = setmetatable({}, APLActor)

    self.actor = actor
    self.traits = {}

    return self
end

-- Add a trait to the APL actor
function APLActor:AddTraits(...)
    for _, trait in ipairs({ ... }) do
        table.insert(self.traits, trait)
    end

    return self
end

-- Get the actor
function APLActor:GetActor()
    return self.actor
end

-- Evaulate the APL actor
function APLActor:Evaluate()
    for _, trait in ipairs(self.traits) do
        if not trait:Evaluate() then
            return false
        end
    end

    return true
end

-- Execute
function APLActor:Execute()
    if self:GetActor().apl then
        if self:GetActor().condition() then
            -- print("Bastion: APL:Execute: Executing sub APL " .. self:GetActor().apl.name)
            self:GetActor().apl:Execute()
        end
    end
    if self:GetActor().spell then
        if self:GetActor().condition then
            -- print("Bastion: APL:Execute: Condition for spell " .. self:GetActor().spell:GetName())
            self:GetActor().spell:CastableIf(self:GetActor().castableFunc):Cast(self:GetActor().target,
                self:GetActor().condition)
        end

        -- print("Bastion: APL:Execute: No condition for spell " .. self:GetActor().spell:GetName())
        self:GetActor().spell:CastableIf(self:GetActor().castableFunc):Cast(self:GetActor().target)
    end
    if self:GetActor().item then
        if self:GetActor().condition then
            -- print("Bastion: APL:Execute: Condition for spell " .. self:GetActor().spell:GetName())
            self:GetActor().item:UsableIf(self:GetActor().usableFunc):Use(self:GetActor().target,
                self:GetActor().condition)
        end

        -- print("Bastion: APL:Execute: No condition for spell " .. self:GetActor().spell:GetName())
        self:GetActor().item:UsableIf(self:GetActor().usableFunc):Use(self:GetActor().target)
    end
    if self:GetActor().action then
        -- print("Bastion: APL:Execute: Executing action " .. self:GetActor().action)
        self:GetActor().cb(self)
    end
end

-- has traits
function APLActor:HasTraits()
    return #self.traits > 0
end

-- tostring
function APLActor:__tostring()
    return "Bastion.__APLActor"
end

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
    local actor = APLActor:New({ action = action, cb = cb })
    table.insert(self.apl, actor)
    return actor
end

-- Add a spell to the APL
function APL:AddSpell(spell, condition)
    local castableFunc = spell.CastableIfFunc
    local target = spell:GetTarget()

    local actor = APLActor:New({ spell = spell, condition = condition, castableFunc = castableFunc, target = target })

    table.insert(self.apl, actor)

    return actor
end

-- Add an item to the APL
function APL:AddItem(item, condition)
    local usableFunc = item.UsableIfFunc
    local target = item:GetTarget()

    local actor = APLActor:New({ item = item, condition = condition, usableFunc = usableFunc, target = target })

    table.insert(self.apl, actor)

    return actor
end

-- Add an APL to the APL (for sub APLs)
function APL:AddAPL(apl, condition)
    local actor = APLActor:New({ apl = apl, condition = condition })
    table.insert(self.apl, actor)
    return actor
end

-- Execute the APL
function APL:Execute()
    for _, actor in ipairs(self.apl) do
        if actor:HasTraits() and actor:Evaluate() then
            actor:Execute()
        else
            actor:Execute()
        end
    end
end

-- tostring
function APL:__tostring()
    return "Bastion.__APL(" .. self.name .. ")"
end

return APL, APLActor, APLTrait
