local addonName = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true)

if not L then return end

-- Vision
L["Anvil"] = "|cFFFFFFFFAnvil|r"
L["Anvil Note"] = "|cFFDC143CVoid-Forged Stallion:|r You must have 4 stacks of Cursed Horseshoe buff and at least 1 active mask. |cFFa335eeVoid-Forged Stallion's Reins|r"
L["Cursed Horseshoe"] = "|cFFFFFFFFCursed Horseshoe|r"
L["Cursed Horseshoe Note"] = "Collect 4 Cursed Horseshoes, at least |cFFDC143C1 active mask|r to get |cFFa335eeVoid-Forged Stallion's Reins|r"
L["Magic-Lined Manifold"] = "|cFFFFFFFFMagic-Lined Manifold|r"
L["Magic-Lined Manifold Note"] = "|cFFDC143CDeathcycle Exhaust System:|r Pick up the box near the entrance to the auction house, you must have at least 1 mask on. |cFFa335eeFelreaver Deathcycle|r"
L["Trash"] = "|cFFFFFFFFTrash|r"
L["Trash Note"] = "|cFFDC143CNesting Swarmite:|r There is a chance to summon a rare monster. |cFFa335eeNesting Swarmite|r"
L["Black Blood Bar"] = "|cFFFFFFFFBlack Blood Bar|r"
L["Black Blood Bar Note"] = "|cFFDC143CBlack Blood Infused Bar:|r Ingredient for creation |cFFa335eeVoid-Crystal Panther|r"
L["Ripped Note"] = "|cFFFFFFFFVoid-Scarred Gryphon|r"
L["Ripped Note Note"] = "You must have at least |cFFDC143C2 masks active|r.\n\nKill Inquisitor Darkspeak, then read the clue on the Ripped Note stairs, read another one on the wall (it will say whether the food is raw or cooked) R - raw and C - cooked.\n\n1. Now it seems the picky eater only wants to eat fish. - |cFF0070DD1x Fresh Fillet Fresh Fillet (R) 1x Skewered Fillet (C)|r.\n\n2. Now it seems the picky eater only wants to eat fungus. - |cFF0070DD1x Chopped Mycobloom Chopped Mycobloom (R) 1x Roasted Mycobloom (C)|r.\n\n3. Now it seems the picky eater only wants to eat meat that has been spiced. - |cFF0070DD1x Spiced Meat Stock Spiced Meat Stock (R) 1x Simple Stew (C)|r.\n\n4. Now it seems the picky eater only wants to eat steak. - |cFF0070DD1x Portioned Steak Portioned Steak (R) 1x Unseasoned Field Steak (C)|r.\n\nPlace the desired food in the Claw Marked Bowl and shake the bowl. |cFFa335eeReins of the Void-Scarred Gryphon|r"
L["Big Keech"] = "|cFFFFFFFFBig Keech|r"
L["Big Keech Note"] = "It can drop |cFF0070DDVoid-Bound Orb of Mystery|r (drops for everyone) and |cFF0070DDDesign: Void-Crystal Panther|r (jeweler only), needed to craft |cFFa335eeVoid-Crystal Panther|r"
L["Wolf Saddle"] = "|cFFFFFFFFWolf Saddle|r"
L["Wolf Saddle Note"] = "Take the item. You must have at |cFF0070DDleast 1 mask on|r. |cFFa335eeVoid-Scarred Pack Mother's Harness|r"
L["Wolf Tack"] = "|cFFFFFFFFWolf Tack|r"
L["Wolf Tack Note"] = "Take the item. You must have at |cFF0070DDleast 1 mask on|r. |cFFa335eeVoid-Scarred Pack Mother's Harness|r"
L["Wolf Rug"] = "|cFFFFFFFFWolf Rug|r"
L["Wolf Rug Note"] = "Collect Wolf Saddle and Wolf Tack. You must have at least |cFF0070DD1 mask equipped|r. Then activate Wolf Rug to get |cFFa335eeVoid-Scarred Pack Mother's Harness|r"
L["Valley of Wisdom Elevator"] = "|cFFFFFFFFVoid-Scarred Windrider|r"
L["Valley of Wisdom Elevator Note"] = "Clear the Valley of Wisdom. You should have at |cFF0070DDleast 2 masks on you|r. Then take the elevator to the top floor. |cFFa335eeVoid-Scarred Windrider|r"
L["Gain"] = "|cFFFFFFFFBear Spirit|r"
L["Gain Note"] = "Increases haste by 10%."
L["Gain 2"] = "|cFFFFFFFFRequited Bulwark|r"
L["Gain 2 Note"] = "Versatility increased by 7%."
L["Gain 3"] = "|cFFFFFFFFEmpowered|r"
L["Gain 3 Note"] = "Damage done increased by 10%."
L["Gain 4"] = "|cFFFFFFFFEnriched|r"
L["Gain 4 Note"] = "Increases Critical Strike chance by 10%."
L["Gain 5"] = "|cFFFFFFFFProhibition|r"
L["Gain 5 Note"] = "Increases health by 10%."
L["Gain 6"] = "|cFFFFFFFFSpirit of Wind|r"
L["Gain 6 Note"] = "Haste increased by 10%. Movement speed increased by 10%."
L["Gain 7"] = "|cFFFFFFFFEthereal Essence|r"
L["Gain 7 Note"] = "Critical Strike chance increased by 10%."
L["Gain 8"] = "|cFFFFFFFFSmith's Strength|r"
L["Gain 8 Note"] = "All damage increased by 10%."
L["Void-Forged Engine Block"] = "|cFFFFFFFFVoid-Forged Inline Four Engine|r"
L["Void-Forged Engine Block Note"] = "|cFFDC143CVoid-Forged Engine Block:|r Take it from the table in the engineering workshop, you must have at least 1 mask on. |cFFa335eeVoid-Forged Stallion's Reins|r"
L["Poisons"] = "|cFFFFFFFFPoisons|r"
L["Poisons Note"] = "There is a poison here that reduces sanity and cannot be drunk."

-- Waypoints
L["Create waypoint"] = true
L["Create all waypoints"] = true
L["Hide node"] = true
L["Close"] = true

-- Options
L["Icon settings"] = true
L["These settings control the look of the icon."] = true
L["Icon Scale"] = true
L["The scale of the icons"] = true
L["Icon Alpha"] = true
L["The alpha transparency of the icons"] = true
L["World Map"] = true
L["Show icons on world map"] = true
L["Minimap"] = true
L["Show icons on the minimap"] = true
L["What to display"] = true
L["Show Zamros"] = "Show gold farming locations"
L["Show Zamros gold"] = "Show activity points with which you can earn gold"
L["Reset hidden nodes"] = true
L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."] = true