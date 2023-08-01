local Tinkr, Bastion = ...

local ExampleModule = Bastion.Module:New('ExampleModule')
local Player = Bastion.UnitManager:Get('player')

local AdvancedMath = {}

AdvancedMath.__index = AdvancedMath

function AdvancedMath:Add(a, b)
    return a + b
end

Bastion:RegisterLibrary('AdvancedMath', AdvancedMath)
