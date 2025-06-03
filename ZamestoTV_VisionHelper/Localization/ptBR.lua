local addonName = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "ptBR", false)

if not L then return end

-- Vision
L["Anvil"] = "|cFFFFFFFFBigorna|r"
L["Anvil Note"] =
"|cFFDC143CGaranhão Marcado pelo Caos:|r Você deve ter 4 acúmulos do bônus Ferradura Amaldiçoada e pelo menos 1 máscara ativa. |cFFa335eeRédeas do Garanhão Marcado pelo Caos|r"
L["Cursed Horseshoe"] = "|cFFFFFFFFFerradura Amaldiçoada|r"
L["Cursed Horseshoe Note"] =
"Colete 4 Ferraduras Amaldiçoadas, precisa de pelo menos |cFFDC143C1 máscara ativa|r para obter as |cFFa335eeRédeas do Garanhão Marcado pelo Caos|r"
L["Magic-Lined Manifold"] = "|cFFFFFFFFColetor Forrado com Magia|r"
L["Magic-Lined Manifold Note"] =
"|cFFDC143CSistema de Escapamento de Mortecicleta:|r Pegue a caixa perto da entrada da casa de leilões, você deve usar pelo menos 1 máscara. |cFFa335eeMortecicleta do Aníquilus|r"
L["Trash"] = "|cFFFFFFFFLixo|r"
L["Trash Note"] =
"|cFFDC143CEnxamito Aninhado:|r Há uma chance de invocar um monstro raro. |cFFa335eeEnxamito Aninhado|r"
L["Black Blood Bar"] = "|cFFFFFFFFBarra de Sangue Negro|r"
L["Black Blood Bar Note"] =
"|cFFDC143CBarra Infusa de Sangue Negro:|r Ingrediente para criação |cFFa335eePantera do Cristal de Caos|r"
L["Ripped Note"] = "|cFFFFFFFFGrifo Marcado pelo Caos|r"
L["Ripped Note Note"] =
"Você deve ter pelo menos |cFFDC143C2 mascaras ativas|r.\n\nMate o Inquisidor Umbrivox e leia a pista do Bilhete Rasgado na escada, leia outro na parede (dirá se a comida é crua ou cozida) C - crua e B - cozida.\n\n1. Agora parece que o comedor exigente só quer comer peixe. - |cFF0070DD1x Filé Fresco Filé Fresco (C) 1x Espetinho de Filé (B)|r.\n\n2. Agora parece que o comedor exigente só quer comer fungos. - |cFF0070DD1x Micoflorescência em Pedaços Micoflorescência em Pedaços (C) 1x Micoflorescência Assada (B)|r.\n\n3. Agora parece que o comedor exigente só quer comer carne temperada. - |cFF0070DD1x Caldo de Carne Temperado Caldo de Carne Temperado (C) 1x Ensopadinho (B)|r.\n\n4. Agora parece que o comedor exigente só quer comer bife. - |cFF0070DD1x Bife Porcionado Bife Porcionado (C) 1x Bife do Campo Sem Tempero (B)|r.\n\nColoque o alimento desejado na Tigela com Marca de Garra e agite-a. |cFFa335eeRédeas do Grifo Marcado pelo Caos|r"
L["Big Keech"] = "|cFFFFFFFFGrande Keech|r"
L["Big Keech Note"] =
"Ele pode dropar |cFF0070DDOrbe do Mistério Atado ao Caos|r (cai para todos) e |cFF0070DDDesenho: Pantera do Cristal de Caos|r (somente joalheiro), necessário para criar |cFFa335eePantera do Cristal de Caos|r"
L["Wolf Saddle"] = "|cFFFFFFFFSela de Lobo|r"
L["Wolf Saddle Note"] =
"Pegue o item. Você deve ter pelo menos |cFF0070DD 1 máscara ativa|r. |cFFa335eeArnês da Mãe da Matilha Marcada pelo Caos|r"
L["Wolf Tack"] = "|cFFFFFFFFAcessórios de Lobo|r"
L["Wolf Tack Note"] =
"Pegue o item. Você deve ter pelo menos |cFF0070DD 1 máscara ativa|r. |cFFa335eeArnês da Mãe da Matilha Marcada pelo Caos|r"
L["Wolf Rug"] = "|cFFFFFFFFTapete de Lobo|r"
L["Wolf Rug Note"] =
"Colete Sela de Lobo e Acessórios de Lobo. Você deve ter pelo menos |cFF0070DD1 máscara equipada|r. Em seguida, ative o Tapete de Lobo para obter |cFFa335eeArnês da Mãe da Matilha Marcada pelo Caos|r"
L["Valley of Wisdom Elevator"] = "|cFFFFFFFFMantícora Marcada pelo Caos|r"
L["Valley of Wisdom Elevator Note"] =
"Limpe o Vale da Sabedoria. Você deve ter |cFF0070DDpelo menos 2 máscaras em você|r. Depois pegue o elevador até o último andar. |cFFa335eeMantícora Marcada pelo Caos|r"
L["Gain"] = true
L["Gain Note"] = true
L["Gain 2"] = true
L["Gain 2 Note"] = true
L["Gain 3"] = true
L["Gain 3 Note"] = true
L["Gain 4"] = true
L["Gain 4 Note"] = true
L["Gain 5"] = true
L["Gain 5 Note"] = true
L["Gain 6"] = true
L["Gain 6 Note"] = true
L["Gain 7"] = true
L["Gain 7 Note"] = true
L["Gain 8"] = true
L["Gain 8 Note"] = true
L["Void-Forged Engine Block"] = true
L["Void-Forged Engine Block Note"] = true
L["Poisons"] = true
L["Poisons Note"] = true
L["Mail"] = true
L["Mail Note"] = true
L["Nemesis"] = true
L["Nemesis Note"] = true
L["Vengeance"] = true
L["Vengeance Note"] = true

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
L["Show Zamros"] = "Mostrar locais de farming de ouro"
L["Show Zamros gold"] = "Mostrar pontos de atividade com os quais você pode ganhar ouro"
L["Reset hidden nodes"] = true
L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."] = true
