-- Create some global things
Collectables = {}
Collectables.modPath = SMODS.current_mod.path
Collectables.config = SMODS.current_mod.config
Collectables.loadState = copy_table(Collectables.config)
Collectables.defaultConfig = SMODS.load_file("config.lua")()

local function load_module(_module, path)
    print(("Loading %s module (%s)"):format(_module, path))
    local f, err = SMODS.load_file(path)

    if err then
        print(("Error loading module %s (%s): %s"):format(_module, path, err))
        return
    end

    if f == nil then
        print(("Module file %s is empty"):format(file))
        return
    end
    
    f()
end

-- Load the utility methods
load_module("utilities", "core/utils.lua")

-- Load the modded resources into the object buffer
Collectables.utils.loadModdedItemsToBuffer(
    { "Atlas", "resources/atlases" },
    { "ConsumableType", "resources/consumableTypes" },
    { "Seal", "resources/seals" },
    { "Consumable", "resources/consumables" },
    { "Booster", "resources/boosters" },
    { "Joker", "resources/jokers" }
)

-- Load the config
load_module("config", "core/config.lua")

-- Load the method overrides
load_module("overrides", "core/loadOverrides.lua")

-- Load the modded resources
load_module("resources", "core/loadResources.lua")
