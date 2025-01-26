Collectables.utils = {}

function Collectables.utils.hasTalisman()
    return ((SMODS.find_mod("Talisman") or {})[1] or {}).can_load == true
end

function Collectables.utils.bigNum(num)
    if Collectables.utils.hasTalisman() then
        return to_big(num)
    else
        return num
    end
end

function Collectables.utils.stringEndsWith(string, suffix)
    return string:sub(-#suffix) == suffix
end

function Collectables.utils.getItemConfig(itemType, itemKey)
    if not Collectables.config.items or not Collectables.config.items[itemType] then
        return {}
    end

    return Collectables.config.items[itemType][itemKey] or {}
end

function Collectables.utils.copyRawBooster(name)
    local rawFile, err = SMODS.load_file(("resources/boosters/%s/raw.lua"):format(name))

    if err then
        print(("Error loading raw booster %s: %s"):format(name, err))
        return nil
    end

    if rawFile == nil then
        print(("Raw booster %s is empty"):format(name))
        return nil
    end

    local rawBooster = rawFile()
    return copy_table(rawBooster)
end

function Collectables.utils.defaultItemIsEnabled(resourceType, itemKey)
    if resourceType == "Atlas" then
        return true
    end

    local typeCfg = Collectables.config["itemTypes"][resourceType]
    if typeCfg ~= nil and typeCfg.enabled == false then
        return false
    end

    local itemTypeCfg = Collectables.config["items"][resourceType]
    if itemTypeCfg ~= nil then
        local itemCfg = itemTypeCfg[itemKey]
        if itemCfg ~= nil and itemCfg.enabled == false then
            return false
        end
    end

    return true
end

function Collectables.utils.getItemFiles(...)
    local itemFiles = {}
    local resources = { ... }

    for _, resourceEntry in ipairs(resources) do
        
        -- Validate the resource type
        local resourceType = resourceEntry[1]
        if SMODS[resourceType] == nil then
            goto continue
        end

        
        -- Fetch the contents of the folder
        local folder = resourceEntry[2]
        local folderPath = Collectables.modPath .. folder
        local folderContents = NFS.getDirectoryItems(folderPath)

        -- Load each of the files
        for _, item in ipairs(folderContents) do
            local isLuaFile = Collectables.utils.stringEndsWith(item, ".lua")

            if resourceType == "Booster" and not isLuaFile then
                local boosterFolder = ("%s/%s"):format(folder, item)
                local boosterFolderPath = Collectables.modPath .. boosterFolder
                local boosterFolderContents = NFS.getDirectoryItems(boosterFolderPath)

                for __, boosterItem in ipairs(boosterFolderContents) do
                    local _isLuaFile = Collectables.utils.stringEndsWith(boosterItem, ".lua")

                    if _isLuaFile and boosterItem ~= "raw.lua" then
                        if not itemFiles[resourceType] then
                            itemFiles[resourceType] = {}
                        end

                        print(("Added %s to buffer for %s (%s/%s)"):format(boosterItem, resourceType, boosterFolder, boosterItem))
                        itemFiles[resourceType][#itemFiles[resourceType] + 1] = ("%s/%s"):format(boosterFolder, boosterItem)
                    end

                end
            else
                if not itemFiles[resourceType] then
                    itemFiles[resourceType] = {}
                end

                print(("Added %s to buffer for %s (%s/%s)"):format(item, resourceType, folder, item))
                itemFiles[resourceType][#itemFiles[resourceType] + 1] = ("%s/%s"):format(folder, item)
            end
        end

        ::continue::
    end

    return itemFiles
end

function Collectables.utils.loadModdedItemsToBuffer(...)
    -- If we have items in the buffer already, don't double up
    if Collectables.itemBuffer ~= nil then
        return
    end

    Collectables.itemBuffer = {}
    local itemTypesPaths = Collectables.utils.getItemFiles(...)

    for itemType, itemPaths in pairs(itemTypesPaths) do
        for index, itemPath in ipairs(itemPaths) do
            local itemObj = Collectables.utils.loadModItemFromPath(itemPath)

            print(itemType, index, itemPath)
            if itemObj ~= nil then
                if not Collectables.itemBuffer[itemType] then
                    Collectables.itemBuffer[itemType] = {}
                end
                Collectables.itemBuffer[itemType][#Collectables.itemBuffer[itemType] + 1] = itemObj
            end
        end
    end
end

function Collectables.utils.loadModItemFromPath(path)
    local f, err = SMODS.load_file(path)

    if err then
        print(("Error loading \"%s\": %s"):format(path, err))
        return nil
    end

    local obj = f()

    if not obj.data then
        return nil
    end

    if not obj.order then
        obj.order = 0
    end

    if not obj.name then
        obj.name = obj.data.key or path
    end

    if not obj.isEnabled then
        obj.isEnabled = Collectables.utils.defaultItemIsEnabled
    end

    return obj
end
