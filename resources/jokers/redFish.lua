-- Source / Credits:
--      - Idea: DevJacob (Discord: dev_jacob)
--      - Art: DevJacob (Discord: dev_jacob)
--      - Code: DevJacob (Discord: dev_jacob)

local itemCfg = Collectables.utils.getItemConfig("Joker", "red_fish")

local red_fish = {
    key = "red_fish",
    name = "col-red_fish",
    atlas = "jokers_atlas",
    pos = { x = 1, y = 1 },
    rarity = "Rare",
    discovered = Collectables.config.discoverAll,
    cost = itemCfg.cost or 8,
    blueprint_compat = true,
    perishable_compat = true,
    config = {
        extra = {
            mult = 20,
            x_mult = 5,
        }
    },
    loc_vars = function(self, info_queue, center)
        -- Handle creating a tooltip with "Seuss Jokers"
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "col_seuss_jokers",
            specific_vars = {
                localize("name_mod_one_fish", "mod_config"),
                localize("name_mod_two_fish", "mod_config"),
                localize("name_mod_red_fish", "mod_config"),
                localize("name_mod_blue_fish", "mod_config"),
            },
        }

		return { vars = { center.ability.extra.mult, center.ability.extra.x_mult } }
    end,
    calculate = function(self, card, context)
        if
            context.cardarea == G.jokers
            and context.joker_main
            and not context.before
            and not context.after
        then
            -- Check if the there is another Seuss Joker
            local hasAnotherSeussJoker = 
                #(SMODS.find_card("j_col_one_fish", true) or {}) >= 1
                or #(SMODS.find_card("j_col_two_fish", true) or {}) >= 1
                or #(SMODS.find_card("j_col_blue_fish", true) or {}) >= 1

            -- Apply times mult
            if hasAnotherSeussJoker then
                return {
                    Xmult_mod = card.ability.extra.x_mult,
                    message = localize({ type = "variable", key = "a_xmult", vars = { card.ability.extra.x_mult } })
                }
            end

            -- Apply plus mult
            return {
                mult_mod = card.ability.extra.mult,
                message = localize({ type = "variable", key = "a_mult", vars = { card.ability.extra.mult } })
            }
        end
    end,
}

return {
    order = 4,
    data = red_fish,
    config = function() 
        return {
            key = "red_fish",
            name = localize("name_mod_red_fish", "mod_config"),
            stateTable = Collectables.loadState.items["Joker"]["red_fish"],
            refTable = Collectables.config.items["Joker"]["red_fish"],
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