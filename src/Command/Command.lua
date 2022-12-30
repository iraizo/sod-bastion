-- Create a wow command handler class

local Command = {}
Command.__index = Command

function Command:__tostring()
    return "Command(" .. self.command .. ")"
end

function Command:New(prefix)
    local self = setmetatable({}, Command)

    self.prefix = prefix
    self.commands = {}

    _G['SLASH_' .. prefix:upper() .. '1'] = "/" .. prefix
    SlashCmdList[prefix:upper()] = function(msg, editbox)
        self:OnCommand(msg)
    end

    return self
end

function Command:Register(command, helpmsg, cb)
    self.commands[command] = {
        helpmsg = helpmsg,
        cb = cb
    }
end

function Command:Parse(msg)
    local args = {}
    for arg in msg:gmatch("%S+") do
        table.insert(args, arg)
    end

    return args
end

function Command:OnCommand(msg)
    local args = self:Parse(msg)

    if #args == 0 then
        self:PrintHelp()
        return
    end

    local runner = self.commands[args[1]]
    if runner then
        runner.cb(args)
    end
end

function Command:PrintHelp()
    for k, v in pairs(self.commands) do
        print('/' .. self.prefix .. ' ' .. k .. " - " .. v.helpmsg)
    end
end

return Command
