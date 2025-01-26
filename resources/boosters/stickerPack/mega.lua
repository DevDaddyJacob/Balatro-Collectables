local mega = Collectables.utils.copyRawBooster("stickerPack")

mega.key = mega.key .. "_mega"
mega.config = { extra = 4, choose = 2 }
mega.pos = { x = 3, y = 1 }
mega.cost = 8
mega.weight = 0.12

return {
    order = 3,
    data = mega,
    isEnabled = function(resourceType, itemKey)
        return Collectables.utils.defaultItemIsEnabled(resourceType, itemKey) 
            and Collectables.utils.defaultItemIsEnabled("ConsumableType", "Mod_Sticker")
    end
}