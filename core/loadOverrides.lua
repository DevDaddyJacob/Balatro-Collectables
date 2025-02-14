-- Create the storage table for our raw version of the functions we fuck up
Collectables.raw_overrides = {}

local folderPath = ("%s/core/overrides"):format(SMODS.current_mod.path)
local files = NFS.getDirectoryItems(folderPath)
for _, file in ipairs(files) do
    Collectables.print(("Loading overrides from file \"%s\" (Folder: \"%s/%s\")"):format(file, "core/overrides", file))

    local f, err = SMODS.load_file(("%s/%s"):format("core/overrides", file))
    if err then
        Collectables.print("Error loading overrides file: " .. err)
        goto continue
    end

    f()
    
    ::continue::
end