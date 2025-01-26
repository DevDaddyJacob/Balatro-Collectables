Collectables.raw_overrides.game = {}
local _Game = Collectables.raw_overrides.game

_Game.update_round_eval = Game.update_round_eval
function Game:update_round_eval(deltaTime)
    _Game.update_round_eval(self, deltaTime) -- Execute after modded code
end


_Game.init_game_object = Game.init_game_object
function Game:init_game_object()
    local game = _Game.init_game_object(self)
    return game
end


_Game.update = Game.update
function Game:update(deltaTime)
    _Game.update(self, deltaTime) -- Execute before modded code

    -- Handle colour gradients

end