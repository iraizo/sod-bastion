local Tinkr, Bastion = ...

-- Create a new SpellBook class
local SpellBook = {}
SpellBook.__index = SpellBook

-- Constructor
function SpellBook:New()
    local self = setmetatable({}, SpellBook)
    self.spells = {}
    return self
end

-- Get a spell from the spellbook
function SpellBook:GetSpell(id)
    if self.spells[id] == nil then
        self.spells[id] = Bastion.Spell:New(id)
    end

    return self.spells[id]
end

return SpellBook
