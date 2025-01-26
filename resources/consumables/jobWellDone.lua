local job_well_done = {
    key = "job_well_done",
    name = "col-Job-Well-Done",
    set = "Mod_Sticker",
    discovered = Collectables.config.discoverAll,
    atlas = "jokers_atlas",
    pos = { x=1, y=0 },
    cost = 4,
	config = {
        mod_conv = "col_gold_star_seal",
        seal = { money_amount = 5 },
        max_highlighted = 1,
    },
    loc_vars = function(self, info_queue, center)
        -- Handle creating a tooltip with seal args.
        info_queue[#info_queue+1] = {
            set = "Other",
            key = "col_gold_star_seal",
            specific_vars = {
                self.config.seal.money_amount,
            },
        }
        -- Description vars
        return { vars = { center.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]

			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			
            G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("col_gold_star")
					end
					return true
				end,
			}))
			
            delay(0.5)
			
            G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
    end,
}

return {
    data = job_well_done,
    isEnabled = function(resourceType, itemKey)
        return Collectables.utils.defaultItemIsEnabled(resourceType, itemKey) 
            and Collectables.utils.defaultItemIsEnabled("ConsumableType", "Mod_Sticker")
            and Collectables.utils.defaultItemIsEnabled("Seal", "gold_star")
    end,
    config = function() 
        return {
            key = "job_well_done",
            name = localize("name_mod_job_well_done", "mod_config"),
            stateTable = Collectables.loadState.items["Consumable"]["job_well_done"],
            refTable = Collectables.config.items["Consumable"]["job_well_done"],
            configItems = {
                {
                    type = "toggle",
                    refValue = "enabled",
                    args = {
                        label = localize("misc_enabled", "mod_config"),
                    },
                },
            }
        }
    end,
}