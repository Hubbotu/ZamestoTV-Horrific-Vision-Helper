local myname, ns = ...
local L = LibStub("AceLocale-3.0"):GetLocale(myname, false)

local path_meta = {__index = {
    label = "Path to treasure",
    atlas = "map-icon-SuramarDoor.tga",
    path = true,
    scale = 1.1,
}}

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
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj27.tga",
        }),
		[56005550] = ({
            label = L["Cursed Horseshoe"],
            cont = true,
            Zamro = true,
            note = L["Cursed Horseshoe Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj32.tga",
        }),
		[75505670] = ({
            label = L["Cursed Horseshoe"],
            cont = true,
            Zamro = true,
            note = L["Cursed Horseshoe Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj32.tga",
        }),
		[61507550] = ({
            label = L["Cursed Horseshoe"],
            cont = true,
            Zamro = true,
            note = L["Cursed Horseshoe Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj32.tga",
        }),
        [50908400] = ({
            label = L["Cursed Horseshoe"],
            cont = true,   
		    Zamro = true,
            note = L["Cursed Horseshoe Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj32.tga",
        }),
        [61507270] = ({
            label = L["Magic-Lined Manifold"],
            cont = true,   
		    Zamro = true,
            note = L["Magic-Lined Manifold Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj39.tga",
        }),	
        [55804930] = ({
            label = L["Trash"],
            cont = true,   
		    Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj66.tga",
        }),		
        [62903070] = ({
            label = L["Trash"],
            cont = true,   
		    Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj66.tga",
        }),		
        [66107630] = ({
            label = L["Trash"],
            cont = true,   
		    Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj66.tga",
        }),		
        [52607730] = ({
            label = L["Trash"],
            cont = true,   
		    Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj66.tga",
        }),	
        [73606270] = ({
            label = L["Trash"],
            cont = true,   
		    Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj66.tga",
        }),		
        [63703710] = ({
            label = L["Black Blood Bar"],
            cont = true,   
		    Zamro = true,
            note = L["Black Blood Bar Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj39.tga",
        }),		
        [68127334] = ({
            label = L["Ripped Note"],
            cont = true,   
		    Zamro = true,
            note = L["Ripped Note Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj20.tga",
        }),			
    },
	[2403] = { -- Vision of Orgrimmar
	    [70503320] = ({
            label = L["Big Keech"],
            cont = true,
            Zamro = true,
            note = L["Big Keech Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj110.tga",
        }),
        [47607450] = ({
            label = L["Trash"],
            cont = true,   
		    Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj66.tga",
        }),		
        [57406080] = ({
            label = L["Trash"],
            cont = true,   
		    Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj66.tga",
        }),		
        [69004970] = ({
            label = L["Trash"],
            cont = true,   
		    Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj66.tga",
        }),		
        [50804510] = ({
            label = L["Trash"],
            cont = true,   
		    Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj66.tga",
        }),	
        [40307940] = ({
            label = L["Trash"],
            cont = true,   
		    Zamro = true,
            note = L["Trash Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj66.tga",
        }),	
        [45005270] = ({
            label = L["Black Blood Bar"],
            cont = true,   
		    Zamro = true,
            note = L["Black Blood Bar Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj39.tga",
        }),	
        [67203620] = ({
            label = L["Wolf Saddle"],
            cont = true,   
		    Zamro = true,
            note = L["Wolf Saddle Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj36.tga",
        }),	
        [39204950] = ({
            label = L["Wolf Tack"],
            cont = true,   
		    Zamro = true,
            note = L["Wolf Tack Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj36.tga",
        }),	
        [59505400] = ({
            label = L["Wolf Rug"],
            cont = true,   
		    Zamro = true,
            note = L["Wolf Rug Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj35.tga",
        }),	
        [46705280] = ({
            label = L["Valley of Wisdom Elevator"],
            cont = true,   
		    Zamro = true,
            note = L["Valley of Wisdom Elevator Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\obj293.tga",
        }),			
    },
}
