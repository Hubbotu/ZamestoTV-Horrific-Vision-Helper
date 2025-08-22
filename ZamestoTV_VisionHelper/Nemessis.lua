local ADDON_NAME = ...
local NemesisAvoid = CreateFrame("Frame")
NemesisAvoid:RegisterEvent("NAME_PLATE_UNIT_ADDED")
NemesisAvoid:RegisterEvent("PLAYER_ENTERING_WORLD")
NemesisAvoid:SetScript("OnEvent", function(self, event, ...)
    if event == "NAME_PLATE_UNIT_ADDED" then
        local unit = ...
        NemesisAvoid:CheckNPC(unit)
    elseif event == "PLAYER_ENTERING_WORLD" then
        local zoneID = C_Map.GetBestMapForUnit("player")
        NemesisAvoid.enabled = (zoneID == 2403 or zoneID == 2404)
    end
end)

NemesisAvoid.npcIDs = {
    [240672] = true,
    [241698] = true,
    [239437] = true
}

-- IDs to mute (voice lines)
local mutedSoundIDs = {
    897324, 897302, 897306, 897300
}

function NemesisAvoid:CheckNPC(unit)
    if not self.enabled then return end
    if not UnitIsEnemy("player", unit) then return end

    local guid = UnitGUID(unit)
    if not guid then return end

    local _, _, _, _, _, npcID = strsplit("-", guid)
    npcID = tonumber(npcID)

    if npcID and self.npcIDs[npcID] then
        self:CreateIcon(unit)
        PlaySound(67187)
    end
end

function NemesisAvoid:CreateIcon(unit)
    local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
    if not nameplate or nameplate.NemesisIcon then return end

    local frame = CreateFrame("Frame", nil, nameplate)
    frame:SetSize(64, 64)
    frame:SetPoint("BOTTOM", nameplate, "TOP", 0, -16)

    local ring = frame:CreateTexture(nil, "OVERLAY")
    ring:SetTexture("Interface\\AddOns\\ZamestoTV_VisionHelper\\Icons\\Ring1.tga")
    ring:SetAllPoints()
    ring:SetVertexColor(1, 0.12, 0.23, 1)

    local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLargeOutline")
    text:SetText("Kill")
    text:SetPoint("CENTER")
    text:SetTextColor(1, 1, 1, 1)

    nameplate.NemesisIcon = frame

    C_Timer.After(20, function()
        if nameplate.NemesisIcon then
            nameplate.NemesisIcon:Hide()
            nameplate.NemesisIcon = nil
        end
    end)
end

-- Mute voices if desired
local function MuteNPCSounds()
    if not NemesisConfig or not NemesisConfig.isMuted then return end
    for _, soundID in ipairs(mutedSoundIDs) do
        MuteSoundFile(soundID)
    end
end

local function UnmuteNPCSounds()
    for _, soundID in ipairs(mutedSoundIDs) do
        UnmuteSoundFile(soundID)
    end
end

-- Add slash command to toggle mute
SLASH_NEMESISAVOID1 = "/nemesis"
SlashCmdList["NEMESISAVOID"] = function(msg)
    
    NemesisConfig.isMuted = not NemesisConfig.isMuted
    print("Nemesis sound mute is now:", NemesisConfig.isMuted and "ON" or "OFF")
    if NemesisConfig.isMuted then
        MuteNPCSounds()
    else
        UnmuteNPCSounds()
    end
end

-- Apply mute on load if needed
C_Timer.After(20, function()
    if not NemesisConfig then NemesisConfig = {} end
    if NemesisConfig.isMuted then
        MuteNPCSounds()
    end
end)
