-- Create a module class for a bastion module

---@class Module
local Module = {}
Module.__index = Module

-- __tostring
function Module:__tostring()
    return "Bastion.__Module(" .. self.name .. ")"
end

function Module:New(name)
    local module = {}
    setmetatable(module, Module)

    module.name = name
    module.enabled = false
    module.synced = {}

    return module
end

-- Enable the module
function Module:Enable()
    self.enabled = true
end

-- Disable the module
function Module:Disable()
    self.enabled = false
end

-- Toggle the module
function Module:Toggle()
    if self.enabled then
        self:Disable()
    else
        self:Enable()
    end
end

-- Add a function to the sync list
function Module:Sync(func)
    table.insert(self.synced, func)
end

-- Remove a function from the sync list
function Module:Unsync(func)
    for i = 1, #self.synced do
        if self.synced[i] == func then
            table.remove(self.synced, i)
            return
        end
    end
end

-- Sync
function Module:Tick()
    if self.enabled then
        for i = 1, #self.synced do
            self.synced[i]()
        end
    end
end

return Module
