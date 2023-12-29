local Tinkr, Bastion = ...
local Evaluator = Tinkr.Util.Evaluator
local Hunter = Bastion.Module:New('Hunter')
local Player = Bastion.UnitManager:Get('player')
local Target = Bastion.UnitManager:Get('target')
local Pet = Bastion.UnitManager:Get('pet')
local SpellBook = Bastion.SpellBook:New()

local CallPet = SpellBook:GetSpell(883)
local RevivePet = SpellBook:GetSpell(982)
local MendPet = SpellBook:GetSpell(3111)
local AspectOfTheHawk = SpellBook:GetSpell(14318)
local AspectOfTheCheetah = SpellBook:GetSpell(5118)
local HuntersMark = SpellBook:GetSpell(14323)
local MultiShot = SpellBook:GetSpell(2643)
local AutoShot = SpellBook:GetSpell(75)
local WingClip = SpellBook:GetSpell(2974)
local SerpentSting = SpellBook:GetSpell(13550)
local isEatingAura = SpellBook:GetSpell(1539)

local function FeedPet()
    Evaluator:LoadString('TargetUnit("pet")', { '' }, '')
    CastSpellByName("Feed Pet")
    Evaluator:LoadString('UseItemByName("Bristle Whisker Catfish")', { '' }, '')
end

-- Generates a circle around the given point, used for auto shot range
local function generateCircle(centerX, centerY, centerZ, radius, numPoints)
    local circlePoints = {}

    for i = 1, numPoints do
        local theta = (i - 1) * (2 * math.pi) / numPoints
        local x = centerX + radius * math.cos(theta)
        local y = centerY + radius * math.sin(theta)
        local z = centerZ

        table.insert(circlePoints, { x = x, y = y, z = z })
    end

    return circlePoints
end

-- Gets the closest point from a list of points
local function getClosestPoint(points, point)
    local closestPoint = nil
    local closestDistance = nil

    for i, p in ipairs(points) do
        local distance = math.sqrt((p.x - point.x) ^ 2 + (p.y - point.y) ^ 2 + (p.z - point.z) ^ 2)

        if closestDistance == nil or distance < closestDistance then
            closestPoint = p
            closestDistance = distance
        end
    end

    return closestPoint
end

local function calculate_angles(pos1, pos2)
    -- Calculate direction vector from Object 1 to Object 2
    local dir_vector = pos2 - pos1
    -- Calculate heading angle in radians
    local heading = atan2(dir_vector.y, dir_vector.x)

    -- Calculate pitch angle in radians
    local pitch = atan2(dir_vector.z, math.sqrt(dir_vector.x ^ 2 + dir_vector.y ^ 2))

    return heading, pitch
end

-- Spherical Linear Interpolation, used for facing target in multiple steps
local function slerp(start_angle, end_angle, t)
    -- Spherical Linear Interpolation
    local cos_interp = math.cos((1 - t) * start_angle + t * end_angle)
    local sin_interp = math.sin((1 - t) * start_angle + t * end_angle)
    return atan2(sin_interp, cos_interp)
end

local function radians_to_degrees(rad)
    return rad * (180 / math.pi)
end

local has_started_moving = nil
local function hasArrived(point)
    local pos = Player:GetPosition()
    local distance = FastDistance(pos.x, pos.y, pos.z, point.x, point.y, point.z)
    if distance < 3 then
        -- we are at the point, face target
        print('At point, facing target')
        local target_heading, target_pitch = calculate_angles(pos, Target:GetPosition())
        local steps = 30
        for step = 1, steps do
            C_Timer.After(0.5, function()
                local t = step / steps
                local current_heading = slerp(0, target_heading, t)

                FaceDirection(current_heading, true)
            end)
        end
        return
    else
        if has_started_moving ~= nil and GetTime() - has_started_moving > 5 then
            print('Timeout for pathing to point, stopping')
            has_started_moving = nil
            return
        end

        if has_started_moving == nil then
            return
        end

        print('Not at point yet, pathing to point')
        C_Timer.After(1, function()
            hasArrived(point)
        end)
    end
end

Hunter:Sync(function()
    if Pet ~= nil then
        if Pet:IsDead() then
            RevivePet:Cast(Player)
        end
    else
        CallPet:Cast(Player)
    end

    ---@diagnostic disable-next-line: undefined-global
    local happiness, _, _ = GetPetHappiness()
    if happiness ~= 3 and not UnitAffectingCombat('player') then
        if Pet:GetAuras():FindAny(isEatingAura):IsUp() == false then
            print("Pet is not happy, attempting to feed")
            FeedPet()
        end
    end

    if Pet:GetAuras():FindAny(isEatingAura):IsUp() == true and not UnitAffectingCombat('player') then
        return
    end

    if Target == nil or Target:IsDead() or Target:Exists() == false or Target:IsFriendly() and not UnitAffectingCombat('player') then
        if Player:GetAuras():FindAny(AspectOfTheCheetah):IsUp() == false then
            AspectOfTheCheetah:Cast(Player)
        end
        return
    end

    if Pet:GetHealthPercent() < 30 then
        if Pet:GetAuras():FindAny(MendPet):IsUp() == false or not Player:IsChanneling() then
            MendPet:Cast(Pet)
        end
    end

    PetAttack()

    if Player:GetDistance(Target) < 100 then
        if Target:GetAuras():FindAny(HuntersMark):IsUp() == false then
            HuntersMark:Cast(Target)
        end
    end

    local mana = Player:GetPower(0)
    local max_mana = Player:GetMaxPower(0)
    local mana_percent = mana / max_mana

    if Player:GetDistance(Target) < 40 then
        if Player:GetAuras():FindAny(AspectOfTheHawk):IsUp() == false and max_mana > 50 and UnitAffectingCombat('player') then
            AspectOfTheHawk:Cast(Player)
        end
    end


    if Player:GetDistance(Target) < 35 and Player:GetDistance(Target) > 8 then
        if BANETO_IsAutoShooting() == nil then
            AutoShot:Cast(Target)
        end

        if Target:GetAuras():FindMy(SerpentSting):IsUp() == false then
            SerpentSting:Cast(Target)
        end
    end

    local pet_is_tanking, state, scaled_percent, raw_percent, threat_value = UnitDetailedThreatSituation('pet', 'target')
    -- logic for when target is too close
    if Player:GetDistance(Target) < 9 then
        print('Target too close, pathing to clear spot..')
        if Player:InMelee(Target) then
            if Target:GetAuras():FindMy(WingClip):IsUp() == false then
                WingClip:Cast(Target)
            end
        end

        -- Target is too close, pathfind to a point that is 8 yards away
        if pet_is_tanking == nil then
            print('Pet is not tanking, waiting for pet to get aggro')
            return
        end

        local pos = Target:GetPosition()
        local player_pos = Player:GetPosition()
        local mapId = GetMapID()

        -- We generate a circle around the target, and find the closest point to the player,
        -- resulting in a position that isnt in the deadzone

        local points = generateCircle(pos.x, pos.y, pos.z, 20, 20)
        local closestPoint = getClosestPoint(points, Player:GetPosition())

        if closestPoint == nil then
            return
        end

        -- since the closestPoint can be in the air due to the world geometry
        -- we will path find our way to the point cloest to the.. closest point
        local path, type = GeneratePath(player_pos.x, player_pos.y, player_pos.z, closestPoint.x, closestPoint.y,
            closestPoint.z, mapId)
        local last_point = nil

        -- jesus christ, this is so ugly i dont know lua enough xd
        for _, point in ipairs(path) do
            last_point = point
        end
        if type == 0x01 then
            has_started_moving = GetTime()
            MoveTo(last_point.x, last_point.y, last_point.z)
            -- recursively check if were at the point, if we do it also
            -- faces the target
            hasArrived(closestPoint)
        end
    end

    if Player:GetEnemies(30) > 1 then
        MultiShot:Cast(Target)
    end
end)

Bastion:Register(Hunter)
