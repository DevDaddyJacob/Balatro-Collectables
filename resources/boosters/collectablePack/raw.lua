local collectable_pack = {
    key = "collectable_pack",
    group_key = "k_col_collectable_pack",
    atlas = "boosters_atlas",
    pos = { x = 0, y = 0 },
	config = { extra = 2, choose = 1 },
    order = 1,
    cost = 4,
    weight = 0.96,
    draw_hand = false,
    -- select_card = "joker",
    discovered = Collectables.config.discoverAll,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
	create_card = function(self, card, i)
        local rarity = SMODS.ObjectTypes["Joker"].rarities[SMODS.poll_rarity("Joker")].key
        local key = pseudorandom_element(Collectables.pools.Jokers[rarity], pseudoseed("col_collectable_pack"))
        
		-- return create_card("Mod_Sticker", G.pack_cards, nil, nil, true, true, nil, "col_sticker_pack")
		return create_card("Joker", G.pack_cards, nil, nil, true, false, key, "col_sticker_pack")
	end,
}

return collectable_pack