local normal = Collectables.utils.copyRawBooster("collectablePack")

normal.key = normal.key .. "_normal"
normal.config = { extra = 2, choose = 1 }
normal.pos = { x = 1, y = 0 }
normal.cost = 4
normal.weight = 0.96

return {
    order = 4,
    data = normal,
}