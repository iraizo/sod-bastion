local Tinkr, Bastion = ...

-- Create a new Timer class
---@class Timer
local Timer = {
    startTime = nil,
    resetAfterCombat = false,
}
Timer.__index = Timer

-- Constructor
function Timer:New(type)
    local self = setmetatable({}, Timer)
    self.startTime = nil
    self.type = type
    return self
end

-- Start the timer
function Timer:Start()
    self.startTime = GetTime()
end

-- Get the time since the timer was started
function Timer:GetTime()
    if not self:IsRunning() then
        return 0
    end
    return GetTime() - self.startTime
end

-- Check if the timer is running
function Timer:IsRunning()
    return self.startTime ~= nil
end

-- Reset the timer
function Timer:Reset()
    self.startTime = nil
end

return Timer
