local function registerModdedResources()
    Collectables.print("==============================")
    -- Register the objects
    Collectables.print("")
    Collectables.print("Registering modded resources...")

    for _type, resources in pairs(Collectables.itemBuffer) do
        Collectables.print("")
        Collectables.print(("\tRegistering x%d resource(s) for type \"%s\""):format(#resources, _type))
        
        table.sort(resources, function(a, b) return a.order < b.order end)

        for i = 1, #resources do
            local resource = resources[i]
            if not resource.isEnabled(_type, resource.data.key) then
                Collectables.print(("\t\tSkipping registration for \"%s\" because it's disabled"):format(resource.name))
                goto continue
            end

            Collectables.print(("\t\tRegistering \"%s\""):format(resource.name))
            if resource.post_process and type(resource.post_process) == "function" then
                resource:post_process()
            end
            SMODS[_type](resource.data)

            
            if _type == "Joker" then 
                Collectables.pools.Jokers = Collectables.pools.Jokers or {}
                Collectables.pools.Jokers[resource.data.rarity] = Collectables.pools.Jokers[resource.data.rarity] or {}
                
                local _rarityPool = Collectables.pools.Jokers[resource.data.rarity]
                _rarityPool[#_rarityPool + 1] = resource.data.key
            end


            ::continue::
        end
    end
    Collectables.print("")
    Collectables.print("==============================")
    

    Collectables.print("")
    Collectables.print("==============================")
    Collectables.print("")
    
    Collectables.print("Collectable Pools:")
    for key, pool in pairs(Collectables.pools) do
        Collectables.print("")
        Collectables.print(("\t%s Pool"):format(key))
        
        if key == "Jokers" then
            for rarity, rarityPool in pairs(pool) do
                Collectables.print(("\t\tx %d %s Rarity Jokers"):format(#rarityPool, rarity))
                for i = 1, #rarityPool do
                    Collectables.print(("\t\t\t- %s"):format(rarityPool[i]))
                end
            end
        else
            for i = 1, #pool do
                Collectables.print(("\t\t\t- %s"):format(pool[i]))
            end
        end
    
    end
    
    Collectables.print("")
    Collectables.print("==============================")
end

registerModdedResources()
