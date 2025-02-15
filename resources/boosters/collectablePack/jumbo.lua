local jumbo = Collectables.utils.copyRawBooster("collectablePack")

jumbo.key = jumbo.key .. "_jumbo"
jumbo.config = { extra = 4, choose = 1 }
jumbo.pos = { x = 2, y = 0 }
jumbo.cost = 6
jumbo.weight = 0.48

return {
    order = 5,
    data = jumbo
}