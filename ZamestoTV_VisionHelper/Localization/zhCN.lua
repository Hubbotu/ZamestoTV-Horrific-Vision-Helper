local addonName = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "zhCN", false)

if not L then return end

-- Vision
L["Anvil"] = "|cFFFFFFFF铁砧|r"
L["Anvil Note"] = "|cFFDC143C虚铸骏马的缰绳:|r 需要4层被诅咒的马蹄铁增益并至少装备1个面具。|cFFa335ee虚铸骏马的缰绳|r"
L["Cursed Horseshoe"] = "|cFFFFFFFF被诅咒的马蹄铁|r"
L["Cursed Horseshoe Note"] = "收集4个被诅咒的马蹄铁，至少|cFFDC143C装备1个面具|r以获得|cFFa335ee虚铸骏马的缰绳|r"
L["Magic-Lined Manifold"] = "|cFFFFFFFF魔法内衬集管|r"
L["Magic-Lined Manifold Note"] = "|cFFDC143C死亡循环排气系统:|r 在拍卖行入口附近拾取箱子，需装备至少1个面具。|cFFa335ee魔能掠夺者死亡循环|r"
L["Trash"] = "|cFFFFFFFF废料|r"
L["Trash Note"] = "|cFFDC143C筑巢的群聚虫:|r 有概率召唤稀有怪物。|cFFa335ee筑巢的群聚虫|r"
L["Black Blood Bar"] = "|cFFFFFFFF黑血锭|r"
L["Black Blood Bar Note"] = "|cFFDC143C黑血灌注之锭:|r 制造|cFFa335ee虚空水晶豹|r的原料"
L["Ripped Note"] = "|cFFFFFFFF虚痕狮鹫的缰绳|r"
L["Ripped Note Note"] = "你必须有至少|cFFDC143C2个激活的面具|r。\n\n击杀审判官达克斯比，然后在楼梯上阅读“被撕破的便笺”提供的线索，接着在墙上阅读另一个线索（会提示食物是生的还是熟的）R - 生食 C - 熟食。\n\n1. 挑食的家伙只想吃鱼 - |cFF0070DD1x鲜鱼片（生） 1x串烧鱼片（熟）|r\n\n2. 挑食的家伙只想吃菌类 - |cFF0070DD1x被斩断的菌丝花（生） 1x炙烤菌丝花（熟）|r\n\n3. 挑食的家伙只想吃香料腌制的肉 - |cFF0070DD1x香肉贮藏（生） 1x朴素炖煮（熟）|r\n\n4. 挑食的家伙只想吃牛排 - |cFF0070DD1x分切的肉排（生） 1x未风干的野地肉排（熟）|r\n\n将所需食物放入“布满爪痕的碗”并选择“摇晃食盆”。|cFFa335ee虚痕狮鹫的缰绳|r"
L["Big Keech"] = "|cFFFFFFFF大块头齐奇|r"
L["Big Keech Note"] = "掉落|cFF0070DD虚空束缚神秘宝珠|r(全员)和|cFF0070DD图鉴：虚空水晶猎豹|r(珠宝匠专有)，用于制造|cFFa335ee虚空水晶猎豹|r"
L["Wolf Saddle"] = "|cFFFFFFFF狼鞍|r"
L["Wolf Saddle Note"] = "拾取物品，需装备|cFF0070DD至少1个面具|r。|cFFa335ee虚痕狼母的缰绳|r"
L["Wolf Tack"] = "|cFFFFFFFF狼具|r"
L["Wolf Tack Note"] = "拾取物品，需装备|cFF0070DD至少1个面具|r。|cFFa335ee虚痕狼母的缰绳|r"
L["Wolf Rug"] = "|cFFFFFFFF狼皮毯|r"
L["Wolf Rug Note"] = "收集狼鞍和狼具，需装备|cFF0070DD至少1个面具|r。激活狼皮毯获得|cFFa335ee虚痕狼母的缰绳|r"
L["Valley of Wisdom Elevator"] = "|cFFFFFFFF虚痕驭风者的缰绳|r"
L["Valley of Wisdom Elevator Note"] = "清空智慧谷，需装备|cFF0070DD至少3个面具|r。乘坐电梯至顶层。|cFFa335ee虚痕驭风者的缰绳|r"

-- Waypoints
L["Create waypoint"] = "创建路径点"
L["Create all waypoints"] = "创建所有路径点"
L["Hide node"] = "隐藏节点"
L["Close"] = "关闭"

-- Options
L["Icon settings"] = "图标设置"
L["These settings control the look of the icon."] = "这些设置控制图标外观"
L["Icon Scale"] = "图标缩放"
L["The scale of the icons"] = "图标的大小比例"
L["Icon Alpha"] = "图标透明度"
L["The alpha transparency of the icons"] = "图标的透明程度"
L["World Map"] = "世界地图"
L["Show icons on world map"] = "在世界地图显示图标"
L["Minimap"] = "小地图"
L["Show icons on the minimap"] = "在小地图显示图标"
L["What to display"] = "显示内容"
L["Show Zamros"] = "显示金币获取点"
L["Show Zamros gold"] = "显示可获得金币的活动点"
L["Reset hidden nodes"] = "重置隐藏节点"
L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."] = "显示所有通过右键点击选择'隐藏'的手动隐藏节点"
