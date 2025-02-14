-- Source / Credits:
--      - Idea: DevJacob (Discord: dev_jacob)
--      - Art: DevJacob (Discord: dev_jacob)
--      - Code: DevJacob (Discord: dev_jacob)

local itemCfg = Collectables.utils.getItemConfig("Joker", "casper")

local casper = {
    key = "casper",
    name = "col-casper",
    atlas = "jokers_atlas",
    pos = { x = 1, y = 2 },
    rarity = "Rare",
    discovered = Collectables.config.discoverAll,
    cost = itemCfg.cost or 12,
    blueprint_compat = false,
    perishable_compat = false,
    config = {
        extra = {
            reducedJokerSlots = itemCfg.reducedJokerSlots,
            roundsUntilActive = itemCfg.roundsUntilActive,
            roundsCompleted = 0,
        }
    },
    loc_vars = function(self, info_queue, center)
		return {
            vars = {
                itemCfg.reducedJokerSlots,
                itemCfg.roundsUntilActive,
                center.ability.extra.roundsCompleted,
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.reducedJokerSlots
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.reducedJokerSlots
    end,
    calculate = function(self, card, context)

        -- Increase rounds counter
        if 
            context.end_of_round
            and not context.individual
            and not context.repetition
            and not context.blueprint
        then
            card.ability.extra.roundsCompleted = card.ability.extra.roundsCompleted + 1
            
            if card.ability.extra.roundsCompleted >= card.ability.extra.roundsUntilActive then 
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end

            return {
                message = (card.ability.extra.roundsCompleted < card.ability.extra.roundsUntilActive) 
                    and (card.ability.extra.roundsCompleted .. "/" .. card.ability.extra.roundsUntilActive) 
                    or localize("k_active_ex"),
            }
        end


        -- Handle selling of joker
        if 
            context.selling_self
            and not context.blueprint
            and card.ability.extra.roundsCompleted >= card.ability.extra.roundsUntilActive
        then
            local eval = function(card) return (card.ability.loyalty_remaining == 0) and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
            
            local newCard = SMODS.add_card({
                set = "Joker",
                area = G.jokers,
                legendary = true,
                no_edition = false,
            })

            G.jokers:remove_card(card)
            card:remove()
            card = nil

            return {}
        end
    end,
}

return {
    order = 6,
    data = casper,
    config = function() 
        return {
            key = "casper",
            name = localize("name_mod_casper", "mod_config"),
            stateTable = Collectables.loadState.items["Joker"]["casper"],
            refTable = Collectables.config.items["Joker"]["casper"],
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