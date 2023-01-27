local Tinkr, Bastion = ...

-- Create a new Class class
---@class Class
local Class = {}

function Class:__index(k)
    local response = Bastion.ClassMagic:Resolve(Class, k)

    if response == nil then
        response = rawget(self, k)
    end

    if response == nil then
        error("Class:__index: " .. k .. " does not exist")
    end

    return response
end

-- Constructor
function Class:New(locale, name, id)
    local self = setmetatable({}, Class)
    self.class = {
        locale = locale,
        name = name,
        id = id
    }
    return self
end

-- Get the classes locale
function Class:GetLocale()
    return self.class.locale
end

-- Get the classes name
function Class:GetName()
    return self.class.name
end

-- Get the classes id
function Class:GetID()
    return self.class.id
end

-- Return the classes color
function Class:GetColor()
    return C_ClassColor.GetClassColor(self.class.name)
end

return Class
