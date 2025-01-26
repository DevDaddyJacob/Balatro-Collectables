local normal = Collectables.utils.copyRawBooster("stickerPack")

normal.key = normal.key .. "_normal"
normal.config = { extra = 2, choose = 1 }
normal.pos = { x = 1, y = 0 }
normal.cost = 4
normal.weight = 0.96

return {
    order = 1,
    data = normal,
    isEnabled = function(resourceType, itemKey)
        return Collectables.utils.defaultItemIsEnabled(resourceType, itemKey) 
            and Collectables.utils.defaultItemIsEnabled("ConsumableType", "Mod_Sticker")
    end
}