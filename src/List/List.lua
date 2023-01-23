local Tinkr, Bastion = ...

local List = {}
List.__index = List

function List:New(from)
    local self = setmetatable({}, List)
    self._list = from or {}
    return self
end

function List:push(value)
    table.insert(self._list, value)
end

function List:pop()
    return table.remove(self._list)
end

function List:peek()
    return self._list[#self._list]
end

function List:count()
    return #self._list
end

function List:clear()
    self._list = {}
end

function List:contains(value)
    for _, v in ipairs(self._list) do
        if v == value then
            return true
        end
    end
    return false
end

function List:remove(value)
    for i, v in ipairs(self._list) do
        if v == value then
            table.remove(self._list, i)
            return true
        end
    end
    return false
end

function List:each(callback)
    for _, v in ipairs(self._list) do
        if callback(v) then
            break
        end
    end
end

function List:map(callback)
    local newList = List.new()
    for _, v in ipairs(self._list) do
        newList:push(callback(v))
    end
    return newList
end

function List:filter(callback)
    local newList = List.new()
    for _, v in ipairs(self._list) do
        if callback(v) then
            newList:push(v)
        end
    end
    return newList
end

function List:reduce(callback, initialValue)
    local result = initialValue
    for _, v in ipairs(self._list) do
        result = callback(result, v)
    end
    return result
end

function List:find(callback)
    for _, v in ipairs(self._list) do
        if callback(v) then
            return v
        end
    end
    return nil
end

function List:findIndex(callback)
    for i, v in ipairs(self._list) do
        if callback(v) then
            return i
        end
    end
    return nil
end

function List:sort(callback)
    table.sort(self._list, callback)
end

function List:reverse()
    local newList = List.new()
    for i = #self._list, 1, -1 do
        newList:push(self._list[i])
    end
    return newList
end

function List:clone()
    local newList = List.new()
    for _, v in ipairs(self._list) do
        newList:push(v)
    end
    return newList
end

function List:concat(list)
    local newList = List.new()
    for _, v in ipairs(self._list) do
        newList:push(v)
    end
    for _, v in ipairs(list._list) do
        newList:push(v)
    end
    return newList
end

function List:join(separator)
    local result = ""
    for i, v in ipairs(self._list) do
        result = result .. v
        if i < #self._list then
            result = result .. separator
        end
    end
    return result
end

function List:toString()
    return self:join(", ")
end

function List:__tostring()
    return self:toString()
end

return List
