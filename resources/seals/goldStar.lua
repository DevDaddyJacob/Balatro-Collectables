local gold_star = {
    key = "gold_star",
    name = "col-Gold-Star",
    badge_colour = HEX("F7AF38"),
    discovered = Collectables.config.discoverAll,
    atlas = "seals_atlas",
    pos = { x = 1, y = 0 },
    config = {
        money_amount = 5
    },
    loc_vars = function(self, info_queue)
        return {
            vars = {
                self.config.money_amount
            }
        }
    end,
    get_p_dollars = function(self, card)
        return self.config.money_amount
    end,
}

return {
    data = gold_star
}