-- Define SavedVariables
AVNS_SavedVars = {}

-- Create the settings frame
local frame = CreateFrame("Frame", "AVNS_SettingsFrame", UIParent)
frame:SetSize(230, 200)
frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    -- Save position
    local point, _, relativePoint, xOfs, yOfs = self:GetPoint()
    AVNS_SavedVars.point = point
    AVNS_SavedVars.relativePoint = relativePoint
    AVNS_SavedVars.xOfs = xOfs
    AVNS_SavedVars.yOfs = yOfs
end)
frame:Hide() -- Hide frame by default at creation

-- Set background texture
local bg = frame:CreateTexture(nil, "BACKGROUND")
bg:SetTexture("Interface\\Buttons\\WHITE8X8")
bg:SetVertexColor(0.1, 0.1, 0.1, 0.8) -- Dark gray with slight transparency
bg:SetPoint("TOPLEFT", 4, -4)
bg:SetPoint("BOTTOMRIGHT", -4, 4)

-- Add close button
local closeButton = CreateFrame("Button", "AVNS_SettingsCloseButton", frame, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
closeButton:SetScript("OnClick", function()
    frame:Hide()
    AVNS_SavedVars.isShown = false
end)

-- Set frame title
frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.title:SetPoint("TOP", frame, "TOP", 0, -5)
frame.title:SetFont("Fonts\\Arial.TTF", 16, "OUTLINE")
frame.title:SetTextColor(1, 1, 1, 1)
frame.title:SetText("Settings Vision Helper")

-- Add Potions 1 inscription
frame.potionsText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.potionsText:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -40)
frame.potionsText:SetFont("Fonts\\Arial.TTF", 16, "OUTLINE")
frame.potionsText:SetTextColor(1, 1, 1, 1)
frame.potionsText:SetText("Potions 1")

-- Add Potions 2 inscription
frame.potionsText2 = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.potionsText2:SetPoint("LEFT", frame.potionsText, "RIGHT", 20, 0)
frame.potionsText2:SetFont("Fonts\\Arial.TTF", 16, "OUTLINE")
frame.potionsText2:SetTextColor(1, 1, 1, 1)
frame.potionsText2:SetText("Potions 2")

-- Create S/H button for /vision (below Potions 1)
local button = CreateFrame("Button", "AVNS_SettingsButton", frame, "UIPanelButtonTemplate")
button:SetSize(60, 25)
button:SetPoint("TOPLEFT", frame.potionsText, "BOTTOMLEFT", 0, -10)
button:SetText("S/H")

-- Style button text
button.text = button:GetFontString()
button.text:SetFont("Fonts\\Arial.TTF", 14, "OUTLINE")
button.text:SetTextColor(1, 1, 1, 1)

-- Add tooltip to the /vision button
button:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("Hide/Show\nToggles visibility using /vision")
    GameTooltip:Show()
end)
button:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Button click to run /vision command
button:SetScript("OnClick", function()
    if SlashCmdList and SlashCmdList["HVT"] then
        SlashCmdList["HVT"]("")
    else
        print("Error: /vision command not found. Ensure ZamestoTV_VisionHelper is enabled.")
    end
end)

-- Create S/H button for /hvp (below Potions 2)
local button2 = CreateFrame("Button", "AVNS_SettingsButton_HVP", frame, "UIPanelButtonTemplate")
button2:SetSize(60, 25)
button2:SetPoint("TOPLEFT", frame.potionsText2, "BOTTOMLEFT", 0, -10)
button2:SetText("S/H")

-- Style button text
button2.text = button2:GetFontString()
button2.text:SetFont("Fonts\\Arial.TTF", 14, "OUTLINE")
button2.text:SetTextColor(1, 1, 1, 1)

-- Add tooltip to the /hvp button
button2:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("Hide/Show\nToggles visibility using /hvp")
    GameTooltip:Show()
end)
button2:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Button click to run /hvp command
button2:SetScript("OnClick", function()
    if SlashCmdList and SlashCmdList["HVP"] then
        SlashCmdList["HVP"]("")
    else
        print("Error: /hvp command not found. Ensure the addon defining /hvp is enabled.")
    end
end)

-- Add demarcation line
local line = frame:CreateTexture(nil, "BORDER")
line:SetTexture("Interface\\Buttons\\WHITE8X8")
line:SetVertexColor(1, 1, 1, 0.5) -- White with transparency
line:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -95)
line:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -95)
line:SetHeight(1)

-- Add Chests and Crystals inscription
frame.chestsText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.chestsText:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -105)
frame.chestsText:SetFont("Fonts\\Arial.TTF", 16, "OUTLINE")
frame.chestsText:SetTextColor(1, 1, 1, 1)
frame.chestsText:SetText("Chests and Crystals:")

-- Create Storm button
local stormButton = CreateFrame("Button", "AVNS_StormButton", frame, "UIPanelButtonTemplate")
stormButton:SetSize(60, 25)
stormButton:SetPoint("TOPLEFT", frame.chestsText, "BOTTOMLEFT", 0, -10)
stormButton:SetText("Storm")

-- Style button text
stormButton.text = stormButton:GetFontString()
stormButton.text:SetFont("Fonts\\Arial.TTF", 14, "OUTLINE")
stormButton.text:SetTextColor(1, 1, 1, 1)

-- Add tooltip to the Storm button
stormButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("show Stormwind frame")
    GameTooltip:Show()
end)
stormButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Button click to run /zstorm command
stormButton:SetScript("OnClick", function()
    if SlashCmdList and SlashCmdList["ZSTORM"] then
        SlashCmdList["ZSTORM"]("")
    else
        print("Error: /zstorm command not found. Ensure the addon defining /zstorm is enabled.")
    end
end)

-- Create Orgri button
local orgriButton = CreateFrame("Button", "AVNS_OrgriButton", frame, "UIPanelButtonTemplate")
orgriButton:SetSize(60, 25)
orgriButton:SetPoint("LEFT", stormButton, "RIGHT", 5, 0)
orgriButton:SetText("Orgri")

-- Style button text
orgriButton.text = orgriButton:GetFontString()
orgriButton.text:SetFont("Fonts\\Arial.TTF", 14, "OUTLINE")
orgriButton.text:SetTextColor(1, 1, 1, 1)

-- Add tooltip to the Orgri button
orgriButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("show Orgrimmar frame")
    GameTooltip:Show()
end)
orgriButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Button click to run /zorgri command
orgriButton:SetScript("OnClick", function()
    if SlashCmdList and SlashCmdList["ZORGRI"] then
        SlashCmdList["ZORGRI"]("")
    else
        print("Error: /zorgri command not found. Ensure the addon defining /zorgri is enabled.")
    end
end)

-- Create Hide button
local hideButton = CreateFrame("Button", "AVNS_HideButton", frame, "UIPanelButtonTemplate")
hideButton:SetSize(60, 25)
hideButton:SetPoint("LEFT", orgriButton, "RIGHT", 5, 0)
hideButton:SetText("Hide")

-- Style button text
hideButton.text = hideButton:GetFontString()
hideButton.text:SetFont("Fonts\\Arial.TTF", 14, "OUTLINE")
hideButton.text:SetTextColor(1, 1, 1, 1)

-- Add tooltip to the Hide button
hideButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("hide")
    GameTooltip:Show()
end)
hideButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)

-- Button click to run /zhide command
hideButton:SetScript("OnClick", function()
    if SlashCmdList and SlashCmdList["ZHIDE"] then
        SlashCmdList["ZHIDE"]("")
    else
        print("Error: /zhide command not found. Ensure the addon defining /zhide is enabled.")
    end
end)

-- Add demarcation line below Chests and Crystals buttons
local line2 = frame:CreateTexture(nil, "BORDER")
line2:SetTexture("Interface\\Buttons\\WHITE8X8")
line2:SetVertexColor(1, 1, 1, 0.5) -- White with transparency
line2:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -155)
line2:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -155)
line2:SetHeight(1)

-- Add Masks Equipped inscription
frame.masksText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
frame.masksText:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -165)
frame.masksText:SetFont("Fonts\\Arial.TTF", 16, "OUTLINE")
frame.masksText:SetTextColor(1, 1, 1, 1)
frame.masksText:SetText("Masks Equipped: 0")

-- Config for mask checking
local MASK_AURA_ID = 313471
local ZONE_ID = {2403, 2404}

-- Utility: Check current map
local function IsInTargetZone()
    local mapID = C_Map.GetBestMapForUnit("player")
    return mapID == ZONE_ID[1] or mapID == ZONE_ID[2]
end

-- Find aura index by spell ID
local function GetAuraIndexBySpellID(spellID)
    for i = 1, 40 do
        local aura = C_UnitAuras.GetAuraDataByIndex("player", i, "HARMFUL")
        if not aura then break end
        if aura.spellId == spellID then
            return i
        end
    end
    return nil
end

-- Concatenate full tooltip text and extract percent
local function ExtractMaskCountFromTooltip(index)
    if not index then return 0 end

    GameTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
    GameTooltip:ClearLines()
    GameTooltip:SetUnitAura("player", index, "HARMFUL")

    local fullText = ""
    for i = 1, GameTooltip:NumLines() do
        local line = _G["GameTooltipTextLeft" .. i]
        if line then
            local txt = line:GetText()
            if txt then
                fullText = fullText .. " " .. txt
            end
        end
    end

    -- Match "increased by XX%" and convert
    local match = string.match(fullText, "increased by%s*(%d+)%%")
    if match then
        local percent = tonumber(match)
        if percent then
            return math.floor(percent / 25)
        end
    end

    return 0
end

-- Update Masks Count display
local function UpdateMasksDisplay()
    if not frame:IsShown() or not IsInTargetZone() then
        frame.masksText:SetText("Masks Equipped: 0")
        return
    end

    local auraIndex = GetAuraIndexBySpellID(MASK_AURA_ID)
    if auraIndex then
        local maskCount = ExtractMaskCountFromTooltip(auraIndex)
        frame.masksText:SetText("Masks Equipped: " .. tostring(maskCount))
    else
        frame.masksText:SetText("Masks Equipped: 0")
    end
end

-- Event listener for mask count updates and SavedVariables
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("UNIT_AURA")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and select(1, ...) == "AVNS_Settings" then
        -- Initialize SavedVariables if nil
        if not AVNS_SavedVars then
            AVNS_SavedVars = {
                point = "CENTER",
                relativePoint = "CENTER",
                xOfs = 0,
                yOfs = 0,
                isShown = false
            }
        end
        
        -- Restore position
        if AVNS_SavedVars.point then
            self:ClearAllPoints()
            self:SetPoint(AVNS_SavedVars.point, UIParent, AVNS_SavedVars.relativePoint, AVNS_SavedVars.xOfs, AVNS_SavedVars.yOfs)
        end
        
        -- Restore visibility
        if AVNS_SavedVars.isShown then
            self:Show()
            UpdateMasksDisplay()
        else
            self:Hide()
        end
    elseif event == "UNIT_AURA" then
        local unit = ...
        if unit ~= "player" then return end
        C_Timer.After(0.1, UpdateMasksDisplay)
    elseif event == "ZONE_CHANGED_NEW_AREA" or event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_LOGIN" then
        C_Timer.After(0.1, UpdateMasksDisplay)
    end
end)

-- Slash command to toggle frame
SLASH_AVNS1 = "/avns"
SlashCmdList["AVNS"] = function()
    if frame:IsShown() then
        frame:Hide()
        AVNS_SavedVars.isShown = false
    else
        frame:Show()
        AVNS_SavedVars.isShown = true
        UpdateMasksDisplay() -- Update mask count when shown
    end
end
