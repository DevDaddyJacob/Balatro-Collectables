Collectables.raw_overrides.funcs = {}
local _Funcs = Collectables.raw_overrides.funcs

_Funcs.eval_card = eval_card
function eval_card(card, context)
    local ret, post = _Funcs.eval_card(card, context)
    return ret, post
end


_Funcs.create_card = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    return _Funcs.create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
end


_Funcs.loc_colour = loc_colour
function loc_colour(_c, _default)
	if not G.ARGS.LOC_COLOURS then
		_Funcs.loc_colour()
	end

	G.ARGS.LOC_COLOURS.collectables = HEX("512888")
	G.ARGS.LOC_COLOURS.col_sticker = G.C.SET.Mod_Sticker
	G.ARGS.LOC_COLOURS.heart = G.C.SUITS.Hearts
	G.ARGS.LOC_COLOURS.diamond = G.C.SUITS.Diamonds
	G.ARGS.LOC_COLOURS.spade = G.C.SUITS.Spades
	G.ARGS.LOC_COLOURS.club = G.C.SUITS.Clubs

	for k, v in pairs(G.C) do
		if string.len(k) > 4 and string.sub(k, 1, 4) == 'COL_' then
			G.ARGS.LOC_COLOURS[string.lower(k)] = v
		end
	end

    return _Funcs.loc_colour(_c, _default)
end