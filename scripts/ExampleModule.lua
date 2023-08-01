local Tinkr, Bastion = ...
local ExampleModule = Bastion.Module:New('ExampleModule')
local Player = Bastion.UnitManager:Get('player')

-- Create a local spellbook
local SpellBook = Bastion.SpellBook:New()

local FlashHeal = SpellBook:GetSpell(2061)

local AdvancedMath = Bastion:Import('AdvancedMath')

print(AdvancedMath:Add(1, 2))

ExampleModule:Sync(function()
    if Player:GetHP() <= 50 then
        FlashHeal:Cast(Player)
    end
end)

Bastion:Register(ExampleModule)
