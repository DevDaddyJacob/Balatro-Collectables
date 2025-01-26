Collectables.raw_overrides.card = {}
local _Card = Collectables.raw_overrides.card

_Card.set_sprites = Card.set_sprites
function Card:set_sprites(_center, _front)
    _Card.set_sprites(self, _center, _front) -- Execute before modded code
end


_Card.can_use_consumeable = Card.can_use_consumeable
function Card:can_use_consumeable(any_state, skip_check)
    local ret = _Card.can_use_consumeable(self, any_state, skip_check)
    return ret
end


_Card.use_consumeable = Card.use_consumeable
function Card:use_consumeable(area, copier)
    local ret = _Card.use_consumeable(self, area, copier)
    return ret
end


_Card.calculate_joker = Card.calculate_joker
function Card:calculate_joker(context)
    local ret, trig = _Card.calculate_joker(self, context)
    return ret, trig
end