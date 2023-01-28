---@class Cache
local Cache = {}
Cache.__index = Cache

-- Constructor
function Cache:New()
    local self = setmetatable({}, Cache)
    self.cache = {}
    return self
end

function Cache:Set(key, value, duration)
    self.cache = self.cache or {}
    self.cache[key] = {
        value = value,
        duration = duration,
        time = GetTime()
    }
end

function Cache:Get(key)
    self.cache = self.cache or {}
    local cache = self.cache[key]
    if cache and cache.time + cache.duration > GetTime() then
        return cache.value
    end

    -- It's old or doesn't exist, so remove it
    self.cache[key] = nil

    return nil
end

function Cache:IsCached(key)
    self.cache = self.cache or {}
    local cache = self.cache[key]
    if cache and cache.time + cache.duration > GetTime() then
        return true
    end

    -- It's old or doesn't exist, so remove it
    self.cache[key] = nil

    return false
end

return Cache
