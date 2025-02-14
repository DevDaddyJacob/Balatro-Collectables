-- Source / Credits:
--      - Idea: DevJacob (Discord: dev_jacob)
--      - Art: DevJacob (Discord: dev_jacob)
--      - Code: DevJacob (Discord: dev_jacob)

local itemCfg = Collectables.utils.getItemConfig("Joker", "painting")

local painting = {
    key = "painting",
    name = "col-painting",
    atlas = "jokers_atlas",
    pos = { x = 2, y = 2 },
    rarity = "Common",
    discovered = Collectables.config.discoverAll,
    cost = itemCfg.cost or 5,
    blueprint_compat = true,
    perishable_compat = true,
    config = {
        extra = {
            xChips = itemCfg.xChips,
        }
    },
    loc_vars = function(self, info_queue, center)
		return {
            vars = {
                center.ability.extra.xChips,
            }
        }
    end,
    calculate = function(self, card, context)
        if 
            context.cardarea == G.play
            and context.individual
        then
            local first_face = nil
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_face() then 
                    first_face = context.scoring_hand[i]
                    break
                end
            end

            if context.other_card == first_face then
                return {
                    x_chips = card.ability.extra.xChips
                }
            end
        end
    end,
}

return {
    order = 7,
    data = painting,
    config = function() 
        return {
            key = "painting",
            name = localize("name_mod_painting", "mod_config"),
            stateTable = Collectables.loadState.items["Joker"]["painting"],
            refTable = Collectables.config.items["Joker"]["painting"],
            configItems = {
                {
                    type = "toggle",
                    refValue = "enabled",
                    args = {
                        label = localize("misc_enabled", "mod_config"),
                    },
                },
                {
                    refValue = "cost",
                    type = "slider",
                    label = {
                        text = localize("template_edit", "mod_config"):format(localize("misc_shop_cost", "mod_config")), 
                        scale = 0.5, 
                        colour = G.C.UI.TEXT_LIGHT,
                        shadow = true
                    },
                    args = {
                        label = "",
                        decimalPlaces = 0,
                        min = 0,
                        max = 15,
                        w = 3.0,
                        h = 0.5,
                    },
                },
            }
        }
    end,
}