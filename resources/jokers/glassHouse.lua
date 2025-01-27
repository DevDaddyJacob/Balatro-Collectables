-- Source / Credits:
--      - Idea: DevJacob (Discord: dev_jacob)
--      - Art: DevJacob (Discord: dev_jacob)
--      - Code: DevJacob (Discord: dev_jacob)

local itemCfg = Collectables.utils.getItemConfig("Joker", "glass_house")

local glass_house = {
    key = "glass_house",
    name = "col-glass_house",
    atlas = "jokers_atlas",
    pos = { x = 1, y = 0 },
    rarity = "Uncommon",
    discovered = Collectables.config.discoverAll,
    cost = itemCfg.cost or 5,
    blueprint_compat = true,
    perishable_compat = true,
    config = {
        extra = {
            last_hand = nil,
            x_mult = itemCfg.xMult or 4,
        }
    },
    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.x_mult } }
    end,
    calculate = function(self, card, context)
        if
            context.cardarea == G.jokers
            and context.joker_main
            and not context.before
            and not context.after
        then
            -- Get the current hand type played
            local currentHand = G.GAME.current_round.current_hand.handname

            -- Compare with last hand type
            if 
                card.ability.extra.last_hand ~= nil
                and currentHand ~= nil
                and card.ability.extra.last_hand == currentHand
            then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound("tarot1")
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true
							end,
						}))
						return true
					end,
				}))

                return {
                    message = localize("k_extinct_ex"),
                    colour = G.C.FILTER
                }
            end

            -- Apply times mult
            card.ability.extra.last_hand = currentHand
            return {
                Xmult_mod = card.ability.extra.x_mult,
                message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } })
            }
        end
    end,
}

return {
    order = 1,
    data = glass_house,
    config = function() 
        return {
            key = "glass_house",
            name = localize("name_mod_glass_house", "mod_config"),
            stateTable = Collectables.loadState.items["Joker"]["glass_house"],
            refTable = Collectables.config.items["Joker"]["glass_house"],
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
                    refValue = "xMult",
                    type = "slider",
                    label = {
                        text = localize("template_edit", "mod_config"):format(localize("misc_x_mult_value", "mod_config")), 
                        scale = 0.5, 
                        colour = G.C.UI.TEXT_LIGHT,
                        shadow = true
                    },
                    args = {
                        label = localize("misc_enabled", "mod_config"),
                        decimalPlaces = 0,
                        min = 2,
                        max = 10,
                        w = 3.0,
                        h = 0.5,
                    },
                },
            }
        }
    end,
}