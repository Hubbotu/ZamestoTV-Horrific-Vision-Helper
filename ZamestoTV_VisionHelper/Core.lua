---------------- Constants ----------------

MAX_PICKING_DISTANCE = 0.8

-- Localization tables
local L = {
    enUS = {
        TITLE = "Vision Tracker",
        SW_LOCATIONS = { 'Cathedral Square', 'Dwarven District', 'Old Town', 'Trade District', 'Mage Quarter' },
        OG_LOCATIONS = { 'Valley of Strength', 'Valley of Spirits', 'Valley of Wisdom', 'The Drag', 'Valley of Honor' },
        HELP_TEXT =
        "/zstorm - Stormwind (resets counting)\n/zorgri - Orgrimmar (resets counting)\n/zmov - Toggle moving the frame\n/zhide - Hide stats"
    },
    ruRU = {
        TITLE = "Трекер видений",
        SW_LOCATIONS = { 'Соборная площадь', 'Квартал Дворфов', 'Старый город', 'Торговый квартал', 'Квартал магов' },
        OG_LOCATIONS = { 'Крепость Громмаш', 'Аллея Духов', 'Аллея Мудрости', 'Волок', 'Аллея Чести' },
        HELP_TEXT =
        "/zstorm - Штормград (сбрасывает подсчет)\n/zorgri - Оргриммар (сбрасывает подсчет)\n/zmov - Переключить перемещение окна\n/zhide - Скрыть статистику"
    },
    ptBR = {
        TITLE = "Rastreador de Visão",
        SW_LOCATIONS = { 'Praça da Catedral', 'Distrito dos Anões', 'Cidade Velha', 'Distrito Comercial', 'Distrito dos Magos' },
        OG_LOCATIONS = { 'Vale da Força', 'Vale dos Espíritos', 'Vale da Sabedoria', 'O Bazar', 'Vale da Honra' },
        HELP_TEXT =
        "/zstorm - Ventobravo (reinicia a contagem)\n/zorgri - Orgrimmar (reinicia a contagem)\n/zmov - Alternar movimento do quadro\n/zhide - Ocultar estatísticas"
    }
}

-- Set the default language based on game client locale
local lang = GetLocale()              -- Automatically sets to enUS, ruRU, etc.
if not L[lang] then lang = "enUS" end -- Fallback to enUS if locale unsupported

STORMWIND_LOCATIONS = { 'CATHEDRAL', 'DWARVEN', 'OLD TOWN', 'TRADE', 'MAGE' }
STORMWIND_POS = {
    { 1, { 54.6, 59.4 } },
    { 1, { 53.0, 51.9 } },
    { 1, { 58.4, 55.1 } },
    { 2, { 64.6, 30.9 } },
    { 2, { 62.7, 37.0 } },
    { 2, { 63.4, 41.7 } },
    { 2, { 67.3, 44.7 } },
    { 3, { 75.6, 53.4 } },
    { 3, { 75.6, 64.6 } },
    { 3, { 74.6, 59.2 } },
    { 3, { 76.5, 68.5 } },
    { 4, { 69.0, 73.1 } },
    { 4, { 62.0, 76.9 } },
    { 4, { 66.1, 75.7 } },
    { 4, { 60.4, 68.8 } },
    { 5, { 47.4, 81.6 } },
    { 5, { 44.2, 87.9 } },
    { 5, { 47.7, 89.4 } },
    { 5, { 52.4, 83.4 } }
}

STORMWIND_BOUNDRIES = {
    { { 42.4, 50.1 }, { 48, 63 },     { 50.7, 62.6 }, { 53.2, 61.2 }, { 55.0, 62.7 }, { 61.1, 55.1 }, { 59.6, 50.9 }, { 53.0, 38.1 } },
    { { 57.5, 35.1 }, { 65.5, 50.7 }, { 72.4, 43.2 }, { 64.0, 25.0 } },
    { { 74.6, 49.7 }, { 67.1, 58.3 }, { 75.7, 73.9 }, { 81.6, 67.0 }, { 81.6, 58.8 } },
    { { 71.4, 73.3 }, { 63.5, 61.4 }, { 56.4, 68.2 }, { 62.8, 84.2 } },
    { { 58.1, 83.3 }, { 53.0, 71.8 }, { 50.8, 74.1 }, { 47.5, 72.9 }, { 38.8, 79.2 }, { 47.1, 98.8 } }
}

ORGRIMMAR_LOCATIONS = { 'VSTRENGTH', 'SPIRITS', 'WISDOM', 'DRAG', 'HONOR' }
ORGRIMMAR_POS = {
    { 1, { 53.5, 82.0 } },
    { 1, { 49.4, 68.7 } },
    { 1, { 48.7, 83.8 } },
    { 2, { 33.4, 65.7 } },
    { 2, { 35.4, 69.4 } },
    { 2, { 37.9, 84.5 } },
    { 2, { 38.5, 80.7 } },
    { 3, { 38.9, 49.9 } },
    { 3, { 41.7, 44.8 } },
    { 3, { 48.4, 44.1 } },
    { 3, { 51.0, 45.2 } },
    { 4, { 57.7, 65.1 } },
    { 4, { 57.6, 58.6 } },
    { 4, { 60.4, 55.1 } },
    { 4, { 57.9, 48.6 } },
    { 5, { 65.8, 50.6 } },
    { 5, { 68.2, 42.9 } },
    { 5, { 67.0, 37.4 } },
    { 5, { 63.9, 30.4 } }
}

ORGRIMMAR_BOUNDRIES = {
    { { 43.2, 66.6 }, { 44.4, 87.2 }, { 57.0, 84.6 }, { 52.8, 67.4 }, { 50.2, 62.2 } },
    { { 21.8, 63.2 }, { 37.4, 89.0 }, { 42.4, 78.8 }, { 33.8, 54.2 } },
    { { 36.0, 40.0 }, { 36.4, 58.6 }, { 49.8, 57.0 }, { 51.5, 50.7 }, { 57.5, 42.1 } },
    { { 51.2, 61.6 }, { 53.8, 67.0 }, { 58.1, 72.0 }, { 66.0, 58.4 }, { 58.8, 42.0 }, { 52.5, 50.7 } },
    { { 59.2, 26.0 }, { 60.4, 43.4 }, { 67.4, 57.4 }, { 84.4, 40.0 }, { 72.6, 24.0 } }
}

TEXT_COLORS = {
    { 255, 0,   0 }, -- 0
    { 200, 78,  8 }, -- 1
    { 0,   255, 0 }  -- 2
}

SIZES = {
    18, -- In different
    24, -- In none
    30  -- In
}
TXT_FRAMES = nil

---------------- Globals ----------------

CRYSTALS = { 0, 0, 0, 0, 0 }
CHESTS = { 0, 0, 0, 0, 0 }
CHESTS_IN_ZONE = { 3, 2, 2, 2, 2 }
ZONE = 'SW'
forceHidden = false

movable = false
SLASH_ZSTORM1 = "/zstorm"
SLASH_ZORGRI1 = "/zorgri"
SLASH_ZHIDE1 = "/zhide"
SLASH_ZMOV1 = "/zmov"
SLASH_ZCOMM1 = "/zcomm"

---------------- UI Creation ----------------

local function CreateUI()
    -- Create the main frame
    CVT_Frame = CreateFrame("Frame", "CVT_Frame", UIParent, "BackdropTemplate")
    CVT_Frame:SetSize(455, 210)
    CVT_Frame:SetPoint("LEFT")
    CVT_Frame:SetMovable(false)
    CVT_Frame:EnableMouse(true)
    CVT_Frame:RegisterForDrag("LeftButton")
    CVT_Frame:SetAlpha(0) -- Initially hidden, as per HideF()

    -- Apply backdrop with background and border
    CVT_Frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })

    -- Create title FontString
    local titleText = CVT_Frame:CreateFontString("CVT_Title", "OVERLAY", "GameFontNormal")
    titleText:SetPoint("TOP", 0, -10)
    titleText:SetText(L[lang].TITLE)

    -- Create FontStrings (TXT1 to TXT5)
    TXT_FRAMES = {}
    for i = 1, 5 do
        local fs = CVT_Frame:CreateFontString("TXT" .. i, "OVERLAY")
        fs:SetFont("Fonts\\ARIALN.TTF", 30)
        fs:SetJustifyH("LEFT")
        fs:SetJustifyV("TOP")
        fs:SetTextColor(1, 0, 0, 1) -- Default red color
        fs:SetShadowOffset(5, 0)
        fs:SetShadowColor(0, 0, 0, 1)
        if i == 1 then
            fs:SetPoint("TOPLEFT", CVT_Frame, "TOPLEFT", 16, -30) -- Adjusted to fit below title
        else
            fs:SetPoint("TOPLEFT", TXT_FRAMES[i - 1], "BOTTOMLEFT", 0, -8)
        end
        fs:SetText("") -- Initially empty
        TXT_FRAMES[i] = fs
    end

    -- Register scripts
    CVT_Frame:SetScript("OnDragStart", function(self)
        if self:IsMovable() then
            self:StartMoving()
        end
    end)

    CVT_Frame:SetScript("OnDragStop", function(self)
        if self:IsMovable() then
            self:StopMovingOrSizing()
            SavePosition()
        end
    end)

    CVT_Frame:SetScript("OnUpdate", OnUpdateFunction)
    CVT_Frame:SetScript("OnEvent", OnEventFunction)

    -- Register events
    CVT_Frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    CVT_Frame:RegisterEvent("ZONE_CHANGED_INDOORS")
end

---------------- Addon Functions ----------------

function IsPointInPolygon(poly, pointX, pointY)
    local x, y = pointX, pointY
    local j = #poly
    local oddNodes = false
    for i = 1, #poly do
        if (poly[i][2] < y and poly[j][2] >= y or poly[j][2] < y and poly[i][2] >= y) then
            if (poly[i][1] + (y - poly[i][2]) / (poly[j][2] - poly[i][2]) * (poly[j][1] - poly[i][1]) < x) then
                oddNodes = not oddNodes
            end
        end
        j = i
    end
    return oddNodes
end

function IsRunning()
    if not CVT_Frame then return false end
    return CVT_Frame:GetAlpha() == 1
end

function GetPlayerPosition()
    local map = C_Map.GetBestMapForUnit("player")
    if not map then
        return 0, 0
    end

    local position = C_Map.GetPlayerMapPosition(map, "player")
    if not position then
        return 0, 0
    end

    local x, y = position:GetXY()
    x = x * 100
    y = y * 100
    return x, y
end

function transformCoordsSW(pX, pY)
    local x, y = pX, pY
    local dist = math.sqrt((x * x) + (y * y))
    local alpha = (y / dist * 180) / 3.14
    alpha = alpha + 33.7

    local xx = math.cos(alpha) * dist
    local yy = math.sin(alpha) * dist

    return xx, yy
end

function distanceFromCrystal(crystal)
    local pX, pY = GetPlayerPosition()
    local cX, cY = crystal[1], crystal[2]
    local dX, dY = pX - cX, pY - cY

    local dist = math.sqrt((dX * dX) + (dY * dY))
    return dist
end

function CountPickedCrystal()
    local bounds = (ZONE == 'SW') and STORMWIND_BOUNDRIES or ORGRIMMAR_BOUNDRIES
    local pX, pY = GetPlayerPosition()
    for i = 1, 5 do
        if IsPointInPolygon(bounds[i], pX, pY) then
            CRYSTALS[i] = CRYSTALS[i] + 1
        end
    end
end

function CountPickedChest()
    local bounds = (ZONE == 'SW') and STORMWIND_BOUNDRIES or ORGRIMMAR_BOUNDRIES
    local pX, pY = GetPlayerPosition()
    for i = 1, 5 do
        if IsPointInPolygon(bounds[i], pX, pY) then
            CHESTS[i] = CHESTS[i] + 1
        end
    end
end

function PrintOutputTexts()
    if not CVT_Frame or not TXT_FRAMES then
        CreateUI()
    end
    local ARR = (ZONE == 'SW') and L[lang].SW_LOCATIONS or L[lang].OG_LOCATIONS
    local bounds = (ZONE == 'SW') and STORMWIND_BOUNDRIES or ORGRIMMAR_BOUNDRIES
    local zoneID = (ZONE == 'SW') and 84 or 85
    local lastZoneId = 0

    local tasks = GetTasksTable()
    local taskName = ''
    if #tasks == 1 then
        local isInArea, isOnMap, numObjectives, taskName, displayAsObjective = GetTaskInfo(tasks[1])
    end

    local pX, pY = GetPlayerPosition()
    for i = 1, 5 do
        if IsPointInPolygon(bounds[i], pX, pY) then
            lastZoneId = i
        end
    end

    for i = 1, 5 do
        TXT_FRAMES[i]:SetText(ARR[i] ..
            ':  ' ..
            CRYSTALS[i] ..
            '/2 |TInterface\\ICONS\\inv_misc_gem_flamespessarite_02:14:14:0:0:16:16:0:16:0:16|t \| |TInterface\\ICONS\\inv_misc_treasurechest02d:14:14:0:0:16:16:0:16:0:16|t ' ..
            CHESTS[i] .. '/' .. CHESTS_IN_ZONE[i])
        if lastZoneId == 0 then
            TXT_FRAMES[i]:SetFont("Fonts\\ARIALN.TTF", SIZES[2])
        elseif lastZoneId == i then
            TXT_FRAMES[i]:SetFont("Fonts\\ARIALN.TTF", SIZES[3])
        else
            TXT_FRAMES[i]:SetFont("Fonts\\ARIALN.TTF", SIZES[1])
        end

        local CL = TEXT_COLORS[CRYSTALS[i] + 1]
        TXT_FRAMES[i]:SetTextColor(CL[1] / 255, CL[2] / 255, CL[3] / 255)
    end
end

function LoadTextFrames()
    -- Already populated in CreateUI
end

function HideF()
    if not CVT_Frame or not TXT_FRAMES then
        CreateUI()
    end
    for i = 1, 5 do
        TXT_FRAMES[i]:SetText('')
    end
    CVT_Frame:SetAlpha(0) -- Hides frame, backdrop, and title
    movable = false
    CVT_Frame:SetMovable(movable)
    CVT_Frame:EnableMouse(true)
end

function ShowF()
    if not CVT_Frame or not TXT_FRAMES then
        CreateUI()
    end
    CVT_Frame:SetAlpha(1) -- Shows frame, backdrop, and title
    if TrakPos then
        CVT_Frame:ClearAllPoints()
        CVT_Frame:SetPoint(unpack(TrakPos))
    end
end

function SavePosition()
    if not CVT_Frame then
        CreateUI()
    end
    local point, relativeTo, relativePoint, xOfs, yOfs = CVT_Frame:GetPoint(1)
    TrakPos = { point, relativeTo and relativeTo:GetName(), relativePoint, xOfs, yOfs }
    print("saved")
end

---------------- Events Functions ----------------

local events = {}
function events:UNIT_SPELLCAST_SUCCEEDED(unitTarget, castGUID, spellID)
    if unitTarget == "player" then
        if spellID == 143394 then
            CountPickedCrystal()
        elseif spellID == 306608 then
            CountPickedChest()
        end
    end
end

function events:ZONE_CHANGED_INDOORS()
    local zone = GetMinimapZoneText()
    if IsRunning() == false and not forceHidden then
        if zone == "Vision of Orgrimmar" then
            ShowF()
            ZONE = 'OG'
            CRYSTALS = { 0, 0, 0, 0, 0 }
            CHESTS = { 0, 0, 0, 0, 0 }
        elseif zone == "Vision of Stormwind" then
            ShowF()
            ZONE = 'SW'
            CRYSTALS = { 0, 0, 0, 0, 0 }
            CHESTS = { 0, 0, 0, 0, 0 }
        end
    else
        if zone == "Chamber of Heart" then
            HideF()
        end
    end
end

---------------- Events Handler ----------------

function OnUpdateFunction(self, deltaTime)
    local zone = GetMinimapZoneText()
    if IsRunning() == true then
        PrintOutputTexts()
        if zone == "Chamber of Heart" then
            HideF()
        end
    elseif not forceHidden then
        if zone == "Vision of Stormwind" then
            ShowF()
            ZONE = 'SW'
            CRYSTALS = { 0, 0, 0, 0, 0 }
            CHESTS = { 0, 0, 0, 0, 0 }
        elseif zone == "Vision of Orgrimmar" then
            ShowF()
            ZONE = 'OG'
            CRYSTALS = { 0, 0, 0, 0, 0 }
            CHESTS = { 0, 0, 0, 0, 0 }
        end
    end
end

function OnEventFunction(self, event, ...)
    if events[event] then
        events[event](self, ...)
    end
end

---------------- Slash Commands ----------------

function setStormwind(msg, editBox)
    ZONE = 'SW'
    forceHidden = false
    ShowF()
    CRYSTALS = { 0, 0, 0, 0, 0 }
    CHESTS = { 0, 0, 0, 0, 0 }
end

SlashCmdList["ZSTORM"] = setStormwind

function setOrgrimmar(msg, editBox)
    ZONE = 'OG'
    forceHidden = false
    ShowF()
    CRYSTALS = { 0, 0, 0, 0, 0 }
    CHESTS = { 0, 0, 0, 0, 0 }
end

SlashCmdList["ZORGRI"] = setOrgrimmar

function hideCrystalCounter(msg, editBox)
    forceHidden = true
    HideF()
end

SlashCmdList["ZHIDE"] = hideCrystalCounter

function movability(msg, editBox)
    if not CVT_Frame then
        CreateUI()
    end
    movable = not movable
    CVT_Frame:SetMovable(movable)
    CVT_Frame:EnableMouse(movable)
    print("Movable: " .. tostring(movable))
end

SlashCmdList["ZMOV"] = movability

function helper(msg, editBox)
    print(L[lang].HELP_TEXT)
end

SlashCmdList["ZCOMM"] = helper

---------------- Initialization ----------------

local function OnAddonLoaded(self, event, addonName)
    if addonName == "ZamestoTV_VisionHelper" then
        CreateUI()
        LoadTextFrames()
        HideF()
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", OnAddonLoaded)
