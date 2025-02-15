local mega = Collectables.utils.copyRawBooster("collectablePack")

mega.key = mega.key .. "_mega"
mega.config = { extra = 4, choose = 2 }
mega.pos = { x = 3, y = 0 }
mega.cost = 8
mega.weight = 0.12

return {
    order = 6,
    data = mega,
}