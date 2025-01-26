local itemCfg = Collectables.utils.getItemConfig("ConsumableType", "Mod_Sticker")

local modSticker = {
    key = "Mod_Sticker",
    primary_colour = HEX("1E3F66"),
    secondary_colour = HEX("29578E"),
    collection_rows = { 4, 4 },
    shop_rate = itemCfg.shopRate or 0.0,
    can_stack = true,
	loc_txt = {},
}

return {
    data = modSticker,
    config = function() 
        return {
            key = "Mod_Sticker",
            name = localize("name_mod_sticker", "mod_config"),
            stateTable = Collectables.loadState.items["ConsumableType"]["Mod_Sticker"],
            refTable = Collectables.config.items["ConsumableType"]["Mod_Sticker"],
            configItems = {
                {
                    type = "toggle",
                    refValue = "enabled",
                    args = {
                        label = localize("misc_enabled", "mod_config"),
                    },
                },
                {
                    refValue = "shopRate",
                    type = "slider",
                    label = {
                        text = localize("template_edit", "mod_config"):format(localize("misc_shop_rate", "mod_config")), 
                        scale = 0.5, 
                        colour = G.C.UI.TEXT_LIGHT,
                        shadow = true
                    },
                    args = {
                        label = localize("misc_enabled", "mod_config"),
                        decimalPlaces = 1,
                        min = 0.0,
                        max = 50.0,
                        w = 3.0,
                        h = 0.5,
                    },
                },
            }
        }
    end,
}