local addonName, addon = ...

-- Configuration defaults
local defaults = {
    hardCD = 60,
    softCD = 30,
    colours = {
        aoe = {0.9843137254902, 0.3921568627451, 0.050980392156863, 1},
        backalpha = 0.1,
        bad = {1, 0, 0, 1},
        forealpha = 0.5,
        good = {1, 1, 0, 1},
        heal = {0, 1, 0, 1},
        protect = {0.90196078431373, 0.019607843137255, 0.70980392156863, 1}
    },
    effects = {
        aoe = "Fire breath",
        bad = "-100",
        good = "+100",
        heal = "2% Heal",
        protect = "Damage resist"
    },
    controlauras = {
        aoe = true,
        heal = true,
        protect = true
    },
    initstate = {
        show = false,
        value = "Type colour in chat"
    },
    position = {
        point = "CENTER",
        relativeTo = "UIParent",
        relativePoint = "CENTER",
        xOfs = 0,
        yOfs = 0
    }
}

-- Frame creation
local frame = CreateFrame("Frame", "HorrificVisionTrackerFrame", UIParent, "BackdropTemplate")
frame:SetMovable(true)
frame:SetSize(200, 230)
frame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 16,
    insets = {left = 4, right = 4, top = 4, bottom = 4}
})
frame:SetBackdropColor(0.1, 0.1, 0.1, 0.8)

local bars = {}

-- Potion colors
local potionColors = {
    black = {r = 0.42, g = 0.42, b = 0.42, a = 1},
    green = {r = 0.24, g = 0.79, b = 0.06, a = 1},
    red = {r = 0.95, g = 0.02, b = 0.04, a = 1},
    blue = {r = 0, g = 0.36, b = 1, a = 1},
    purple = {r = 0.74, g = 0, b = 1, a = 1}
}

-- Utility functions
local function format_duration(t)
    if not t or t <= 0 then return "" end
    if t > 60 then
        return string.format("%dm", math.ceil(t / 60))
    elseif t > 5 then
        return string.format("%.0f", t)
    else
        return string.format("|cFFFF0000%.1f|r", t)
    end
end

-- Aura environment
local aura_env = {
    buffinfo = {
        [315817] = {duration = 0, expiration = 0}, -- Spicy Potion
        [315849] = {duration = 0, expiration = 0}, -- Sickening Potion
        [315845] = {duration = 0, expiration = 0}  -- Sluggish Potion
    },
    colours = {"black", "blue", "green", "purple", "red"},
    info = {
        {effect = "bad",     position = 1, colour = defaults.colours.bad,     display = defaults.effects.bad},
        {effect = "good",    position = 3, colour = defaults.colours.good,    display = defaults.effects.good},
        {effect = "heal",    position = 2, colour = defaults.colours.heal,    display = defaults.effects.heal},
        {effect = "protect", position = 5, colour = defaults.colours.protect, display = defaults.effects.protect},
        {effect = "aoe",     position = 4, colour = defaults.colours.aoe,     display = defaults.effects.aoe}
    },
    visible = true,
    enteredworld = false
}

function aura_env.resetinfo()
    for _, data in pairs(aura_env.buffinfo) do
        data.duration = 0
        data.expiration = 0
    end
end

local function refreshPotionBars()
    if not aura_env.visible then
        frame:Hide()
        for _, bar in ipairs(bars) do bar:Hide() end
        if aura_env.moveButton then aura_env.moveButton:Hide() end
        if aura_env.closeButton then aura_env.closeButton:Hide() end
        if aura_env.resetButton then aura_env.resetButton:Hide() end
        return
    end

    frame:Show()
    if aura_env.moveButton then aura_env.moveButton:Show() end
    if aura_env.closeButton then aura_env.closeButton:Show() end
    if aura_env.resetButton then aura_env.resetButton:Show() end

    local currentTime = GetTime()

    for i, v in ipairs(aura_env.info) do
        local bar = bars[i]
        local duration = 0
        local expiration = 0

        if v.effect == "heal" then
            duration = aura_env.buffinfo[315845].duration or 0
            expiration = aura_env.buffinfo[315845].expiration or 0
        elseif v.effect == "protect" then
            duration = aura_env.buffinfo[315849].duration or 0
            expiration = aura_env.buffinfo[315849].expiration or 0
        elseif v.effect == "aoe" then
            duration = aura_env.buffinfo[315817].duration or 0
            expiration = aura_env.buffinfo[315817].expiration or 0
        end

        bar:Show()

        local texture = "Interface\\AddOns\\" .. addonName .. "\\Icons\\Vision"
        bar.icon:SetTexture(texture)
        if not bar.icon:GetTexture() then
            bar.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        end

        local colorName = aura_env.colours[v.position]
        local pc = potionColors[colorName] or potionColors.black
        bar.icon:SetVertexColor(pc.r, pc.g, pc.b, pc.a)

        bar.text1:SetText(v.display)
        bar.text1:SetTextColor(unpack(v.colour))

        if expiration > 0 then
            bar:SetMinMaxValues(0, duration)
            bar:SetValue(expiration - currentTime)
            bar.text2:SetText(format_duration(expiration - currentTime))

            if v.effect == "heal" then
                bar.bg:SetVertexColor(unpack(defaults.colours.heal))
                bar:SetStatusBarColor(unpack(defaults.colours.heal))
            elseif v.effect == "protect" then
                bar.bg:SetVertexColor(unpack(defaults.colours.protect))
                bar:SetStatusBarColor(unpack(defaults.colours.protect))
            elseif v.effect == "aoe" then
                bar.bg:SetVertexColor(unpack(defaults.colours.aoe))
                bar:SetStatusBarColor(unpack(defaults.colours.aoe))
            end
        else
            bar:SetValue(0)
            bar.text2:SetText("")
            bar.bg:SetVertexColor(0, 0, 0, 0)
            bar:SetStatusBarColor(0, 0, 0, 0)
        end
    end
end

-- FIXED: Query specific spell IDs directly instead of iterating all unit auras with GetAuraDataByIndex
local function dynamicinfo()
    aura_env.resetinfo()

    for spellId in pairs(aura_env.buffinfo) do
        local auraData = C_UnitAuras.GetPlayerAuraBySpellID(spellId)
        if auraData then
            aura_env.buffinfo[spellId].duration = auraData.duration or 0
            aura_env.buffinfo[spellId].expiration = auraData.expirationTime or 0
        end
    end
end

local function setupPotionBars()
    local db = HorrificVisionTrackerDB or {}
    local pos = db.position or defaults.position
    frame:ClearAllPoints()
    frame:SetPoint(pos.point, pos.relativeTo or "UIParent", pos.relativePoint, pos.xOfs, pos.yOfs)

    for i = 1, 5 do
        local entry = aura_env.info[i]

        local bar = CreateFrame("StatusBar", nil, frame)
        bar:SetSize(190, 32)
        bar:SetPoint("TOP", frame, "TOP", 0, -10 - 36 * (i - 1))
        bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")

        bar.bg = bar:CreateTexture(nil, "BACKGROUND")
        bar.bg:SetAllPoints()
        bar.bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
        bar.bg:SetVertexColor(0, 0, 0, 0)

        bar.icon = bar:CreateTexture(nil, "ARTWORK")
        bar.icon:SetSize(32, 32)
        bar.icon:SetPoint("LEFT", bar, "LEFT", 0, 0)

        bar.text1 = bar:CreateFontString(nil, "OVERLAY")
        bar.text1:SetPoint("LEFT", bar.icon, "RIGHT", 6, 0)
        bar.text1:SetFont("Interface\\AddOns\\" .. addonName .. "\\front.ttf", 22)
        bar.text1:SetJustifyH("LEFT")
        bar.text1:SetText(entry.display)

        bar.text2 = bar:CreateFontString(nil, "OVERLAY")
        bar.text2:SetPoint("RIGHT", bar, "RIGHT", -2, 0)
        bar.text2:SetFont("Interface\\AddOns\\" .. addonName .. "\\front.ttf", 19)
        bar.text2:SetJustifyH("RIGHT")

        bar:EnableMouse(true)
        bar:SetScript("OnEnter", function()
            GameTooltip:SetOwner(bar, "ANCHOR_TOP")
            GameTooltip:AddLine("Potion Effect: " .. entry.display, 1, 1, 1)
            GameTooltip:Show()
        end)
        bar:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)

        bar.icon:EnableMouse(true)
        bar.icon:SetScript("OnMouseDown", function(_, button)
            if button == "LeftButton" then
                local colorName = aura_env.colours[entry.position]
                local t = aura_env.colours
                local index = 1
                for k, v in ipairs(t) do
                    if v == colorName then
                        index = k
                        break
                    end
                end
                local result = {}
                for j = index, #t do table.insert(result, t[j]) end
                for j = 1, index - 1 do table.insert(result, t[j]) end
                aura_env.colours = result
                refreshPotionBars()
            end
        end)

        bars[i] = bar
    end

    local moveButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    moveButton:SetSize(80, 22)
    moveButton:SetPoint("BOTTOMLEFT", frame, "BOTTOM", -83, 10)
    moveButton:SetText("Move")
    moveButton:RegisterForDrag("LeftButton")
    moveButton:SetScript("OnDragStart", function()
        frame:StartMoving()
    end)
    moveButton:SetScript("OnDragStop", function()
        frame:StopMovingOrSizing()
        local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint()
        if not HorrificVisionTrackerDB then
            HorrificVisionTrackerDB = {}
        end
        HorrificVisionTrackerDB.position = {
            point = point,
            relativeTo = relativeTo and relativeTo:GetName() or "UIParent",
            relativePoint = relativePoint,
            xOfs = xOfs,
            yOfs = yOfs
        }
    end)
    aura_env.moveButton = moveButton

    local resetButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    resetButton:SetSize(80, 22)
    resetButton:SetPoint("BOTTOMLEFT", frame, "BOTTOM", 3, 10)
    resetButton:SetText("Reset")
    resetButton:SetScript("OnClick", function()
        aura_env.resetinfo()
        refreshPotionBars()
    end)
    aura_env.resetButton = resetButton

    local closeButton = CreateFrame("Button", nil, frame)
    closeButton:SetSize(32, 32)
    closeButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -2, -2)
    closeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    closeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    closeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    closeButton:SetScript("OnClick", function()
        aura_env.visible = false
        if not HorrificVisionTrackerDB then
            HorrificVisionTrackerDB = {}
        end
        HorrificVisionTrackerDB.visible = false
        refreshPotionBars()
    end)
    aura_env.closeButton = closeButton
end

function aura_env.cycle(t, e)
    if t[1] == e then return t end
    local index = 1
    while index <= #t and t[index] ~= e do
        index = index + 1
    end
    if index > #t then return t end
    local x = {}
    for i = index, #t do
        table.insert(x, t[i])
    end
    for i = 1, index - 1 do
        table.insert(x, t[i])
    end
    return x
end

SLASH_HVP1 = "/hvp"
SlashCmdList["HVP"] = function(msg)
    msg = (msg or ""):lower():trim()
    if msg == "" or msg == "toggle" then
        aura_env.visible = not aura_env.visible
    elseif tContains({"black", "blue", "green", "purple", "red"}, msg) then
        aura_env.visible = true
        aura_env.colours = aura_env.cycle(aura_env.colours, msg)
    elseif tContains({"show", "init", "start"}, msg) then
        aura_env.visible = true
    elseif tContains({"hide", "stop", "none", "remove"}, msg) then
        aura_env.visible = false
    end

    if not HorrificVisionTrackerDB then
        HorrificVisionTrackerDB = {}
    end
    HorrificVisionTrackerDB.visible = aura_env.visible
    refreshPotionBars()
end

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UNIT_AURA")

frame:SetScript("OnEvent", function(self, event, arg1, ...)
    if event == "ADDON_LOADED" and arg1 == addonName then
        if not HorrificVisionTrackerDB then
            HorrificVisionTrackerDB = {}
        end
        aura_env.visible = HorrificVisionTrackerDB.visible ~= false
        aura_env.enteredworld = aura_env.visible
        setupPotionBars()
        refreshPotionBars()

    elseif event == "PLAYER_ENTERING_WORLD" then
        refreshPotionBars()

    elseif event == "UNIT_AURA" and arg1 == "player" then
        dynamicinfo()
        refreshPotionBars()
    end
end)

local elapsedSince = 0

frame:SetScript("OnUpdate", function(self, elapsed)
    if not aura_env.visible then return end

    elapsedSince = elapsedSince + elapsed
    if elapsedSince < 0.1 then return end
    elapsedSince = 0

    refreshPotionBars()
end)