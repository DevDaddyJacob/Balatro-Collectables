local function registerModdedResources()
    print("==============================")
    -- Register the objects
    print("")
    print("Registering modded resources...")

    for _type, resources in pairs(Collectables.itemBuffer) do
        print("")
        print(("\tRegistering x%d resource(s) for type \"%s\""):format(#resources, _type))
        
        table.sort(resources, function(a, b) return a.order < b.order end)

        for i = 1, #resources do
            local resource = resources[i]
            if not resource.isEnabled(_type, resource.data.key) then
                print(("\t\tSkipping registration for \"%s\" because it's disabled"):format(resource.name))
                goto continue
            end

            print(("\t\tRegistering \"%s\""):format(resource.name))
            if resource.post_process and type(resource.post_process) == "function" then
                resource:post_process()
            end
            SMODS[_type](resource.data)

            ::continue::
        end
    end
    print("==============================")
end

registerModdedResources()
