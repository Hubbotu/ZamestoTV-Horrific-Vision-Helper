local myname, ns = ...
local L = LibStub("AceLocale-3.0"):GetLocale(myname, false)

local path_meta = {
    __index = {
        label = "Path to treasure",
        atlas = "map-icon-SuramarDoor.tga",
        path = true,
        scale = 1.1,
    }
}

ns.map_spellids = {
    -- [2404] = 0, -- Vision of Stormwind
    -- [2403] = 0, -- Vision of Orgrimmar
}

ns.points = {
    [2404] = { -- Vision of Stormwind
        [63003730] = ({
            label = L["Anvil"],
            cont = true,
            Zamro = true,
            note = L["Anvil Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj27.tga",
        }),
        [56005550] = ({
            label = L["Cursed Horseshoe"],
            cont = true,
            Zamro = true,
            note = L["Cursed Horseshoe Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj32.tga",
        }),
        [75505670] = ({
            label = L["Cursed Horseshoe"],
            cont = true,
            Zamro = true,
            note = L["Cursed Horseshoe Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj32.tga",
        }),
        [61507550] = ({
            label = L["Cursed Horseshoe"],
            cont = true,
            Zamro = true,
            note = L["Cursed Horseshoe Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj32.tga",
        }),
        [50908400] = ({
            label = L["Cursed Horseshoe"],
            cont = true,
            Zamro = true,
            note = L["Cursed Horseshoe Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj32.tga",
        }),
        [61507270] = ({
            label = L["Magic-Lined Manifold"],
            cont = true,
            Zamro = true,
            note = L["Magic-Lined Manifold Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj39.tga",
        }),
        [55804930] = ({
            label = L["Trash"],
            cont = true,
            Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj66.tga",
        }),
        [62903070] = ({
            label = L["Trash"],
            cont = true,
            Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj66.tga",
        }),
        [66107630] = ({
            label = L["Trash"],
            cont = true,
            Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj66.tga",
        }),
        [52607730] = ({
            label = L["Trash"],
            cont = true,
            Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj66.tga",
        }),
        [73606270] = ({
            label = L["Trash"],
            cont = true,
            Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj66.tga",
        }),
        [63703710] = ({
            label = L["Black Blood Bar"],
            cont = true,
            Zamro = true,
            note = L["Black Blood Bar Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj39.tga",
        }),
        [68127334] = ({
            label = L["Ripped Note"],
            cont = true,
            Zamro = true,
            note = L["Ripped Note Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj20.tga",
        }),
        [65627159] = ({
            label = L["Ripped Note"],
            cont = true,
            Zamro = true,
            note = L["Ripped Note Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj20.tga",
        }),	
        [57604960] = ({
            label = L["Gain"],
            cont = true,
            Zamro = true,
            note = L["Gain Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj111.tga",
        }),		
        [54205780] = ({
            label = L["Gain 2"],
            cont = true,
            Zamro = true,
            note = L["Gain 2 Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj111.tga",
        }),	
        [60303690] = ({
            label = L["Gain 3"],
            cont = true,
            Zamro = true,
            note = L["Gain 3 Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj111.tga",
        }),	
        [62307690] = ({
            label = L["Gain 4"],
            cont = true,
            Zamro = true,
            note = L["Gain 4 Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj111.tga",
        }),	
        [51605820] = ({
            label = L["Poisons"],
            cont = true,
            Zamro = true,
            note = L["Poisons Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\Poisons.tga",
        }),	
        [49688700] = ({
            label = L["Mail"],
            cont = true,
            Zamro = true,
            note = L["Mail Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\mail.tga",
        }),
        [54635751] = ({
            label = L["Mail"],
            cont = true,
            Zamro = true,
            note = L["Mail Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\mail.tga",
        }),
        [61687604] = ({
            label = L["Mail"],
            cont = true,
            Zamro = true,
            note = L["Mail Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\mail.tga",
        }),
        [62073082] = ({
            label = L["Mail"],
            cont = true,
            Zamro = true,
            note = L["Mail Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\mail.tga",
        }),
        [75716456] = ({
            label = L["Mail"],
            cont = true,
            Zamro = true,
            note = L["Mail Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\mail.tga",
        }),		
        [55337550] = ({
            label = L["Nemesis"],
            cont = true,
            Zamro = true,
            note = L["Nemesis Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\pin.tga",
        }),		
        [71206960] = ({
            label = L["Vengeance"],
            cont = true,
            Zamro = true,
            note = L["Vengeance Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\pin.tga",
        }),	
        [53005190] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [54605940] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [58405510] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [60406880] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [62007690] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [66737643] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [69007310] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [62703700] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [62814226] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [64603090] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [67304470] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [44208790] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [47408160] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [47708940] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [52338295] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [74605920] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [76655261] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [75606460] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [76506850] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),				
    },
    [2403] = { -- Vision of Orgrimmar
        [70503320] = ({
            label = L["Big Keech"],
            cont = true,
            Zamro = true,
            note = L["Big Keech Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj110.tga",
        }),
        [47607450] = ({
            label = L["Trash"],
            cont = true,
            Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj66.tga",
        }),
        [57406080] = ({
            label = L["Trash"],
            cont = true,
            Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj66.tga",
        }),
        [69004970] = ({
            label = L["Trash"],
            cont = true,
            Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj66.tga",
        }),
        [50804510] = ({
            label = L["Trash"],
            cont = true,
            Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj66.tga",
        }),
        [40307940] = ({
            label = L["Trash"],
            cont = true,
            Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj66.tga",
        }),
        [45005270] = ({
            label = L["Black Blood Bar"],
            cont = true,
            Zamro = true,
            note = L["Black Blood Bar Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj39.tga",
        }),
        [67203620] = ({
            label = L["Wolf Saddle"],
            cont = true,
            Zamro = true,
            note = L["Wolf Saddle Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj36.tga",
        }),
        [39204950] = ({
            label = L["Wolf Tack"],
            cont = true,
            Zamro = true,
            note = L["Wolf Tack Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj36.tga",
        }),
        [60885489] = ({
            label = L["Wolf Rug"],
            cont = true,
            Zamro = true,
            note = L["Wolf Rug Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj35.tga",
        }),
        [46705280] = ({
            label = L["Valley of Wisdom Elevator"],
            cont = true,
            Zamro = true,
            note = L["Valley of Wisdom Elevator Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj293.tga",
        }),
        [54807830] = ({
            label = L["Gain 5"],
            cont = true,
            Zamro = true,
            note = L["Gain 5 Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj111.tga",
        }),	
        [32406720] = ({
            label = L["Gain 6"],
            cont = true,
            Zamro = true,
            note = L["Gain 6 Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj111.tga",
        }),	
        [57806520] = ({
            label = L["Gain 7"],
            cont = true,
            Zamro = true,
            note = L["Gain 7 Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj111.tga",
        }),	
        [45607760] = ({
            label = L["Gain 8"],
            cont = true,
            Zamro = true,
            note = L["Gain 8 Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\obj111.tga",
        }),
        [56905669] = ({
            label = L["Void-Forged Engine Block"],
            cont = true,
            Zamro = true,
            note = L["Void-Forged Engine Block Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\mout.tga",
        }),		
        [46858092] = ({
            label = L["Poisons"],
            cont = true,
            Zamro = true,
            note = L["Poisons Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\Poisons.tga",
        }),	
        [39304900] = ({
            label = L["Mail"],
            cont = true,
            Zamro = true,
            note = L["Mail Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\mail.tga",
        }),	
        [39708030] = ({
            label = L["Mail"],
            cont = true,
            Zamro = true,
            note = L["Mail Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\mail.tga",
        }),	
        [52707580] = ({
            label = L["Mail"],
            cont = true,
            Zamro = true,
            note = L["Mail Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\mail.tga",
        }),	
        [60105130] = ({
            label = L["Mail"],
            cont = true,
            Zamro = true,
            note = L["Mail Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\mail.tga",
        }),	
        [67673924] = ({
            label = L["Mail"],
            cont = true,
            Zamro = true,
            note = L["Mail Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\mail.tga",
        }),		
        [54807908] = ({
            label = L["Nemesis"],
            cont = true,
            Zamro = true,
            note = L["Nemesis Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\pin.tga",
        }),		
        [48708380] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),		
        [49406870] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [53508200] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [33406570] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [35406940] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [37908450] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [38508070] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [57605860] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [57706510] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [57904860] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [60405510] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [38904990] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [41704480] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [48404410] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [51004520] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [63903040] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [65805060] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [67003740] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),	
        [68204290] = ({
            label = L["oddcrystal"],
            cont = true,
            Zamro = true,
            note = L["oddcrystal Note"],
            pathto = "Interface\\Addons\\" .. myname .. "\\Icons\\odd.tga",
        }),				
    },
}
