local addonName, addon = ...

-- Localization for "Odd Crystal" and zone names
local locale = GetLocale()
local localization = {
    ["enUS"] = {
        ["OddCrystal"] = "Odd Crystal",
        ["Cathedral Square"] = "Cathedral Square",
        ["Dwarven District"] = "Dwarven District",
        ["Old Town"] = "Old Town",
        ["Trade District"] = "Trade District",
        ["Mage Quarter"] = "Mage Quarter",
        ["Valley of Strength"] = "Valley of Strength",
        ["Valley of Spirits"] = "Valley of Spirits",
        ["Valley of Wisdom"] = "Valley of Wisdom",
        ["The Drag"] = "The Drag",
        ["Valley of Honor"] = "Valley of Honor",
    },
    ["deDE"] = {
        ["OddCrystal"] = "Seltsamer Kristall",
        ["Cathedral Square"] = "Der Kathedralenplatz",
        ["Dwarven District"] = "Der Zwergendistrikt",
        ["Old Town"] = "Die Altstadt",
        ["Trade District"] = "Der Handelsdistrikt",
        ["Mage Quarter"] = "Das Magierviertel",
        ["Valley of Strength"] = "Das Tal der Stärke",
        ["Valley of Spirits"] = "Das Tal der Geister",
        ["Valley of Wisdom"] = "Das Tal der Weisheit",
        ["The Drag"] = "Die Gasse",
        ["Valley of Honor"] = "Das Tal der Ehre",
    },
    ["esES"] = {
        ["OddCrystal"] = "Cristal extraño",
        ["Cathedral Square"] = "Plaza de la Catedral",
        ["Dwarven District"] = "Distrito de los Enanos",
        ["Old Town"] = "Casco Antiguo",
        ["Trade District"] = "Distrito de Mercaderes",
        ["Mage Quarter"] = "Barrio de los Magos",
        ["Valley of Strength"] = "Valley de la Fuerza",
        ["Valley of Spirits"] = "Valley de los Espíritus",
        ["Valley of Wisdom"] = "Valley de la Sabiduría",
        ["The Drag"] = "Calle Mayor",
        ["Valley of Honor"] = "Valley del Honor",
    },
    ["esMX"] = {
        ["OddCrystal"] = "Cristal extraño",
        ["Cathedral Square"] = "Plaza de la Catedral",
        ["Dwarven District"] = "Distrito de los Enanos",
        ["Old Town"] = "Casco Antiguo",
        ["Trade District"] = "Distrito de Mercaderes",
        ["Mage Quarter"] = "Barrio de los Magos",
        ["Valley of Strength"] = "Valley de la Fuerza",
        ["Valley of Spirits"] = "Valley de los Espíritus",
        ["Valley of Wisdom"] = "Valle de la Sabiduría",
        ["The Drag"] = "La Calle Mayor",
        ["Valley of Honor"] = "Valley del Honor",
    },
    ["frFR"] = {
        ["OddCrystal"] = "Cristal étrange",
        ["Cathedral Square"] = "Place de la Cathédrale",
        ["Dwarven District"] = "Quartier des Nains",
        ["Old Town"] = "Vieille ville",
        ["Trade District"] = "Quartier commerçant",
        ["Mage Quarter"] = "Quartier des Mages",
        ["Valley of Strength"] = "Vallée de la Force",
        ["Valley of Spirits"] = "Vallée des Esprits",
        ["Valley of Wisdom"] = "Vallée de la Sagesse",
        ["The Drag"] = "La Herse",
        ["Valley of Honor"] = "Vallée de l'Honneur",
    },
    ["itIT"] = {
        ["OddCrystal"] = "Cristallo Strano",
        ["Cathedral Square"] = "Piazza della Cattedrale",
        ["Dwarven District"] = "Distretto dei Nani",
        ["Old Town"] = "Città Vecchia",
        ["Trade District"] = "Distretto Commerciale",
        ["Mage Quarter"] = "Quartiere dei Maghi",
        ["Valley of Strength"] = "Valle della Forza",
        ["Valley of Spirits"] = "Valle degli Spiriti",
        ["Valley of Wisdom"] = "Valle della Saggezza",
        ["The Drag"] = "Varcolargo",
        ["Valley of Honor"] = "Valle dell'Onore",
    },
    ["ptBR"] = {
        ["OddCrystal"] = "Cristal Estranho",
        ["Cathedral Square"] = "Praça da Catedral",
        ["Dwarven District"] = "Distrito dos Anões",
        ["Old Town"] = "Cidade Velha",
        ["Trade District"] = "Distrito Comercial",
        ["Mage Quarter"] = "Distrito dos Magos",
        ["Valley of Strength"] = "Vale da Força",
        ["Valley of Spirits"] = "Vale dos Espíritos",
        ["Valley of Wisdom"] = "Vale da Sabedoria",
        ["The Drag"] = "O Bazar",
        ["Valley of Honor"] = "Vale da Honra",
    },
    ["ruRU"] = {
        ["OddCrystal"] = "Странный кристалл",
        ["Cathedral Square"] = "Соборная площадь",
        ["Dwarven District"] = "Квартал дворфов",
        ["Old Town"] = "Старый город",
        ["Trade District"] = "Торговый квартал",
        ["Mage Quarter"] = "Квартал Магов",
        ["Valley of Strength"] = "Аллея Силы",
        ["Valley of Spirits"] = "Аллея Духов",
        ["Valley of Wisdom"] = "Аллея Мудрости",
        ["The Drag"] = "Волок",
        ["Valley of Honor"] = "Аллея Чести",
    },
    ["zhTW"] = {
        ["OddCrystal"] = "奇怪的水晶",
        ["Cathedral Square"] = "大教堂廣場",
        ["Dwarven District"] = "矮人區",
        ["Old Town"] = "舊城區",
        ["Trade District"] = "貿易區",
        ["Mage Quarter"] = "法師區",
        ["Valley of Strength"] = "力量谷",
        ["Valley of Spirits"] = "精神谷",
        ["Valley of Wisdom"] = "智慧谷",
        ["The Drag"] = "暗巷區",
        ["Valley of Honor"] = "榮譽谷",
    },
    ["koKR"] = {
        ["OddCrystal"] = "기이한 수정",
        ["Cathedral Square"] = "대성당 광장",
        ["Dwarven District"] = "드워프 지구",
        ["Old Town"] = "구 시가지",
        ["Trade District"] = "상업 지구",
        ["Mage Quarter"] = "마법사 지구",
        ["Valley of Speed"] = "힘의 골짜기",
        ["Valley of Spirits"] = "정령의 골짜기",
        ["Valley of Wisdom"] = "지혜의 골짜기",
        ["The Drag"] = "골목길",
        ["Valley of Honor"] = "명예의 골짜기",
    },
    ["zhCN"] = {
        ["OddCrystal"] = "怪异水晶",
        ["Cathedral Square"] = "大教堂广场",
        ["Dwarven District"] = "矮人区",
        ["Old Town"] = "旧城区",
        ["Trade District"] = "贸易区",
        ["Mage Quarter"] = "法师区",
        ["Valley of Strength"] = "力量谷",
        ["Valley of Spirits"] = "灵魂谷",
        ["Valley of Wisdom"] = "智慧谷",
        ["The Drag"] = "暗巷",
        ["Valley of Honor"] = "荣誉谷",
    },
}
local oddCrystalName = localization[locale]["OddCrystal"] or "Odd Crystal"

-- Map and zone data
local names = {
    [1469] = {
        localization[locale]["Valley of Strength"] or "Valley of Strength",
        localization[locale]["Valley of Spirits"] or "Valley of Spirits",
        localization[locale]["Valley of Wisdom"] or "Valley of Wisdom",
        localization[locale]["The Drag"] or "The Drag",
        localization[locale]["Valley of Honor"] or "Valley of Honor",
    },
    [2403] = {
        localization[locale]["Valley of Strength"] or "Valley of Strength",
        localization[locale]["Valley of Spirits"] or "Valley of Spirits",
        localization[locale]["Valley of Wisdom"] or "Valley of Wisdom",
        localization[locale]["The Drag"] or "The Drag",
        localization[locale]["Valley of Honor"] or "Valley of Honor",
    },
    [1470] = {
        localization[locale]["Cathedral Square"] or "Cathedral Square",
        localization[locale]["Dwarven District"] or "Dwarven District",
        localization[locale]["Old Town"] or "Old Town",
        localization[locale]["Trade District"] or "Trade District",
        localization[locale]["Mage Quarter"] or "Mage Quarter",
    },
    [2404] = {
        localization[locale]["Cathedral Square"] or "Cathedral Square",
        localization[locale]["Dwarven District"] or "Dwarven District",
        localization[locale]["Old Town"] or "Old Town",
        localization[locale]["Trade District"] or "Trade District",
        localization[locale]["Mage Quarter"] or "Mage Quarter",
    },
}

local visions = {
    [2403] = { -- Orgrimmar
        { -- The Valley of Strength
            {43.74, 64.27}, {47.72, 87.79}, {58.38, 86.36}, {53.44, 67.78}, {49.11, 59.98},
        },
        { -- The Valley of Spirits
            {21.99, 62.97}, {25.54, 72.84}, {35.59, 90.26}, {43.39, 85.58}, {42.09, 63.36}, {36.81, 58.68},
        },
        { -- The Valley of Wisdom
            {38.54, 38.02}, {35.51, 55.22}, {53.01, 57.38}, {53.79, 40.10},
        },
        { -- The Drag
            {52.49, 60.50}, {55.00, 68.43}, {65.31, 60.89}, {59.51, 45.03}, {55.69, 45.42}, {53.44, 51.92}, {54.83, 59.98},
        },
        { -- The Valley of Honor
            {60.72, 43.73}, {65.92, 56.08}, {77.53, 49.06}, {77.53, 28.14}, {65.22, 25.41}, {59.51, 30.09},
        },
    },
    [2404] = { -- Stormwind
        { -- Stormwind Cathedral
            {43.81, 50.47}, {51.94, 65.89}, {63.18, 54.95}, {55.89, 40.06},
        },
        { -- The Dwarven District
            {55.64, 31.64}, {65.45, 52.98}, {72.98, 43.65}, {66.04, 23.39},
        },
        { -- Old Town
            {66.16, 56.74}, {78.24, 75.93}, {85.89, 64.28}, {77.85, 47.50},
        },
        { -- Trade District
            {54.93, 67.32}, {61.62, 82.93}, {71.66, 73.60}, {64.49, 59.07},
        },
        { -- The Mage Quarter
            {37.11, 79.34}, {46.68, 97.99}, {60.07, 85.08}, {52.65, 67.50},
        },
    },
}
visions[1469] = visions[2403]
visions[1470] = visions[2404]

-- State tracking
local state = {
    crystal = false,
    chestOpened = false,
    mementos = false,
    last = nil,
    crystalsEnabled = true,
    bars = {},
    uiFrame = nil,
    isFrozen = false,
}

-- Ray-casting algorithm to check if a point is inside a polygon
local function isInside(location, x, y)
    local inside = false
    local total = #location
    
    for i = 1, total do
        local j = (i % total) + 1
        local xi, yi = location[i][1], location[i][2]
        local xj, yj = location[j][1], location[j][2]
        
        if (xi == xj and x == xi and y >= math.min(yi, yj) and y <= math.max(yi, yj))
        or (yi == yj and y == yi and x >= math.min(xi, xj) and x <= math.max(xi, xj)) then
            return true
        end
        
        if (yi > y) ~= (yj > y) then
            local intersect = (xj - xi) * (y - yi) / (yj - yi) + xi
            if x <= intersect then
                inside = not inside
            end
        end
    end
    return inside
end

-- Get player's current zone (quartal)
local function GetLocation()
    local mapID = C_Map.GetBestMapForUnit("player")
    local current = visions[mapID]
    if current then
        local position = C_Map.GetPlayerMapPosition(mapID, "player")
        local x, y = position.x * 100, position.y * 100
        for quartal, data in ipairs(current) do
            if isInside(data, x, y) then
                return quartal
            end
        end
    end
end

-- Create a progress bar frame
local function CreateProgressBar(index, name, total, isCrystal)
    local frame = CreateFrame("StatusBar", addonName .. "Bar" .. index, UIParent)
    frame:SetSize(60, 30)
    frame:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    frame:SetStatusBarColor(1, 0, 0, 1)
    frame:SetMinMaxValues(0, total)
    frame:SetValue(0)
    
    local bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0, 0, 0, 0.25)
    
    local border = CreateFrame("Frame", nil, frame, "BackdropTemplate")
    border:SetPoint("CENTER")
    border:SetBackdrop({
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 4,
        insets = { left = 1, right = 1, top = 1, bottom = 1 },
    })
    border:SetBackdropBorderColor(1, 1, 1, 1)
    
    local nameText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetPoint("RIGHT", frame, "RIGHT", -60, 0)
    nameText:SetTextColor(1, 0.81960791349411, 0, 1)
    nameText:SetFont("Interface\\AddOns\\"..addonName.."\\Literata.ttf", 16, "OUTLINE")
    nameText:SetText(name)
    
    local valueText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    valueText:SetPoint("CENTER", frame, "CENTER", 0, 0)
    valueText:SetTextColor(1, 1, 1, 1)
    valueText:SetFont("Interface\\AddOns\\"..addonName.."\\Literata.ttf", 18, "OUTLINE")
    valueText:SetText("0/" .. total)
    
    local iconText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    local yOffset = isCrystal and (index == 1 and 5 or 3) or (index == 1 and 5 or 3)
    iconText:SetPoint("BOTTOM", frame, "TOP", 0, yOffset)
    iconText:SetTextColor(1, 1, 1, 1)
    iconText:SetFont("Interface\\AddOns\\"..addonName.."\\Literata.ttf", 28, "OUTLINE")
    iconText:SetText(isCrystal and (index == 1 and "|A:poi-nzothpylon:0:0|a" or "") or
                     (index == 1 and "|A:delves-scenario-treasure-available:0:0|a" or ""))
    
    frame.value = 0
    frame.total = total
    frame.key = isCrystal and format("%s-crystal", index) or format("%s-chest", index)
    
    return frame
end

-- Update progress bar
local function UpdateProgressBar(bar, value)
    if state.isFrozen then return end
    bar.value = value > bar.total and bar.total or value
    bar:SetValue(bar.value)
    bar:Show()
    if bar.value == bar.total then
        bar:SetStatusBarColor(0, 1, 0, 1)
    else
        bar:SetStatusBarColor(1, 0, 0, 1)
    end
    for _, region in ipairs({bar:GetRegions()}) do
        if region:GetObjectType() == "FontString" and region:GetPoint(1) == "CENTER" then
            region:SetText(bar.value .. "/" .. bar.total)
        end
    end
end

-- Create Reset and Close buttons
local function CreateButtons(frame)
    -- Create Close button
    local closeButton = CreateFrame("Button", addonName .. "CloseButton", frame, "UIPanelButtonTemplate")
    closeButton:SetSize(80, 22)
    closeButton:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 60, 40)
    closeButton:SetText("Close")

    -- Create Reset button
    local resetButton = CreateFrame("Button", addonName .. "ResetButton", frame, "UIPanelButtonTemplate")
    resetButton:SetSize(80, 22)
    resetButton:SetPoint("RIGHT", closeButton, "LEFT", -10, 0)
    resetButton:SetText("Reset")

    -- Set Close button script
    closeButton:SetScript("OnClick", function()
        state.isFrozen = true
        ZMON_SavedVars.isFrozen = true -- Save to persistent storage
        -- Hide main frame and all bars
        frame:Hide()
        for _, bar in pairs(state.bars) do
            bar:Hide()
        end
        -- Hide the buttons too
        resetButton:Hide()
        closeButton:Hide()
    end)

    -- Set Reset button script
    resetButton:SetScript("OnClick", function()
        state.isFrozen = false
        ZMON_SavedVars.isFrozen = false -- Save to persistent storage
        frame:SetBackdrop({
            tile = true, tileSize = 16, edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 },
        })
        frame:SetBackdropColor(1, 1, 1, 0.5)
        frame:SetBackdropBorderColor(0, 0, 0, 1)
        frame:EnableMouse(true)

        for _, bar in pairs(state.bars) do
            bar:EnableMouse(true)
            bar:Show()
            UpdateProgressBar(bar, 0)
        end

        resetButton:Show()
        closeButton:Show()

        C_ChatInfo.SendAddonMessage("TVISIONS_LOOT", "reset", "INSTANCE_CHAT")
    end)
end

-- Update progress bars based on current mapID
local function UpdateBarsForMap(mapID)
    if not names[mapID] then
        mapID = 2403 -- Fallback to Orgrimmar if mapID is invalid
    end

    -- Clear existing bars
    for _, bar in pairs(state.bars) do
        bar:Hide()
        bar = nil
    end
    state.bars = {}

    -- Create chest bars for the first column
    for i = 1, 5 do
        local bar = CreateProgressBar(i, names[mapID][i], i == 1 and 3 or 2, false)
        state.bars[format("%s-chest", i)] = bar
    end

    -- Create crystal bars for the second column
    if state.crystalsEnabled then
        for i = 1, 5 do
            local crystalBar = CreateProgressBar(i, "", 2, true)
            state.bars[format("%s-crystal", i)] = crystalBar
        end
    end

    -- Position the bars: first column for chests, second column for crystals
    local spacing = 1
    local barWidth = 60
    local barHeight = 30
    for i = 1, 5 do
        local chestBar = state.bars[format("%s-chest", i)]
        if chestBar then
            chestBar:SetPoint("TOPLEFT", state.uiFrame, "TOPLEFT", 0, -(barHeight + spacing) * (i - 1))
        end
        if state.crystalsEnabled then
            local crystalBar = state.bars[format("%s-crystal", i)]
            if crystalBar then
                crystalBar:SetPoint("TOPLEFT", state.uiFrame, "TOPLEFT", barWidth + spacing, -(barHeight + spacing) * (i - 1))
            end
        end
    end
end

-- Initialize UI
local function InitializeUI()
    local frame = CreateFrame("Frame", addonName .. "Frame", UIParent, "BackdropTemplate")
    frame:SetPoint("CENTER", UIParent, "CENTER", 146.67, 332.5)
    frame:SetSize(300, 200)
    frame:SetBackdrop({
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    frame:SetBackdropColor(1, 1, 1, 0.5)
    frame:SetBackdropBorderColor(0, 0, 0, 1)
    
    -- Make frame draggable
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function(self)
        if not state.isFrozen then
            self:StartMoving()
        end
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)
    
    CreateButtons(frame)
    
    frame:Hide()
    return frame
end

-- Initialize UI at addon startup
state.uiFrame = InitializeUI()

-- Slash command to show the frame
SLASH_ZMON1 = "/zmon"
SlashCmdList["ZMON"] = function()
    state.isFrozen = false
    ZMON_SavedVars.isFrozen = false -- Save to persistent storage
    if state.uiFrame then
        local mapID = C_Map.GetBestMapForUnit("player")
        if mapID and (mapID == 2403 or mapID == 2404 or mapID == 1469 or mapID == 1470) then
            UpdateBarsForMap(mapID)
            state.uiFrame:Show()
            state.uiFrame:SetBackdrop({
                tile = true, tileSize = 16, edgeSize = 16,
                insets = { left = 4, right = 4, top = 4, bottom = 4 },
            })
            state.uiFrame:SetBackdropColor(1, 1, 1, 0.5)
            state.uiFrame:SetBackdropBorderColor(0, 0, 0, 1)
            state.uiFrame:EnableMouse(true)
            for _, bar in pairs(state.bars) do
                bar:Show()
                bar:EnableMouse(true)
            end
            if _G[addonName .. "ResetButton"] then _G[addonName .. "ResetButton"]:Show() end
            if _G[addonName .. "CloseButton"] then _G[addonName .. "CloseButton"]:Show() end
        end
    end
end

-- Slash command to hide the frame
SLASH_ZMOFF1 = "/zmoff"
SlashCmdList["ZMOFF"] = function()
    state.isFrozen = true
    ZMON_SavedVars.isFrozen = true -- Save to persistent storage
    if state.uiFrame then
        state.uiFrame:Hide()
    end
    for _, bar in pairs(state.bars) do
        bar:Hide()
    end
    if _G[addonName .. "ResetButton"] then _G[addonName .. "ResetButton"]:Hide() end
    if _G[addonName .. "CloseButton"] then _G[addonName .. "CloseButton"]:Hide() end
end

-- Main event handler
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("UNIT_SPELLCAST_START")
eventFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
eventFrame:RegisterEvent("UNIT_SPELLCAST_STOP")
eventFrame:RegisterEvent("LOOT_READY")
eventFrame:RegisterEvent("LOOT_SLOT_CLEARED")
eventFrame:RegisterEvent("LOOT_CLOSED")
eventFrame:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
eventFrame:RegisterEvent("CHAT_MSG_ADDON")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("ZONE_CHANGED")

C_ChatInfo.RegisterAddonMessagePrefix("TVISIONS_LOOT")

eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and ... == addonName then
        -- Initialize SavedVariables
        ZMON_SavedVars = ZMON_SavedVars or {}
        state.isFrozen = ZMON_SavedVars.isFrozen or false
        -- UI already initialized at startup
elseif event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED" then
    local mapID = C_Map.GetBestMapForUnit("player")

    -- Only update bars if not frozen and they haven't been initialized yet
    if not state.isFrozen and state.uiFrame then
        if mapID and (mapID == 2403 or mapID == 2404 or mapID == 1469 or mapID == 1470) then
            -- Only initialize if state.bars is empty (i.e. not yet created)
            if next(state.bars) == nil then
                UpdateBarsForMap(mapID)
            end

            state.uiFrame:Show()
            state.uiFrame:SetBackdrop({
                tile = true, tileSize = 16, edgeSize = 16,
                insets = { left = 4, right = 4, top = 4, bottom = 4 },
            })
            state.uiFrame:SetBackdropColor(1, 1, 1, 0.5)
            state.uiFrame:SetBackdropBorderColor(0, 0, 0, 1)
            state.uiFrame:EnableMouse(true)

            for _, bar in pairs(state.bars) do
                bar:EnableMouse(true)
                bar:Show()
            end

            if _G[addonName .. "ResetButton"] then _G[addonName .. "ResetButton"]:Show() end
            if _G[addonName .. "CloseButton"] then _G[addonName .. "CloseButton"]:Show() end
        else
            -- If out of vision zone, do NOT reset, do NOT hide bars
            -- Leave current UI state as-is
        end
    end
    elseif event == "UNIT_SPELLCAST_START" then
        local unit, _, spellID = ...
        if spellID == 143394 then
            local tooltip = C_TooltipInfo.GetWorldCursor()
            if tooltip and tooltip.lines and tooltip.lines[1].leftText:match(oddCrystalName) then
                state.crystal = true
                return
            end
            local interact = UnitGUID("softinteract")
            if interact and select(6, strsplit("-", interact)) == "341367" then
                state.crystal = true
            end
        end
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
        local unit, _, spellID = ...
        if spellID == 306608 then
            state.chestOpened = true
        elseif spellID == 143394 and state.crystal then
            local quartal = GetLocation()
            local key = quartal and format("%s-crystal", quartal)
            if quartal and state.bars[key] then
                UpdateProgressBar(state.bars[key], state.bars[key].value + 1)
                C_ChatInfo.SendAddonMessage("TVISIONS_LOOT", format("%s*%s*%s", quartal, UnitGUID("player"), key), "INSTANCE_CHAT")
                state.crystal = false
            end
        end
    elseif event == "UNIT_SPELLCAST_STOP" and state.crystal then
        state.crystal = false
    elseif event == "LOOT_READY" then
        local icon, _, _, currencyType = GetLootSlotInfo(1)
        if icon == 646678 and (currencyType == 1744 or currencyType == 3149) then
            state.mementos = true
        end
    elseif event == "LOOT_SLOT_CLEARED" and state.chestOpened and state.mementos then
        local quartal = GetLocation()
        local key = quartal and format("%s-chest", quartal)
        if quartal and state.bars[key] then
            UpdateProgressBar(state.bars[key], state.bars[key].value + 1)
            C_ChatInfo.SendAddonMessage("TVISIONS_LOOT", format("%s*%s*%s", quartal, UnitGUID("player"), key), "INSTANCE_CHAT")
            state.mementos = false
            state.chestOpened = false
            state.last = nil
        end
    elseif event == "LOOT_CLOSED" and state.chestOpened then
        state.mementos = false
        state.chestOpened = false
        state.last = GetTime()
    elseif event == "CURRENCY_DISPLAY_UPDATE" and state.last then
        local currencyType, _, _, quantityGainSource, destroyReason = ...
        if (currencyType == 1744 or currencyType == 3149) and quantityGainSource == 9 and destroyReason == 16 and (GetTime() - state.last) < 1 then
            local quartal = GetLocation()
            local key = quartal and format("%s-chest", quartal)
            if quartal and state.bars[key] then
                UpdateProgressBar(state.bars[key], state.bars[key].value + 1)
                C_ChatInfo.SendAddonMessage("TVISIONS_LOOT", format("%s*%s*%s", quartal, UnitGUID("player"), key), "INSTANCE_CHAT")
                state.last = nil
            end
        end
    elseif event == "CHAT_MSG_ADDON" then
        local prefix, message, channel = ...
        if prefix == "TVISIONS_LOOT" and message and channel == "INSTANCE_CHAT" then
            local quartal, GUID, key = strsplit("*", message)
            if quartal and GUID ~= UnitGUID("player") and state.bars[key] then
                UpdateProgressBar(state.bars[key], state.bars[key].value + 1)
            end
        end
    end
end)