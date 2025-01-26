local jumbo = Collectables.utils.copyRawBooster("stickerPack")

jumbo.key = jumbo.key .. "_jumbo"
jumbo.config = { extra = 4, choose = 1 }
jumbo.pos = { x = 2, y = 1 }
jumbo.cost = 6
jumbo.weight = 0.48

return {
    order = 2,
    data = jumbo,
    isEnabled = function(resourceType, itemKey)
        return Collectables.utils.defaultItemIsEnabled(resourceType, itemKey) 
            and Collectables.utils.defaultItemIsEnabled("ConsumableType", "Mod_Sticker")
    end
}