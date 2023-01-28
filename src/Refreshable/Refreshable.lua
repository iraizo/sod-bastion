local Tinkr, Bastion = ...

-- Define a Refreshable class
---@class Refreshable
local Refreshable = {
    cache = nil,
    callback = nil,
    value = nil
}

-- On index check the cache to be valid and return the value or reconstruct the value and return it
function Refreshable:__index(k)
    if Refreshable[k] then
        return Refreshable[k]
    end

    self.value = self.callback()
    return self.value[k]
end

-- When the object is accessed return the value
function Refreshable:__tostring()
    return "Bastion.__Refreshable(" .. tostring(self.value) .. ")"
end

-- Create
function Refreshable:New(value, cb)
    local self = setmetatable({}, Refreshable)

    self.cache = Bastion.Cache:New()
    self.value = value
    self.callback = cb

    self.cache:Set('self', self.value, 0.5)

    return self
end

-- Try to update the value
function Refreshable:TryUpdate()
    if self.cache:IsCached("value") then
        self.value = self.callback()
    end
end

-- Update the value
function Refreshable:Update()
    self.value = self.callback()
end

-- Set a new value
function Refreshable:Set(value)
    self.value = value
end

-- Set a new callback
function Refreshable:SetCallback(cb)
    self.callback = cb
end

return Refreshable
