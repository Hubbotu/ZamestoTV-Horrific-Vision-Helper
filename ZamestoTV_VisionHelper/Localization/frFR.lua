local addonName = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "frFR", true)

if not L then return end

-- Vision
L["Anvil"] = "|cFFFFFFFFEnclume|r"
L["Anvil Note"] = "|cFFDC143CÉtalon forgé par le Vide :|r Vous devez avoir 4 charges du buff Fer à cheval maudit et au moins 1 masque actif. |cFFa335eeRênes d’étalon forgé par le Vide|r"
L["Cursed Horseshoe"] = "|cFFFFFFFFFer à cheval maudit|r"
L["Cursed Horseshoe Note"] = "Récupérez 4 Fers à cheval maudits, en ayant au moins un |cFFDC143C1 masque actif|r pour obtenir les |cFFa335eeRênes d’étalon forgé par le Vide|r"
L["Magic-Lined Manifold"] = "|cFFFFFFFFCollecteur à doublure magique|r"
L["Magic-Lined Manifold Note"] = "|cFFDC143CSystème d’échappement du cyclomort :|r Ramassez la boîte près de l'entrée de l'hôtel des ventes, vous devez porter au moins un masque. |cFFa335eeCyclomort de saccageur gangrené|r"
L["Trash"] = "|cFFFFFFFFDétritus|r"
L["Trash Note"] = "|cFFDC143CEssaimite nicheuse :|r Un monstre rare a une chance d'apparaître. |cFFa335eeEssaimite nicheuse|r"
L["Black Blood Bar"] = "|cFFFFFFFFLingot imprégné de Sang noir|r"
L["Black Blood Bar Note"] = "|cFFDC143CLingot imprégné de Sang noir :|r Composant nécessaire à la création de la |cFFa335eePanthère en cristal du Vide|r"
L["Ripped Note"] = "|cFFFFFFFFGriffon marqué par le Vide|r"
L["Ripped Note Note"] = "Vous devez avoir au moins |cFFDC143C3 masques actifs|r.\n\nTuez l'inquisiteur Darkspeak, puis lisez l'indice écrit sur la Note déchirée en haut des escaliers.\n\n1. On dirait que cette créature difficile ne veut manger que du poisson. - |cFF0070DD1x Filet frais Filet frais|r.\n\n2. On dirait qu'il ne veut manger que des champignons. - |cFF0070DD1x Champifleur émincé Champifleur émincé|r.\n\n3. On dirait qu'il ne veut manger que de la viande épicée. - |cFF0070DD1x Bouillon de viande épicé Bouillon de viande épicé|r.\n\n4. On dirait qu'il ne veut manger que du steak. - |cFF0070DD1x Pièce de viande Pièce de viande|r.\n\nPlacez l'aliment souhaité dans le Bol couvert de traces de griffures et agitez-le. |cFFa335eeRênes de griffon marqué par le Vide|r"
L["Big Keech"] = "|cFFFFFFFFGrand Pan Su|r"
L["Big Keech Note"] = "Il peut laisser tomber un |cFF0070DDOrbe de mystère lié par le Vide|r (obtenable par tout le monde) ainsi que le |cFF0070DDDessin : panthère en cristal du Vide|r (joailliers uniquement), nécessaires à la création de la |cFFa335eePanthère en cristal du Vide|r"
L["Wolf Saddle"] = "|cFFFFFFFFSelle de loup|r"
L["Wolf Saddle Note"] = "Prenez l'objet. Vous devez avoir |cFF0070DDau moins 1 masque actif|r. |cFFa335eeHarnais de la mère de meute marquée par le Vide|r"
L["Wolf Tack"] = "|cFFFFFFFFSac de sellerie pour loup|r"
L["Wolf Tack Note"] = "Prenez l'objet. Vous devez avoir |cFF0070DDau moins 1 masque actif|r. |cFFa335eeHarnais de la mère de meute marquée par le Vide|r"
L["Wolf Rug"] = "|cFFFFFFFFTapis en peau de loup|r"
L["Wolf Rug Note"] = "Récupérez la Selle de loup et le Sac de sellerie pour loup. Vous devez avoir |cFF0070DDau moins 1 masque actif|r. Intéragissez ensuite avec le Tapis en peau de loup pour obtenir le |cFFa335eeHarnais de la mère de meute marquée par le Vide|r"
L["Valley of Wisdom Elevator"] = "|cFFFFFFFFCoursier du vent marqué par le Vide|r"
L["Valley of Wisdom Elevator Note"] = "Complétez la zone située à la Vallée de la Sagesse. Vous devez avoir |cFF0070DDau moins 3 masques actifs|r. Prenez ensuite l'ascenseur jusqu'au dernier étage. |cFFa335eeCoursier du vent marqué par le Vide|r"

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
L["Show Zamros"] = "Afficher les emplacements de farm d'or"
L["Show Zamros gold"] = "Afficher les points d'activité avec lesquels vous pouvez gagner de l'or"
L["Reset hidden nodes"] = true
L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."] = true