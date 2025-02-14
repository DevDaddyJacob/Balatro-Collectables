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

            ::continue::
        end
    end
    Collectables.print("==============================")
end

registerModdedResources()
