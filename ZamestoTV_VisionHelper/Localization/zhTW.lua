local addonName = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "zhTW", false)

if not L then return end

-- Vision
L["Anvil"] = "|cFFFFFFFF鐵砧|r"
L["Anvil Note"] = "|cFFDC143C虛無鑄造戰馬的韁繩:|r 需要4層被詛咒的馬蹄鐵增益並至少裝備1個面具。|cFFa335ee虛無鑄造戰馬的韁繩|r"
L["Cursed Horseshoe"] = "|cFFFFFFFF被詛咒的馬蹄鐵|r"
L["Cursed Horseshoe Note"] = "收集4個被詛咒的馬蹄鐵，至少|cFFDC143C裝備1個面具|r以獲得|cFFa335ee虛無鑄造戰馬的韁繩|r"
L["Magic-Lined Manifold"] = "|cFFFFFFFF魔法流線歧管|r"
L["Magic-Lined Manifold Note"] = "|cFFDC143C超殺摩托車排氣系統:|r 在拍賣行入口附近拾取箱子，需裝備至少1個面具。|cFFa335ee魔化收割者的死亡之輪|r"
L["Trash"] = "|cFFFFFFFF垃圾|r"
L["Trash Note"] = "|cFFDC143C築巢蜱群:|r 有概率召喚稀有怪物。|cFFa335ee築巢蜱群|r"
L["Black Blood Bar"] = "|cFFFFFFFF黑血錠|r"
L["Black Blood Bar Note"] = "|cFFDC143C黑血灌注之錠:|r 製造|cFFa335ee虛無水晶獵豹|r的原料"
L["Ripped Note"] = "|cFFFFFFFF虛痕獅鷲的韁繩|r"
L["Ripped Note Note"] = "你必須有至少|cFFDC143C2個啟用的面具|r。\n\n擊殺審判官暗語，然後在樓梯上閱讀“被撕破的便箋”提供的線索，接著在牆上閱讀另一個線索（會提示食物是生的還是熟的）R - 生食 C - 熟食。\n\n1. 挑食的家伙只想吃魚 - |cFF0070DD1x新鮮魚片（生） 1x串烤肉片（熟）|r\n\n2. 挑食的家伙只想吃菌類 - |cFF0070DD1x切片真菌花（生） 1x炙烤真菌花（熟）|r\n\n3. 挑食的家伙只想吃香料腌制的肉 - |cFF0070DD1x醃肉存貨（生） 1x簡單的燉肉（熟）|r\n\n4. 挑食的家伙只想吃牛排 - |cFF0070DD1x分裝肉排（生） 1x未調味的野味肉排（熟）|r\n\n將所需食物放入“布滿爪痕的碗”並選擇“搖晃食盆”。|cFFa335ee虛痕獅鷲的韁繩|r"
L["Big Keech"] = "|cFFFFFFFF大塊頭齊奇|r"
L["Big Keech Note"] = "掉落|cFF0070DD虛無之縛神秘寶珠|r(全員)和|cFF0070DD圖鑒：虛無水晶獵豹|r(珠寶匠專有)，用於製造|cFFa335ee虛無水晶獵豹|r"
L["Wolf Saddle"] = "|cFFFFFFFF狼鞍|r"
L["Wolf Saddle Note"] = "拾取物品，需裝備|cFF0070DD至少1個面具|r。|cFFa335ee虛無之痕族母的韁繩|r"
L["Wolf Tack"] = "|cFFFFFFFF狼具|r"
L["Wolf Tack Note"] = "拾取物品，需裝備|cFF0070DD至少1個面具|r。|cFFa335ee虛無之痕族母的韁繩|r"
L["Wolf Rug"] = "|cFFFFFFFF狼皮毯|r"
L["Wolf Rug Note"] = "收集狼鞍和狼具，需裝備|cFF0070DD至少1個面具|r。啟用狼皮毯獲得|cFFa335ee虛無之痕族母的韁繩|r"
L["Valley of Wisdom Elevator"] = "|cFFFFFFFF虛痕馭風者的韁繩|r"
L["Valley of Wisdom Elevator Note"] = "清空智慧谷，需裝備|cFF0070DD至少3個面具|r。乘坐電梯至頂層。|cFFa335ee虛無之痕乘風者的韁繩|r"
L["Gain"] = "|cFFFFFFFF熊靈魂|r"
L["Gain Note"] = "提高加速 10%。"
L["Gain 2"] = "|cFFFFFFFF回報壁壘|r"
L["Gain 2 Note"] = "提高臨機應變 7%。"
L["Gain 3"] = "|cFFFFFFFF賦能|r"
L["Gain 3 Note"] = "造成傷害提高 10%。"
L["Gain 4"] = "|cFFFFFFFF受到強化|r"
L["Gain 4 Note"] = "致命一擊機率提高 10%。"
L["Gain 5"] = true
L["Gain 5 Note"] = true
L["Gain 6"] = true
L["Gain 6 Note"] = true
L["Gain 7"] = true
L["Gain 7 Note"] = true
L["Gain 8"] = true
L["Gain 8 Note"] = true


-- Waypoints
L["Create waypoint"] = "創建路徑點"
L["Create all waypoints"] = "創建所有路徑點"
L["Hide node"] = "隱藏節點"
L["Close"] = "關閉"

-- Options
L["Icon settings"] = "圖示設置"
L["These settings control the look of the icon."] = "這些設置控制圖示外觀"
L["Icon Scale"] = "圖示縮放"
L["The scale of the icons"] = "圖示的大小比例"
L["Icon Alpha"] = "圖示透明度"
L["The alpha transparency of the icons"] = "圖示的透明程度"
L["World Map"] = "世界地圖"
L["Show icons on world map"] = "在世界地圖顯示圖示"
L["Minimap"] = "小地圖"
L["Show icons on the minimap"] = "在小地圖顯示圖示"
L["What to display"] = "顯示內容"
L["Show Zamros"] = "顯示金幣獲取點"
L["Show Zamros gold"] = "顯示可獲得金幣的活動點"
L["Reset hidden nodes"] = "重置隱藏節點"
L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."] = "顯示所有通過右鍵點擊選擇'隱藏'的手動隱藏節點"
