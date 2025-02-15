-- Source / Credits:
--      - Idea: DevJacob (Discord: dev_jacob)
--      - Art: DevJacob (Discord: dev_jacob)
--      - Code: DevJacob (Discord: dev_jacob)

local itemCfg = Collectables.utils.getItemConfig("Joker", "confused_blueprint")

local function confusedBlueprintCompat(uiE, side)
    if side ~= "left" and side ~= "right" then
        return
    end

    local refAbility = uiE.config.ref_table.ability.confused_blueprint[side]
    if refAbility.compat == refAbility.compat_check then
        return
    end

    if refAbility.compat == "compatible" then 
        uiE.config.colour = mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8)
    elseif refAbility.compat == "incompatible" then
        uiE.config.colour = mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8)
    end

    refAbility.compat_ui = (" %s "):format(localize(("k_%s_%s"):format(side, refAbility.compat)))
    refAbility.compat_check = refAbility.compat
end

G.FUNCS.confused_blueprint_compat_left = function(e) confusedBlueprintCompat(e, "left") end
G.FUNCS.confused_blueprint_compat_right = function(e) confusedBlueprintCompat(e, "right") end

local function findConfusedBlueprintCopyJokers(card)
    local leftJoker = nil
    local rightJoker = nil

    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
            -- Store the joker to the left, if it exists
            if (i - 1) >= 1 then
                leftJoker = G.jokers.cards[i-1] 
            end
    
            -- Store the joker to the right, if it exists
            if (i + 1) <= #G.jokers.cards then
                rightJoker = G.jokers.cards[i+1] 
            end
    
            break
        end
    end

    return leftJoker, rightJoker
end


local confused_blueprint = {
    key = "confused_blueprint",
    name = "col-confused_blueprint",
    atlas = "jokers_atlas",
    pos = { x = 3, y = 0 },
    rarity = "Rare",
    discovered = Collectables.config.discoverAll,
    cost = itemCfg.cost or 8,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,
    config = {
        confused_blueprint = {
            left = {
                compat = nil,
                compat_check = nil,
                compat_ui = nil,
            },
            right = {
                compat = nil,
                compat_check = nil,
                compat_ui = nil,
            },
        }
    },
	update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
            local leftJoker, rightJoker = findConfusedBlueprintCopyJokers(card)

            -- Check if there is a left joker and check it's compatibility
            card.ability.confused_blueprint.left.compat = (leftJoker and leftJoker ~= card and leftJoker.config.center.blueprint_compat)
                and "compatible"
                or "incompatible"

                
            -- Check if there is a right joker and check it's compatibility
            card.ability.confused_blueprint.right.compat = (rightJoker and rightJoker ~= card and rightJoker.config.center.blueprint_compat)
                and "compatible"
                or "incompatible"
		end
	end,
    loc_vars = function(self, info_queue, card)
		card.ability.confused_blueprint.left.compat_ui = card.ability.confused_blueprint.left.compat_ui or ''; card.ability.confused_blueprint.left.compat_check = nil
		card.ability.confused_blueprint.right.compat_ui = card.ability.confused_blueprint.right.compat_ui or ''; card.ability.confused_blueprint.right.compat_check = nil
		
        return {
			main_end = (card.area and card.area == G.jokers)
                and { { n = G.UIT.C, config = { align = "bm", minh = 0.4 }, 
                    nodes = {
                        { n = G.UIT.R, config = { align = "bm", padding = 0.06 },
                            nodes = {
                                { n = G.UIT.C, config = { ref_table = card, align = "m", colour = G.C.JOKER_GREY, r = 0.05, padding = 0.06, func = "confused_blueprint_compat_left" },
                                    nodes = {
                                        { n = G.UIT.T, config = { ref_table = card.ability.confused_blueprint.left, ref_value = "compat_ui", colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.8 } },
                                    }
                                },
                            }
                        },
                        { n = G.UIT.R, config = { align = "bm", padding = 0.00 },
                            nodes = {
                                { n = G.UIT.C, config = { ref_table = card, align = "m", colour = G.C.JOKER_GREY, r = 0.05, padding = 0.06, func = "confused_blueprint_compat_right" },
                                    nodes = {
                                        { n = G.UIT.T, config = { ref_table = card.ability.confused_blueprint.right, ref_value = "compat_ui", colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.8 } },
                                    }
                                },
                            }
                        },
                    }
                }}
                or nil
		}
    end,
    calculate = function(self, card, context)
        local leftJoker, rightJoker = findConfusedBlueprintCopyJokers(card)

		if 
            (leftJoker and leftJoker ~= card)
            or (rightJoker and rightJoker ~= card)
        then
            context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
            context.blueprint_card = context.blueprint_card or card

			local leftJoker_ret, leftJoker_trig = leftJoker ~= nil and leftJoker:calculate_joker(context) or nil
			local rightJoker_ret, rightJoker_trig = rightJoker ~= nil and rightJoker:calculate_joker(context) or nil
            
            if leftJoker_ret or leftJoker_trig then
				if not leftJoker_ret then leftJoker_ret = {} end
				leftJoker_ret.card = context.blueprint_card or card
				leftJoker_ret.colour = G.C.BLUE
                SMODS.calculate_effect(leftJoker_ret, card)
			end

            if rightJoker_ret or rightJoker_trig then
				if not rightJoker_ret then rightJoker_ret = {} end
				rightJoker_ret.card = context.blueprint_card or card
				rightJoker_ret.colour = G.C.BLUE
                SMODS.calculate_effect(rightJoker_ret, card)
			end

        end
    end,
}

return {
    order = 8,
    data = confused_blueprint,
    config = function() 
        return {
            key = "confused_blueprint",
            name = localize("name_mod_confused_blueprint", "mod_config"),
            stateTable = Collectables.loadState.items["Joker"]["confused_blueprint"],
            refTable = Collectables.config.items["Joker"]["confused_blueprint"],
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