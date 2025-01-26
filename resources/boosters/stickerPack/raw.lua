local sticker_pack = {
    key = "sticker_pack",
    kind = "Mod_Sticker",
    group_key = "k_col_sticker_pack",
    atlas = "boosters_atlas",
    pos = { x = 0, y = 0 },
	config = { extra = 2, choose = 1 },
    order = 1,
    cost = 4,
    weight = 0.96,
    draw_hand = true,
    discovered = Collectables.config.discoverAll,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
	create_card = function(self, card)
		return create_card("Mod_Sticker", G.pack_cards, nil, nil, true, true, nil, "col_sticker_pack")
	end,
	-- ease_background_colour = function(self)
	-- 	ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
	-- 	ease_background_colour({ new_colour = G.C.SET.Code, special_colour = G.C.BLACK, contrast = 2 })
	-- end,
}

return sticker_pack