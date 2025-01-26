-- Source / Credits:
--      - Idea: kavid115 in Balatro Discord: https://discord.com/channels/1116389027176787968/1271576763625111665/1271576763625111665
--      - Art: kavid115 in Balatro Discord: https://discord.com/channels/1116389027176787968/1271576763625111665/1271576763625111665
--      - Code: DevJacob (Discord: dev_jacob)

local itemCfg = Collectables.utils.getItemConfig("Joker", "bloomer")

local bloomer = {
    key = "bloomer",
    name = "col-bloomer",
    atlas = "jokers_atlas",
    pos = { x = 1, y = 0 },
    rarity = "Uncommon",
    discovered = Collectables.config.discoverAll,
    cost = itemCfg.cost or 6,
    blueprint_compat = true,
    perishable_compat = false,
    config = {
        extra = {
            increaseVal = itemCfg.multIncreaseVal or 0.03,
            x_mult = 1,
        }
    },
    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.increaseVal, center.ability.extra.x_mult } }
    end,
    calculate = function(self, card, context)
        if 
            context.end_of_round
            and not context.repetition
            and not context.individual
            and not context.blueprint
        then
            local gainedInterest = (G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/5), G.GAME.interest_cap/5))
            local gainedMult = card.ability.extra.increaseVal * gainedInterest

            if gainedMult > 0 then
                card.ability.extra.x_mult = card.ability.extra.x_mult + gainedMult
                
                return {
                    message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
                }
            end
        end

        if
            context.cardarea == G.jokers
            and context.joker_main
            and not context.before
            and not context.after
            and (Collectables.utils.bigNum(card.ability.extra.x_mult) > Collectables.utils.bigNum(1))
        then
            return {
                message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } }),
                x_mult = card.ability.extra.x_mult,
            }
        end
    end,
}

return {
    order = 1,
    data = bloomer,
    config = function() 
        return {
            key = "bloomer",
            name = localize("name_mod_bloomer", "mod_config"),
            stateTable = Collectables.loadState.items["Joker"]["bloomer"],
            refTable = Collectables.config.items["Joker"]["bloomer"],
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
                        label = localize("misc_enabled", "mod_config"),
                        decimalPlaces = 0,
                        min = 0,
                        max = 15,
                        w = 3.0,
                        h = 0.5,
                    },
                },
                {
                    refValue = "multIncreaseVal",
                    type = "slider",
                    label = {
                        text = localize("template_edit", "mod_config"):format(localize("misc_mult_increase_rate", "mod_config")), 
                        scale = 0.5, 
                        colour = G.C.UI.TEXT_LIGHT,
                        shadow = true
                    },
                    args = {
                        label = localize("misc_enabled", "mod_config"),
                        decimalPlaces = 2,
                        min = 0.01,
                        max = 1,
                        w = 4.5,
                        h = 0.5,
                    },
                },
            }
        }
    end,
}