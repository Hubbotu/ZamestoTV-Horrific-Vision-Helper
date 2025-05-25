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
    tile = true, tileSize = 32, edgeSize = 16,
    insets = {left = 4, right = 4, top = 4, bottom = 4}
})
frame:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
local bars = {}

-- Potion colors
local potionColors = {
    black = {r = 0.5, g = 0.5, b = 0.5, a = 1.0},
    blue = {r = 0.1, g = 0.2, b = 0.9, a = 1.0},
    green = {r = 0.1, g = 0.8, b = 0.1, a = 1.0},
    purple = {r = 0.6, g = 0.1, b = 0.9, a = 1.0},
    red = {r = 0.9, g = 0.1, b = 0.1, a = 1.0}
}

-- Utility functions
local function format_seconds(t, threshold)
    threshold = threshold or 4
    if t > threshold then
        return string.format("%.0f", t)
    else
        return string.format("|cFFFF0000%.1f|r", t)
    end
end

local function format_duration(t, threshold)
    if not t or t == 0 then return end
    if t > 3600 then
        return ceil(t/3600).."h"
    elseif t > 60 then
        return ceil(t/60).."m"
    else
        return format_seconds(t, threshold)
    end
end

-- Aura environment simulation
local aura_env = {
    hardCD = defaults.hardCD,
    softCD = defaults.softCD,
    config = defaults,
    buffinfo = {
        ["Sluggish Potion"] = {},
        ["Sickening Potion"] = {},
        ["Spicy Potion"] = {}
    },
    colours = {"black", "blue", "green", "purple", "red"},
    moveButton = nil,
    info = {
        {effect="bad", position=1, colour=defaults.colours.bad, display=defaults.effects.bad},
        {effect="good", position=3, colour=defaults.colours.good, display=defaults.effects.good},
        {effect="heal", position=2, colour=defaults.colours.heal, display=defaults.effects.heal},
        {effect="protect", position=5, colour=defaults.colours.protect, display=defaults.effects.protect},
        {effect="aoe", position=4, colour=defaults.colours.aoe, display=defaults.effects.aoe}
    },
    enteredworld = false,
    visible = false,
    format_duration = format_duration
}

-- Dynamic info for potions
local function dynamicinfo(buffs)
    aura_env.resetinfo(buffs)
    local queried = {}
    local counter = 0
    for _,_ in pairs(buffs) do counter = counter + 1 end
    for i = 1, 40 do
        local name, duration, expiration, spellid
        if C_UnitAuras and C_UnitAuras.GetAuraDataByIndex then
            local auraData = C_UnitAuras.GetAuraDataByIndex("player", i, "HELPFUL")
            if not auraData then break end
            name = auraData.name
            duration = auraData.duration
            expiration = auraData.expirationTime
            spellid = auraData.spellId
        else
            name, _, _, _, duration, expiration, _, _, _, _, spellid = UnitAura("player", i, "HELPFUL")
            if not name then break end
        end
        if buffs[name] then
            table.insert(queried, name)
            buffs[name].spellid = spellid
            buffs[name].duration = duration
            buffs[name].expiration = expiration
        end
        if #queried == counter then break end
    end
end

function aura_env.resetinfo(buffs)
    for name, _ in pairs(buffs) do
        buffs[name].duration = nil
        buffs[name].expiration = nil
    end
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
    for i = 1, index-1 do
        table.insert(x, t[i])
    end
    return x
end

-- Update functions
local function refreshPotionBars()
    if not aura_env.visible then
        for _, bar in ipairs(bars) do bar:Hide() end
        frame:Hide()
        if aura_env.moveButton then aura_env.moveButton:Hide() end
        return
    end
    frame:Show()
    if aura_env.moveButton then aura_env.moveButton:Show() end
    local buffs = aura_env.buffinfo
    for i, v in ipairs(aura_env.info) do
        local bar = bars[i]
        local duration, expiration = 0, 0
        if buffs then
            if v.effect == "heal" then
                duration = buffs["Sluggish Potion"].duration or 0
                expiration = buffs["Sluggish Potion"].expiration or 0
            elseif v.effect == "protect" then
                duration = buffs["Sickening Potion"].duration or 0
                expiration = buffs["Sickening Potion"].expiration or 0
            elseif v.effect == "aoe" then
                duration = buffs["Spicy Potion"].duration or 0
                expiration = buffs["Spicy Potion"].expiration or 0
            end
        end
        bar:Show()
        local colorName = aura_env.colours[v.position]
        local texture = "Interface\\AddOns\\ZamestoTV_VisionHelper\\Icons\\Vision"
        bar.icon:SetTexture(texture)
        if not bar.icon:GetTexture() then
            bar.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        end
        bar.icon:SetVertexColor(potionColors[colorName].r, potionColors[colorName].g, potionColors[colorName].b, potionColors[colorName].a)
        bar.text1:SetText(v.display)
        if v.effect == "bad" then
            bar.text1:SetTextColor(unpack(aura_env.config.colours.bad))
        elseif v.effect == "good" then
            bar.text1:SetTextColor(unpack(aura_env.config.colours.good))
        elseif v.effect == "heal" then
            bar.text1:SetTextColor(unpack(aura_env.config.colours.heal))
        elseif v.effect == "protect" then
            bar.text1:SetTextColor(unpack(aura_env.config.colours.protect))
        elseif v.effect == "aoe" then
            bar.text1:SetTextColor(unpack(aura_env.config.colours.aoe))
        end
        if expiration > 0 then
            bar:SetMinMaxValues(0, duration)
            bar:SetValue(expiration - GetTime())
            bar.text2:SetText(format_duration(expiration - GetTime(), 5))
        else
            bar:SetValue(0)
            bar.text2:SetText("")
        end
        if v.effect == "heal" and expiration > 0 then
            bar.bg:SetVertexColor(unpack(aura_env.config.colours.heal))
            bar:SetStatusBarColor(unpack(aura_env.config.colours.heal))
        elseif v.effect == "protect" and expiration > 0 then
            bar.bg:SetVertexColor(unpack(aura_env.config.colours.protect))
            bar:SetStatusBarColor(unpack(aura_env.config.colours.protect))
        elseif v.effect == "aoe" and expiration > 0 then
            bar.bg:SetVertexColor(unpack(aura_env.config.colours.aoe))
            bar:SetStatusBarColor(unpack(aura_env.config.colours.aoe))
        else
            bar.bg:SetVertexColor(0, 0, 0, 0)
            bar:SetStatusBarColor(1, 0, 0, 0.5)
        end
    end
end

-- UI setup for Potion Cheatsheet
local function setupPotionBars()
    frame:ClearAllPoints()
    frame:SetPoint(
        HorrificVisionTrackerDB and HorrificVisionTrackerDB.position and HorrificVisionTrackerDB.position.point or defaults.position.point,
        HorrificVisionTrackerDB and HorrificVisionTrackerDB.position and HorrificVisionTrackerDB.position.relativeTo or defaults.position.relativeTo,
        HorrificVisionTrackerDB and HorrificVisionTrackerDB.position and HorrificVisionTrackerDB.position.relativePoint or defaults.position.relativePoint,
        HorrificVisionTrackerDB and HorrificVisionTrackerDB.position and HorrificVisionTrackerDB.position.xOfs or defaults.position.xOfs,
        HorrificVisionTrackerDB and HorrificVisionTrackerDB.position and HorrificVisionTrackerDB.position.yOfs or defaults.position.yOfs
    )
    if aura_env.visible then
        frame:Show()
    else
        frame:Hide()
    end
    
    for i = 1, 5 do
        local bar = CreateFrame("StatusBar", nil, frame)
        bar:SetSize(190, 32)
        bar:SetPoint("TOP", frame, "TOP", 0, -10 - 36 * (i-1))
        bar:SetMinMaxValues(0, 1)
        bar:SetValue(0)
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
        bar.text1:SetFont("Interface\\AddOns\\"..addonName.."\\front.ttf", 22)
        bar.text2 = bar:CreateFontString(nil, "OVERLAY")
        bar.text2:SetPoint("RIGHT", bar, "RIGHT", -2, 0)
        bar.text2:SetFont("Interface\\AddOns\\"..addonName.."\\front.ttf", 19)
        
        bar:EnableMouse(true)
        bar:SetScript("OnEnter", function(self)
            local effect = aura_env.info[i].effect
            local display = aura_env.info[i].display
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:AddLine("Potion Effect: " .. display, 1, 1, 1)
            GameTooltip:Show()
        end)
        bar:SetScript("OnLeave", function(self)
            GameTooltip:Hide()
        end)
        
        -- Add click handler for potion rotation
        bar.icon:EnableMouse(true)
        bar.icon:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                local colorName = aura_env.colours[aura_env.info[i].position]
                if tContains({"black", "blue", "green", "purple", "red"}, colorName) then
                    aura_env.visible = true
                    aura_env.enteredworld = true
                    aura_env.colours = aura_env.cycle(aura_env.colours, colorName)
                    if not HorrificVisionTrackerDB then
                        HorrificVisionTrackerDB = {}
                    end
                    HorrificVisionTrackerDB.visible = true
                    refreshPotionBars()
                end
            end
        end)
        
        bars[i] = bar
    end
    
    -- Create Move button
    local moveButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    moveButton:SetSize(80, 22)
    moveButton:SetPoint("BOTTOM", frame, "BOTTOM", 0, 10)
    moveButton:SetText("Move")
    moveButton:SetNormalFontObject("GameFontNormal")
    moveButton:RegisterForDrag("LeftButton")
    moveButton:SetScript("OnDragStart", function(self)
        if frame:IsMovable() then
            frame:StartMoving()
        end
    end)
    moveButton:SetScript("OnDragStop", function(self)
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
end

-- Slash command for hide/show
SLASH_HVP1 = "/hvp"
SlashCmdList["HVP"] = function()
    if not HorrificVisionTrackerDB then
        HorrificVisionTrackerDB = {}
    end
    aura_env.visible = not aura_env.visible
    HorrificVisionTrackerDB.visible = aura_env.visible
    aura_env.enteredworld = aura_env.visible
    refreshPotionBars()
end

-- Event handling
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UNIT_AURA")
frame:RegisterEvent("CHAT_MSG_CHANNEL")
frame:RegisterEvent("CHAT_MSG_PARTY")
frame:RegisterEvent("CHAT_MSG_PARTY_LEADER")
frame:RegisterEvent("CHAT_MSG_GUILD")
frame:RegisterEvent("CHAT_MSG_INSTANCE_CHAT")
frame:RegisterEvent("CHAT_MSG_INSTANCE_CHAT_LEADER")
frame:RegisterEvent("CHAT_MSG_OFFICER")
frame:RegisterEvent("CHAT_MSG_RAID")
frame:RegisterEvent("CHAT_MSG_RAID_LEADER")
frame:RegisterEvent("CHAT_MSG_RAID_WARNING")
frame:RegisterEvent("CHAT_MSG_SAY")
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:RegisterEvent("CHAT_MSG_YELL")

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and ... == addonName then
        -- Initialize SavedVariables
        if not HorrificVisionTrackerDB then
            HorrificVisionTrackerDB = {}
        end
        -- Load visibility state, default to false (hidden) if not set
        aura_env.visible = HorrificVisionTrackerDB.visible ~= nil and HorrificVisionTrackerDB.visible or false
        aura_env.enteredworld = aura_env.visible
        -- Save initial visibility state
        HorrificVisionTrackerDB.visible = aura_env.visible
        setupPotionBars()
        refreshPotionBars()
    elseif event == "PLAYER_ENTERING_WORLD" then
        if aura_env.visible then
            refreshPotionBars()
        end
    elseif event == "UNIT_AURA" and ... == "player" then
        if not aura_env.enteredworld then return end
        dynamicinfo(aura_env.buffinfo)
        local playerbuffs = false
        for _, v in pairs(aura_env.buffinfo) do
            playerbuffs = playerbuffs or v.duration ~= nil
        end
        if playerbuffs then
            refreshPotionBars()
        end
    elseif string.match(event, "CHAT_MSG_") then
        local msg = ...
        if tContains({"black", "blue", "green", "purple", "red", "show", "init", "start", "none", "stop", "remove", "hide"}, msg) then
            if not HorrificVisionTrackerDB then
                HorrificVisionTrackerDB = {}
            end
            if tContains({"black", "blue", "green", "purple", "red"}, msg) then
                aura_env.visible = true
                aura_env.enteredworld = true
                aura_env.colours = aura_env.cycle(aura_env.colours, msg)
                HorrificVisionTrackerDB.visible = true
                refreshPotionBars()
            elseif tContains({"show", "init", "start"}, msg) then
                aura_env.visible = true
                aura_env.enteredworld = true
                aura_env.colours = aura_env.cycle(aura_env.colours, "black")
                aura_env.resetinfo(aura_env.buffinfo)
                HorrificVisionTrackerDB.visible = true
                refreshPotionBars()
            elseif tContains({"none", "stop", "remove", "hide"}, msg) then
                aura_env.visible = false
                aura_env.enteredworld = false
                HorrificVisionTrackerDB.visible = false
                refreshPotionBars()
            end
        end
    end
end)