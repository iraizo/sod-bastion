-- Create a NotificationsList class

---@class NotificationsList
local NotificationsList = {
    notifications = {}
}
NotificationsList.__index = NotificationsList

-- Constructor
function NotificationsList:New()
    local self = setmetatable({}, NotificationsList)

    -- Create a frame for the notifications
    self.frame = CreateFrame("Frame", "BastionNotificationsList", UIParent)
    self.frame:SetSize(300, 100)
    self.frame:SetPoint("TOP", UIParent, "TOP", 0, -100)
    self.frame:SetFrameStrata("HIGH")

    -- Remove notifications after 5 seconds
    C_Timer.NewTicker(0.1, function()
        for i, notification in ipairs(self.notifications) do
            if GetTime() - notification.addedAt > 2 then
                notification:Remove()
                table.remove(self.notifications, i)
            end
        end
    end)

    return self
end

-- Create a notification class for the notifications list (takes icon and text)
---@class Notification
local Notification = {
}
Notification.__index = Notification

-- Constructor
function Notification:New(list, icon, text)
    local self = setmetatable({}, Notification)

    -- Create a frame for the notification
    self.frame = CreateFrame("Frame", nil, list.frame)
    self.frame:SetSize(300, 100)
    self.frame:SetPoint("TOP", list.frame, "TOP", 0, 0)
    self.frame:SetFrameStrata("HIGH")

    -- Create a texture for the icon
    self.icon = self.frame:CreateTexture(nil, "ARTWORK")
    self.icon:SetSize(32, 32)
    self.icon:SetPoint("LEFT", self.frame, "LEFT", 0, 0)
    self.icon:SetTexture(icon)

    -- Create a fontstring for the text
    self.text = self.frame:CreateFontString(nil, "BACKGROUND", "GameFontNormal")
    self.text:SetPoint("CENTER", self.frame, "CENTER", 10, 0)
    self.text:SetText(text)
    self.text:SetFont("Fonts\\FRIZQT__.TTF", 14)

    self.addedAt = GetTime()
    self.list = list

    return self
end

-- Remove notification
function Notification:Remove()
    -- Fade out the notification frame and remove it after the fade
    UIFrameFadeOut(self.frame, 0.2, 1, 0)
    C_Timer.After(0.5, function()
        self.frame:Hide()
        self.frame:ClearAllPoints()
        self.frame:SetParent(nil)
        self.frame = nil
        self.list:Update()
    end)
end

-- Add a notification to the list
function NotificationsList:AddNotification(icon, text)
    -- Create a new notification
    local notification = Notification:New(self, icon, text)

    -- Add the notification to the list
    table.insert(self.notifications, notification)
    UIFrameFadeIn(notification.frame, 0.2, 0, 1)

    -- Update the notifications
    self:Update()
end

-- Update the notifications
function NotificationsList:Update()
    -- Loop through the notifications
    for i, notification in ipairs(self.notifications) do
        -- Set the position of the notification
        notification.frame:SetPoint("TOP", self.frame, "TOP", 0, -50 * (i - 1))
    end
end

-- Remove a notification from the list
function NotificationsList:RemoveNotification(notification)
    -- Loop through the notifications
    for i, v in ipairs(self.notifications) do
        -- Check if the notification is the one we want to remove
        if v == notification then
            -- Remove the notification from the list
            table.remove(self.notifications, i)
            notification:Remove()
            break
        end
    end
end

-- Remove all notifications from the list
function NotificationsList:RemoveAllNotifications()
    -- Loop through the notifications
    for i, v in ipairs(self.notifications) do
        -- Remove the notification from the list
        table.remove(self.notifications, i)
        self.notifications[i]:Remove()
    end
end

-- Remove all notifications
return NotificationsList, Notification
