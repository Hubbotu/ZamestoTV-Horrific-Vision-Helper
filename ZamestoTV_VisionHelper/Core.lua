---------------- Constants ----------------

MAX_PICKING_DISTANCE = 0.8

-- Localization tables
local L = {
    enUS = {
        TITLE = "Vision Tracker",
        SW_LOCATIONS = { 'Cathedral Square', 'Dwarven District', 'Old Town', 'Trade District', 'Mage Quarter' },
        OG_LOCATIONS = { 'Valley of Strength', 'Valley of Spirits', 'Valley of Wisdom', 'The Drag', 'Valley of Honor' },
        HELP_TEXT =
        "/zstorm - Stormwind (resets counting)\n/zorgri - Orgrimmar (resets counting)\n/zhide - Hide stats\n/zscale <value> - Set frame scale (0.5-2.0)\n/zfontsize <value> - Set font size (8-20)"
    },
    ruRU = {
        TITLE = "Трекер видений",
        SW_LOCATIONS = { 'Соборная площадь', 'Квартал Дворфов', 'Старый город', 'Торговый квартал', 'Квартал магов' },
        OG_LOCATIONS = { 'Крепость Громмаш', 'Аллея Духов', 'Аллея Мудрости', 'Волок', 'Аллея Чести' },
        HELP_TEXT =
        "/zstorm - Штормград (сбрасывает подсчет)\n/zorgri - Оргриммар (сбрасывает подсчет)\n/zhide - Скрыть статистику\n/zscale <value> - Установить масштаб окна (0.5-2.0)\n/zfontsize <value> - Установить размер шрифта (8-20)"
    },
    ptBR = {
        TITLE = "Rastreador de Visão",
        SW_LOCATIONS = { 'Praça da Catedral', 'Distrito dos Anões', 'Cidade Velha', 'Distrito Comercial', 'Distrito dos Magos' },
        OG_LOCATIONS = { 'Vale da Força', 'Vale dos Espíritos', 'Vale da Sabedoria', 'O Bazar', 'Vale da Honra' },
        HELP_TEXT =
        "/zstorm - Ventobravo (reinicia a contagem)\n/zorgri - Orgrimmar (reinicia a contagem)\n/zhide - Ocultar estatísticas\n/zscale <value> - Definir escala do quadro (0.5-2.0)\n/zfontsize <value> - Definir tamanho da fonte (8-20)"
    },
    frFR = {
        TITLE = "Suivi de la vision",
        SW_LOCATIONS = { 'Place de la Cathédrale', 'Quartier des Nains', 'Vieille ville', 'Quartier commerçant', 'Quartier des Mages' },
        OG_LOCATIONS = { 'Vallée de la Force', 'Vallée des Esprits', 'Vallée de la Sagesse', 'La Herse', 'Vallée de l’Honneur' },
        HELP_TEXT =
        "/zstorm - Hurlevent (réinitialise le compteur)\n/zorgri - Orgrimmar (réinitialise le compteur)\n/zhide - Cacher les statistiques\n/zscale <value> - Définir l'échelle du cadre (0.5-2.0)\n/zfontsize <value> - Définir la taille de la police (8-20)"
    },
    zhCN = {
        TITLE = "追踪器",
        SW_LOCATIONS = { '教堂广场', '矮人区', '旧城区', '贸易区', '法师区' },
        OG_LOCATIONS = { '力量谷', '精神谷', '智慧谷', '暗巷区', '荣誉谷' },
        HELP_TEXT =
        "/zstorm - 暴风城 (重置计数)\n/zorgri - 奥格瑞玛 (重置计数)\n/zhide - 隐藏统计\n/zscale <value> - 设置框架缩放 (0.5-2.0)\n/zfontsize <value> - 设置字体大小 (8-20)"
    },
	zhTW = {
        TITLE = "追蹤器",
        SW_LOCATIONS = { '教堂廣場', '矮人區', '舊城區', '貿易區', '法師區' },
        OG_LOCATIONS = { '力量谷', '精神谷', '智慧谷', '暗巷區', '榮譽谷' },
        HELP_TEXT =
        "/zstorm - 暴風城 (重置計數)\n/zorgri - 奧格瑪 (重置計數)\n/zhide - 隱藏統計\n/zscale <value> - 設置框架縮放 (0.5-2.0)\n/zfontsize <value> - 設置字體大小 (8-20)"
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
    9,  -- In different
    12, -- In none
    15  -- In
}
TXT_FRAMES = nil

---------------- Globals ----------------

CRYSTALS = { 0, 0, 0, 0, 0 }
CHESTS = { 0, 0, 0, 0, 0 }
CHESTS_IN_ZONE = { 3, 2, 2, 2, 2 }
ZONE = 'SW'
forceHidden = false
frameScale = 1.0 -- Default frame scale
fontSize = 15    -- Default font size
isActivated = false -- Tracks if /zstorm or /zorgri has been called

SLASH_ZSTORM1 = "/zstorm"
SLASH_ZORGRI1 = "/zorgri"
SLASH_ZHIDE1 = "/zhide"
SLASH_ZCOMM1 = "/zcomm"
SLASH_ZSCALE1 = "/zscale"
SLASH_ZFONTSIZE1 = "/zfontsize"

---------------- UI Creation ----------------

local function CreateUI()
    -- Create the main frame
    CVT_Frame = CreateFrame("Frame", "CVT_Frame", UIParent, "BackdropTemplate")
    CVT_Frame:SetSize(280, 170)
    CVT_Frame:SetPoint("LEFT")
    CVT_Frame:SetMovable(true) -- Frame is movable by default
    CVT_Frame:EnableMouse(true) -- Enable mouse for dragging when visible
    CVT_Frame:SetFrameStrata("LOW") -- Set to LOW to avoid overlapping with party frames
    CVT_Frame:RegisterForDrag("LeftButton")
    CVT_Frame:SetAlpha(0) -- Initially hidden, as per HideF()
    CVT_Frame:SetScale(frameScale) -- Apply initial scale

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
        fs:SetFont("Fonts\\ARIALN.TTF", fontSize)
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
        self:StartMoving()
    end)

    CVT_Frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        SavePosition()
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
            TXT_FRAMES[i]:SetFont("Fonts\\ARIALN.TTF", fontSize)
        elseif lastZoneId == i then
            TXT_FRAMES[i]:SetFont("Fonts\\ARIALN.TTF", fontSize + 3)
        else
            TXT_FRAMES[i]:SetFont("Fonts\\ARIALN.TTF", fontSize - 3)
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
    CVT_Frame:EnableMouse(false) -- Disable mouse when hidden
end

function ShowF()
    if not CVT_Frame or not TXT_FRAMES then
        CreateUI()
    end
    CVT_Frame:SetAlpha(1) -- Shows frame, backdrop, and title
    CVT_Frame:SetScale(frameScale) -- Apply current scale
    CVT_Frame:EnableMouse(true) -- Enable mouse for dragging when visible
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
    SaveSettings() -- Save position to SavedVariables
    print("Position saved")
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
    if IsRunning() and zone == "Chamber of Heart" then
        HideF()
    end
end

---------------- Events Handler ----------------

function OnUpdateFunction(self, deltaTime)
    local zone = GetMinimapZoneText()
    if IsRunning() then
        PrintOutputTexts()
        if zone == "Chamber of Heart" then
            HideF()
        end
    elseif isActivated and not forceHidden then
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
    -- Ensure mouse is disabled when frame is hidden
    if CVT_Frame and CVT_Frame:GetAlpha() == 0 then
        CVT_Frame:EnableMouse(false)
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
    isActivated = true
    ShowF()
    CRYSTALS = { 0, 0, 0, 0, 0 }
    CHESTS = { 0, 0, 0, 0, 0 }
end

SlashCmdList["ZSTORM"] = setStormwind

function setOrgrimmar(msg, editBox)
    ZONE = 'OG'
    forceHidden = false
    isActivated = true
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

function setFrameScale(msg, editBox)
    local scale = tonumber(msg)
    if scale and scale >= 0.5 and scale <= 2.0 then
        frameScale = scale
        if CVT_Frame then
            CVT_Frame:SetScale(frameScale)
            SaveSettings() -- Save to SavedVariables
            print("Frame scale set to: " .. frameScale)
        else
            print("Frame not initialized. Creating UI...")
            CreateUI()
        end
    else
        print("Please enter a valid scale between 0.5 and 2.0")
    end
end

SlashCmdList["ZSCALE"] = setFrameScale

function setFontSize(msg, editBox)
    local size = tonumber(msg)
    if size and size >= 8 and size <= 20 then
        fontSize = size
        if TXT_FRAMES then
            for i = 1, 5 do
                TXT_FRAMES[i]:SetFont("Fonts\\ARIALN.TTF", fontSize)
            end
            SaveSettings() -- Save to SavedVariables
            PrintOutputTexts()
            print("Font size set to: " .. fontSize)
        else
            print("Text frames not initialized. Creating UI...")
            CreateUI()
        end
    else
        print("Please enter a valid font size between 8 and 20")
    end
end

SlashCmdList["ZFONTSIZE"] = setFontSize

function helper(msg, editBox)
    print(L[lang].HELP_TEXT)
end

SlashCmdList["ZCOMM"] = helper

---------------- Settings Persistence ----------------

function SaveSettings()
    ZamestoTV_Settings = ZamestoTV_Settings or {}
    ZamestoTV_Settings.frameScale = frameScale
    ZamestoTV_Settings.fontSize = fontSize
    ZamestoTV_Settings.position = TrakPos
end

function LoadSettings()
    if ZamestoTV_Settings then
        frameScale = ZamestoTV_Settings.frameScale or 1.0
        fontSize = ZamestoTV_Settings.fontSize or 15
        TrakPos = ZamestoTV_Settings.position or nil
        if CVT_Frame then
            CVT_Frame:SetScale(frameScale)
            if TXT_FRAMES then
                for i = 1, 5 do
                    TXT_FRAMES[i]:SetFont("Fonts\\ARIALN.TTF", fontSize)
                end
            end
            if TrakPos then
                CVT_Frame:ClearAllPoints()
                CVT_Frame:SetPoint(unpack(TrakPos))
            end
        end
    end
end

---------------- Initialization ----------------

local function OnAddonLoaded(self, event, addonName)
    if addonName == "ZamestoTV_VisionHelper" then
        LoadSettings()
        CreateUI()
        LoadTextFrames()
        HideF()
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", OnAddonLoaded)
