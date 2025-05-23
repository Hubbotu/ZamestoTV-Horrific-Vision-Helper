local addonName, addon = ...
local HVT = addon

-- Frame creation
HVT.frame = CreateFrame("Frame", "HorrificVisionsTrackerFrame", UIParent)
HVT.frame:SetPoint("CENTER", UIParent, "CENTER", -200, -300)
HVT.frame:SetSize(600, 400)
HVT.frame:SetMovable(true)
HVT.frame:SetFrameStrata("HIGH") -- Ensure frame is not obscured
HVT.frame:Hide() -- Hide by default

-- Saved Variables
HVTDB = HVTDB or { isFrameVisible = false }

-- Drag Handle
HVT.dragHandle = CreateFrame("Button", "HVT_DragHandle", HVT.frame)
HVT.dragHandle:SetSize(30, 30)
HVT.dragHandle:SetPoint("CENTER", HVT.frame, "CENTER", -593, 160) -- Adjusted to be slightly left of "Black"
HVT.dragHandle:SetNormalTexture("Interface\\buttons\\ui-sliderbar-button-horizontal.blp")
HVT.dragHandle:SetHighlightTexture("Interface\\buttons\\UI-Common-MouseHilight")
HVT.dragHandle:EnableMouse(true)
HVT.dragHandle:RegisterForDrag("LeftButton")
HVT.dragHandle:SetFrameStrata("HIGH") -- Ensure drag handle is clickable

HVT.dragHandle:SetScript("OnDragStart", function(self)
    if HVT.frame:IsMovable() then
        print("Starting to move HVT frame")
        HVT.frame:StartMoving()
    else
        print("Error: HVT frame is not movable")
    end
end)

HVT.dragHandle:SetScript("OnDragStop", function(self)
    print("Stopped moving HVT frame")
    HVT.frame:StopMovingOrSizing()
    local point, _, relativePoint, xOfs, yOfs = HVT.frame:GetPoint()
    if point and relativePoint then
        HVTDB.point = point
        HVTDB.relativePoint = relativePoint
        HVTDB.xOfs = HVT:Round(xOfs, 2)
        HVTDB.yOfs = HVT:Round(yOfs, 2)
        print("Saved position: ", point, relativePoint, xOfs, yOfs)
    else
        print("Error: Failed to save position")
    end
end)

-- Buffs and Data
HVT.buffs = {
    ["Spicy Potion(Fire Breath)"] = { spellId = 315817, x = -638.17, y = 125.50, label = "Breath", color = {1, 0.37, 0, 1} },
    ["Sickening Potion(Defensive)"] = { spellId = 315849, x = -638.17, y = 75.50, label = "Def", color = {0.43, 0.27, 0.17, 1} },
    ["Sluggish Potion(Heal)"] = { spellIds = {315845, 316100}, x = -638.17, y = 25.50, label = "Heal", color = {0.10, 1, 0, 1} },
    ["Cheat Death"] = { spellIds = {304816, 317865}, x = -430, y = 130, text = "I'm already dead." },
    ["Gift of the Titans"] = { spellId = 313698, x = -490.58, y = 110.42 }
}
HVT.sanityReduction = 0
HVT.tickCache = {}
HVT.ticks = 1
HVT.lastPower = nil
HVT.lostToHits = 0
HVT.lastBigHit = 0
HVT.remainingTime = "N/A"
HVT.giftExpiration = 0

-- Localization
HVT.locale = GetLocale()
HVT.kind = HVT.locale == "zhCN" and {
    "|cff6A84BC毒药|r",      -- Poison
    "|cffFFFFFF龙息|r",      -- Breath Fire
    "|cffFFFFFF回血|r",      -- Healing
    "|cffFFFFFF减伤|r",      -- Defensive
    "|cffF0FF00理智|r"       -- Sanity
} or HVT.locale == "ruRU" and {
    "|cff6A84BCЯд|r",        -- Poison
    "|cffFF7373Огн. дыхание|r", -- Breath Fire
    "|cffFFAA6CИсцеление|r",  -- Healing
    "|cff6CFFFDЗащита|r",     -- Defensive
    "|cffF0FF00Рассудок|r"    -- Sanity
} or HVT.locale == "ptBR" and {
    "|cff6A84BCVeneno|r", -- Poison
    "|cffFF7373Sopro de fogo|r", -- Breath Fire
    "|cffFFAA6CCura|r", -- Healing
    "|cff6CFFFDDefensivo|r", -- Defensive
    "|cffF0FF00Sanidade|r" -- Sanity
} or HVT.locale == "frFR" and {
    "|cff6A84BCPoison|r", -- Poison
    "|cffFF7373Cracher du feu|r", -- Breath Fire
    "|cffFFAA6CSoin|r", -- Healing
    "|cff6CFFFDDéfensif|r", -- Defensive
    "|cffF0FF00Santé mentale|r" -- Sanity
} or {
    "|cff6A84BCPoison|r", -- Poison
    "|cffFF7373Breath Fire|r", -- Breath Fire
    "|cffFFAA6CHealing|r", -- Healing
    "|cff6CFFFDDefensive|r", -- Defensive
    "|cffF0FF00Sanity|r" -- Sanity
}
HVT.colors = {
    ["Black"] = {0.42, 0.42, 0.42, 1},   -- Gray
    ["Green"] = {0.24, 0.79, 0.06, 1},   -- Green
    ["Red"] = {0.95, 0.02, 0.04, 1},     -- Red
    ["Blue"] = {0, 0.36, 1, 1},          -- Blue
    ["Purple"] = {0.74, 0, 1, 1}         -- Purple
}

-- CHANGED: UI Strings Localization with format strings
HVT.strings = HVT.locale == "ruRU" and {
    ["Time left"] = "Оставшееся время: %s",
    ["Sanity"] = "Рассудок: %d",
    ["Sanity loss from hits"] = "Потеря рассудка от ударов: %d",
    ["Black"] = "Чёрный",
    ["Green"] = "Зелёный",
    ["Red"] = "Красный",
    ["Blue"] = "Синий",
    ["Purple"] = "Фиолетовый",
    ["Time left initial"] = "Оставшееся время: Н/Д",
    ["Sanity initial"] = "Рассудок: 0",
    ["Sanity loss from hits initial"] = "Потеря рассудка от ударов: 0"
} or HVT.locale == "ptBR" and  {
    ["Time left"] = "Tempo Restante: %s",
    ["Sanity"] = "Sanidade: %d",
    ["Sanity loss from hits"] = "Perda de sanidade por acertos: %d",
    ["Black"] = "Preto",
    ["Green"] = "Verde",
    ["Red"] = "Vermelho",
    ["Blue"] = "Azul",
    ["Purple"] = "Roxo",
    ["Time left initial"] = "Tempo restante: N/A",
    ["Sanity initial"] = "Sanidade: 0",
    ["Sanity loss from hits initial"] = "Perda de sanidade por acertos: 0" 
} or HVT.locale == "frFR" and  {
    ["Time left"] = "Temps restant : %s",
    ["Sanity"] = "Santé mentale : %d",
    ["Sanity loss from hits"] = "Santé mentale perdue suite aux coups : %d",
    ["Black"] = "Noire",
    ["Green"] = "Verte",
    ["Red"] = "Rouge",
    ["Blue"] = "Bleue",
    ["Purple"] = "Violette",
    ["Time left initial"] = "Temps restant : N/A",
    ["Sanity initial"] = "Santé mentale : 0",
    ["Sanity loss from hits initial"] = "Santé mentale perdue suite aux coups : 0"
} or HVT.locale == "zhCN" and  {
    ["Time left"] = "剩余时间：%s",
    ["Sanity"] = "理智: %d",
    ["Sanity loss from hits"] = "理智损失（受攻击）: %d",
    ["Black"] = "黑色",
    ["Green"] = "绿色",
    ["Red"] = "红色",
    ["Blue"] = "蓝色",
    ["Purple"] = "紫色",
    ["Time left initial"] = "剩余时间: N/A",
    ["Sanity initial"] = "理智: 0",
    ["Sanity loss from hits initial"] = "理智损失（受攻击）: 0"   
} or {
    ["Time left"] = "Time left: %s",
    ["Sanity"] = "Sanity: %d",
    ["Sanity loss from hits"] = "Sanity loss from hits: %d",
    ["Black"] = "Black",
    ["Green"] = "Green",
    ["Red"] = "Red",
    ["Blue"] = "Blue",
    ["Purple"] = "Purple",
    ["Time left initial"] = "Time left: N/A",
    ["Sanity initial"] = "Sanity: 0",
    ["Sanity loss from hits initial"] = "Sanity loss from hits: 0"
}

-- Utility Functions
function HVT:SecondsToClock(seconds)
    local secs = tonumber(seconds)
    if secs <= 0 then return "00:00" end
    local mins = string.format("%02.f", math.floor(secs / 60))
    local secs = string.format("%02.f", math.floor(secs - mins * 60))
    return mins .. ":" .. secs
end

function HVT:Round(num, decimalPlaces)
    local mult = 10^(decimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function HVT:GetItemSplit(itemLink)
    local itemString = string.match(itemLink, "item:([%-?%d:]+)")
    local itemSplit = {}
    for _, v in ipairs({strsplit(":", itemString)}) do
        itemSplit[#itemSplit + 1] = v == "" and 0 or tonumber(v)
    end
    return itemSplit
end

function HVT:GetCloakResistance()
    local itemLink = GetInventoryItemLink("player", 15)
    if itemLink then
        local itemSplit = HVT:GetItemSplit(itemLink)
        local bonuses = {}
        for i = 1, itemSplit[13] do
            bonuses[#bonuses + 1] = itemSplit[13 + i]
        end
        local sanityFromCloak = {
            [6272]=0.20, [6273]=0.20, [6274]=0.25, [6275]=0.25, [6276]=0.40, [6277]=0.40,
            [6278]=0.40, [6279]=0.45, [6280]=0.45, [6281]=0.50, [6282]=0.65, [6283]=0.65,
            [6284]=0.70, [6285]=0.75, [6286]=0.80, [6577]=0.80, [6580]=0.80, [6581]=0.80,
            [6582]=0.80, [6583]=0.80, [6584]=0.80, [6585]=0.80, [6586]=0.80, [6587]=0.80,
            [6288]=0.80, [6589]=0.80, [6590]=0.80, [6591]=0.80, [6592]=0.80, [6593]=0.80,
            [6594]=0.80, [6595]=0.80, [6596]=0.80, [6597]=0.80, [6598]=0.80, [6599]=0.80,
            [6600]=0.80, [6601]=0.80, [6602]=0.80, [6603]=0.80
        }
        for _, bonus in pairs(bonuses) do
            if sanityFromCloak[bonus] then return sanityFromCloak[bonus] end
        end
    end
    return 0
end

function HVT:GetEffectiveDrain(diff)
    local realDrain = diff / (1 - HVT.sanityReduction)
    local possibleDrainLevels = {6, 8, 12}
    local minDiff, closestLevel = math.huge, 5
    for _, level in ipairs(possibleDrainLevels) do
        local drainDiff = math.abs(realDrain - level)
        if drainDiff < minDiff then
            minDiff = drainDiff
            closestLevel = level
        end
    end
    return closestLevel * (1 - HVT.sanityReduction)
end

function HVT:GetCacheAverage()
    local sum, totalTicks = 0, 0
    for _, tick in pairs(HVT.tickCache) do
        if tick and tick > 0 then sum = sum + tick end
        totalTicks = totalTicks + 1
    end
    return totalTicks > 0 and sum / totalTicks or 0
end

function HVT:ResetCache()
    HVT.tickCache = {}
end

function HVT:Reset()
    HVT.lastBigHit = 0
    HVT.lostToHits = 0
    HVT.remainingTime = "N/A"
    HVT.sanityReduction = HVT:GetCloakResistance()
    HVT:ResetCache()
    HVT.ticks = 1
    HVT.giftExpiration = 0
end

-- UI Elements
HVT.frames = {}
function HVT:CreateIcon(id, data)
    local f = CreateFrame("Frame", "HVT_" .. id, HVT.frame)
    f:SetSize(49, 49)
    f:SetPoint("CENTER", HVT.frame, "CENTER", data.x, data.y)
    
    local texture = f:CreateTexture(nil, "ARTWORK")
    texture:SetAllPoints(f)
    f.texture = texture
    
    local cooldown = CreateFrame("Cooldown", nil, f, "CooldownFrameTemplate")
    cooldown:SetAllPoints(f)
    f.cooldown = cooldown
    
    local glow = f:CreateTexture(nil, "OVERLAY")
    glow:SetTexture("Interface\\Buttons\\UI-Quickslot-Depress")
    glow:SetAllPoints(f)
    glow:SetBlendMode("ADD")
    glow:Hide()
    f.glow = glow
    
    local label = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("BOTTOM", f, "BOTTOM", 0, -4)
    label:SetFont("Fonts\\Arial.TTF", 16, "OUTLINE")
    label:SetTextColor(unpack(data.color or {1, 1, 1, 1}))
    label:SetText(data.label or "")
    f.label = label
    
    f:Hide()
    HVT.frames[id] = f
end

function HVT:CreateText(id, x, y, text, size, color)
    local f = HVT.frame:CreateFontString("HVT_" .. id, "OVERLAY", "GameFontNormal")
    f:SetPoint("LEFT", HVT.frame, "CENTER", x, y)
    f:SetFont("Fonts\\Arial.TTF", size or 16, "OUTLINE")
    f:SetTextColor(unpack(color or {1, 1, 1, 1}))
    f:SetText(text)
    HVT.frames[id] = f
end

function HVT:HandleOrgColor(id)
    local mappings = {
        ["Black"] = { [1]=1, [2]=2, [3]=3, [4]=4, [5]=5 }, -- Poison, Breath Fire, Healing, Defensive, Sanity
        ["Green"] = { [1]=5, [2]=1, [3]=2, [4]=3, [5]=4 }, -- Sanity, Poison, Breath Fire, Healing, Defensive
        ["Red"] = { [1]=4, [2]=5, [3]=1, [4]=2, [5]=3 },   -- Defensive, Sanity, Poison, Breath Fire, Healing
        ["Blue"] = { [1]=3, [2]=4, [3]=5, [4]=1, [5]=2 },  -- Healing, Defensive, Sanity, Poison, Breath Fire
        ["Purple"] = { [1]=2, [2]=3, [3]=4, [4]=5, [5]=1 } -- Breath Fire, Healing, Defensive, Sanity, Poison
    }
    for buttonId, map in pairs(mappings) do
        local textIdx = map[id]
        local newText = HVT.kind[textIdx]
        HVT.frames[buttonId].text:SetText(newText)
        -- Display the clicked button's new text as a prompt
        if buttonId == ({[1]="Black", [2]="Green", [3]="Red", [4]="Blue", [5]="Purple"})[id] then
            print(newText:gsub("|c........(.-)|r", "%1")) -- Strip color codes for chat
        end
    end
end

function HVT:CreateColorButton(id, x, y)
    local f = CreateFrame("Button", "HVT_" .. id, HVT.frame)
    f:SetSize(80, 25)
    f:SetPoint("CENTER", HVT.frame, "CENTER", x, y)
    
    local texture = f:CreateTexture(nil, "BACKGROUND")
    texture:SetAllPoints(f)
    texture:SetTexture("Interface\\Buttons\\WHITE8X8")
    texture:SetVertexColor(unpack(HVT.colors[id]))
    f.texture = texture
    
    local text = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    text:SetPoint("LEFT", f, "LEFT", 0, 0)
    text:SetFont("Fonts\\Arial.TTF", 17, "OUTLINE")
    text:SetTextColor(1, 1, 1, 1)
    text:SetText(HVT.strings[id])
    f.text = text
    
    f:SetScript("OnEnter", function(self)
        if not self.highlight then
            self.highlight = self:CreateTexture(nil, "OVERLAY")
            self.highlight:SetTexture("Interface\\QuestFrame\\UI-QuestLogTitleHighlight")
            self.highlight:SetBlendMode("ADD")
            self.highlight:SetAllPoints(self)
            self.highlight:SetAlpha(0.4)
        end
        self.highlight:Show()
    end)
    f:SetScript("OnLeave", function(self)
        if self.highlight then self.highlight:Hide() end
    end)
    f:SetScript("OnClick", function() 
        local orgColorId = ({["Black"]=1, ["Green"]=2, ["Red"]=3, ["Blue"]=4, ["Purple"]=5})[id]
        HVT:HandleOrgColor(orgColorId)
    end)
    
    HVT.frames[id] = f
end

-- Initialize UI
for id, data in pairs(HVT.buffs) do
    if id ~= "Cheat Death" and id ~= "Gift of the Titans" then
        HVT:CreateIcon(id, data)
    elseif id == "Cheat Death" then
        HVT:CreateText(id, data.x, data.y, "Cheat death used!", 23, {1, 0, 0.02, 1})
        HVT.frames[id]:Hide()
    elseif id == "Gift of the Titans" then
        HVT:CreateIcon(id, {x = data.x, y = data.y})
    end
end
-- CHANGED: Use initial localized strings
HVT:CreateText("Sanity", -530, 39, HVT.strings["Sanity initial"], 16)
HVT:CreateText("Time left", -530, 23, HVT.strings["Time left initial"], 16)
HVT:CreateText("Sanity loss from hits", -530, 6, HVT.strings["Sanity loss from hits initial"], 16)
HVT:CreateColorButton("Black", -573, 137)
HVT:CreateColorButton("Green", -573, 106)
HVT:CreateColorButton("Red", -573, 75)
HVT:CreateColorButton("Blue", -573, 44)
HVT:CreateColorButton("Purple", -573, 13)

-- Event Handling
HVT.frame:RegisterEvent("ADDON_LOADED")
HVT.frame:RegisterEvent("UNIT_POWER_FREQUENT")
HVT.frame:RegisterEvent("UNIT_AURA")
HVT.frame:RegisterEvent("PLAYER_ENTERING_WORLD")

HVT.frame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and ... == addonName then
        if HVTDB and HVTDB.point then
            self:ClearAllPoints()
            self:SetPoint(HVTDB.point, UIParent, HVTDB.relativePoint, HVTDB.xOfs, HVTDB.yOfs)
        end
        if HVTDB and HVTDB.isFrameVisible ~= nil then
            if HVTDB.isFrameVisible then
                self:Show()
                HVT.dragHandle:Show() -- Ensure drag handle is visible
            else
                self:Hide()
                HVT.dragHandle:Hide() -- Hide drag handle with frame
            end
        else
            self:Hide()
            HVT.dragHandle:Hide() -- Hide drag handle by default
        end
        HVT:Reset()
    elseif event == "UNIT_POWER_FREQUENT" then
        local unit, powerType = ...
        if unit == "player" and powerType == "ALTERNATE" then
            local power = UnitPower(unit, Enum.PowerType.Alternate)
            if HVT.lastPower then
                local diff = HVT.lastPower - power
                if diff <= 12 and diff ~= 0 then -- Tick
                    local avg = HVT:GetCacheAverage()
                    if math.abs(diff - avg) > 1 then HVT:ResetCache() end
                    HVT.tickCache[10 - HVT.ticks % 10] = diff
                    HVT.ticks = HVT.ticks + 1
                    local drain = HVT:GetEffectiveDrain(HVT:GetCacheAverage())
                    HVT.remainingTime = HVT:SecondsToClock(power / drain)
                elseif diff > 12 then -- Big hit
                    HVT.lastBigHit = diff
                    HVT.lostToHits = HVT.lostToHits + diff
                end
            end
            HVT.lastPower = power
            -- CHANGED: Use format strings for dynamic updates
            HVT.frames["Sanity"]:SetText(string.format(HVT.strings["Sanity"], power))
            HVT.frames["Time left"]:SetText(string.format(HVT.strings["Time left"], HVT.remainingTime))
            HVT.frames["Sanity loss from hits"]:SetText(string.format(HVT.strings["Sanity loss from hits"], HVT.lostToHits))
            local color = power <= 100 and {1, 0.02, 0, 1} or
                          power <= 200 and {1, 0.37, 0, 1} or
                          power <= 300 and {1, 0.67, 0, 1} or
                          power <= 400 and {1, 0.85, 0, 1} or
                          power <= 500 and {0.58, 1, 0, 1} or {1, 1, 1, 1}
            HVT.frames["Sanity"]:SetTextColor(unpack(color))
        end
    elseif event == "UNIT_AURA" and ... == "player" then
        for id, data in pairs(HVT.buffs) do
            local spellIds = data.spellIds or {data.spellId}
            local isActive = false
            for _, spellId in ipairs(spellIds) do
                local aura = C_UnitAuras.GetPlayerAuraBySpellID(spellId)
                if aura then
                    isActive = true
                    if HVT.frames[id] and HVT.frames[id].texture then
                        HVT.frames[id].texture:SetTexture(aura.icon)
                        if aura.expirationTime and aura.duration then
                            HVT.frames[id].cooldown:SetCooldown(aura.expirationTime - aura.duration, aura.duration)
                            local timeLeft = aura.expirationTime - GetTime()
                            HVT.frames[id].glow:SetShown(timeLeft < 10)
                            HVT.frames[id]:SetAlpha(timeLeft < 10 and 1 or 0.7)
                            if id == "Gift of the Titans" then
                                HVT.giftExpiration = aura.expirationTime
                            end
                        end
                        HVT.frames[id]:Show()
                    elseif id == "Cheat Death" then
                        HVT.frames[id]:Show()
                        C_Timer.After(0.5, function() HVT.frames[id]:Hide() end)
                        print(data.text)
                    end
                    break
                end
            end
            if not isActive and HVT.frames[id] then
                HVT.frames[id]:Hide()
                if id == "Gift of the Titans" and HVT.giftExpiration > GetTime() then
                    local timeLeft = HVT.giftExpiration + 60 - GetTime()
                    if timeLeft > 0 then
                        HVT.frames[id]:Show()
                        HVT.frames[id].texture:SetDesaturated(true)
                        HVT.frames[id].label:SetText(timeLeft > 60 and "Available" or "On CD")
                    else
                        HVT.frames[id].label:SetText("Available")
                        HVT.frames[id].texture:SetDesaturated(false)
                    end
                end
            end
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        HVT:Reset()
    end
end)

-- Slash Command
SLASH_HVT1 = "/vision"
SlashCmdList["HVT"] = function(msg)
    msg = msg:lower()
    if msg == "reset" then
        HVT.frame:ClearAllPoints()
        HVT.frame:SetPoint("CENTER", UIParent, "CENTER", 500, 0) -- Move to right of center
        HVTDB.point = "CENTER"
        HVTDB.relativePoint = "CENTER"
        HVTDB.xOfs = 200
        HVTDB.yOfs = 0
        print("Horrific Visions Tracker: Frame position reset to right of center.")
    elseif msg == "" then
        -- Toggle frame visibility
        if HVT.frame:IsShown() then
            HVT.frame:Hide()
            HVT.dragHandle:Hide() -- Hide drag handle with frame
            HVTDB.isFrameVisible = false
            print("Horrific Visions Tracker: Frame hidden.")
        else
            HVT.frame:Show()
            HVT.dragHandle:Show() -- Show drag handle with frame
            HVTDB.isFrameVisible = true
            print("Horrific Visions Tracker: Frame shown.")
        end
    else
        print("Horrific Visions Tracker:")
        print("/vision - Toggle frame visibility")
        print("/vision reset - Reset frame position to right of center")
        print("Click and drag the handle (top-right corner) to move the frame.")
    end
end
