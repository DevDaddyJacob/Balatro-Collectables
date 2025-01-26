local ITEM_EDIT_CONFIGS = nil

local function loadItemEditConfigs()
    if ITEM_EDIT_CONFIGS then return end
    ITEM_EDIT_CONFIGS = {} 

    for itemType, items in pairs(Collectables.itemBuffer) do
        for _, item in ipairs(items) do
            if item and item.config then
                if type(item.config) == "function" then
                    item.config = item.config()
                end

                if item.config.key then
                    ITEM_EDIT_CONFIGS[item.config.key] = item.config
                end
            end
        end
    end
end

local function createEditMenuForItem(itemConfig, backButtonFunc)
    print("[createEditMenuForItem] Creating menu with func '" .. backButtonFunc .. "' for itemConfig '" .. itemConfig.key .. "'")
    local editNodes = {}

    -- Add each of the config items
    for index, configItem in ipairs(itemConfig.configItems) do
        local node = nil

        if configItem.type == "toggle" then
            node = { n = G.UIT.R, config = { align = "cm", padding = 0.1, },
                nodes = {
                    create_toggle({
                        col = true,
                        label = configItem.args.label,
                        ref_table = itemConfig.refTable,
                        ref_value = configItem.refValue,
                        callback = function(_setToggle)
                            local changeVal = 1
                            if itemConfig.refTable[configItem.refValue] == itemConfig.stateTable[configItem.refValue] then
                                changeVal = -1
                            end
                            SMODS.full_restart = SMODS.full_restart + changeVal
                        end
                    })
                }
            }
        elseif configItem.type == "slider" then
            -- TODO: Find easy way to track SMODS.full_restart value, maybe move to the exit to mod menu function?
            node = { n = G.UIT.R, config = { align = "cm", padding = 0.1, },
                nodes = {
                    create_slider({
                        label = configItem.args.label,
                        ref_table = itemConfig.refTable,
                        ref_value = configItem.refValue,
                        decimal_places = configItem.args.decimalPlaces,
                        min = configItem.args.min,
                        max = configItem.args.max,
                        w = configItem.args.w,
                        h = configItem.args.h,
                    })
                }
            }
        end

        if node then
            if type(configItem.label) == "table" then
                editNodes[#editNodes + 1] = { n = G.UIT.R, config = { align = "cm", padding = 0.1, },
                    nodes = {
                        {
                            n = G.UIT.T, 
                            config = configItem.label
                        }
                    }
                }
            end

            editNodes[#editNodes + 1] = node

            if index ~= #itemConfig.configItems then
                editNodes[#editNodes + 1] = { n = G.UIT.B, config = { w = 0.1, h = 0.5 } }
            end
        end
    end


    -- Spit out what every pile of shit we just made
    return create_UIBox_generic_options({
        back_func = backButtonFunc,
        contents = {
            {
                n = G.UIT.R, 
                config = {
                    align = "cm",
                    padding = 0.1,
                },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = {
                            align = "tm",
                            padding = 0.1,
                        },
                        nodes = {
                            {
                                n = G.UIT.T,
                                config = {
                                    text = localize("template_editting", "mod_config"):format(itemConfig.name),
                                    scale = 0.8,
                                    colour = G.C.UI.TEXT_LIGHT,
                                    shadow = true
                                }
                            },
                            {
                                n = G.UIT.B,
                                config = {
                                    w = 0.1,
                                    h = 1.0
                                }
                            },
                        }
                    },
                    {
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                            padding = 0.1,
                        },
                        nodes = editNodes
                    }
                }
            }
        }
    })
end

local function createEditButtonForItem(itemConfig, backButtonFunc)
    print("[createEditButtonForItem] Creating button with func '" .. backButtonFunc .. "' for itemConfig '" .. itemConfig.key .. "'")
    local buttonFuncName = ("col_mod_item_edit_%s"):format(itemConfig.key)

    if G.FUNCS[buttonFuncName] == nil then
        print("[createEditButtonForItem] Function '" .. buttonFuncName .. "' doesn't exist, creating it")
        G.FUNCS[buttonFuncName] = function(uiElem)
            G.SETTINGS.paused = true
            G.FUNCS.overlay_menu({
                definition = createEditMenuForItem(itemConfig, backButtonFunc)
            })
        end
    end

    return UIBox_button({
        button = buttonFuncName,
        label = { localize("template_edit", "mod_config"):format(itemConfig.name) },
        minw = 5
    })
end

local function createEditConsumableTypesMenu()
    loadItemEditConfigs()
    local consumableTypeBtns = {}
    for key, _ in pairs(Collectables.config.items["ConsumableType"]) do
        print("[createEditConsumableTypesMenu] Checking for " .. key)
        if ITEM_EDIT_CONFIGS[key] then
            print("[createEditConsumableTypesMenu] Making Button for " .. key)
            consumableTypeBtns[#consumableTypeBtns + 1] = createEditButtonForItem(ITEM_EDIT_CONFIGS[key], "col_edit_consumable_types")
            print("[createEditConsumableTypesMenu] Finished making button for " .. key)
        end
    end


    -- Sort the buttons into 3 columns
    print("[createEditConsumableTypesMenu] Sorting buttons")
    local columns = {
        {},
        {},
        {},
    }

    for index, button in ipairs(consumableTypeBtns) do
        local modIndex = index % 3
        if modIndex == 0 then
           modIndex = 3 
        end
        columns[modIndex][#columns[modIndex] + 1] = button
    end


    return create_UIBox_generic_options({
        back_func = "openModUI_DevJacob_Collectables",
        contents = {
            {
                n = G.UIT.C, 
                config = {
                    align = "cm",
                    padding = 0.1
                },
                nodes = {
                    {
                        n = G.UIT.R, 
                        config = {
                            align = "cl",
                            padding = 0.1
                        },
                        nodes = columns[1]
                    },
                    {
                        n = G.UIT.R, 
                        config = {
                            align = "cm",
                            padding = 0.1
                        },
                        nodes = columns[2]
                    },
                    {
                        n = G.UIT.R, 
                        config = {
                            align = "cr",
                            padding = 0.1
                        },
                        nodes = columns[3]
                    },
                }
            }
        }
    })
end

local function createEditConsumablesMenu()
    loadItemEditConfigs()
    local consumableBtns = {}
    for key, _ in pairs(Collectables.config.items["Consumable"]) do
        print("[createEditConsumablesMenu] Checking for " .. key)
        if ITEM_EDIT_CONFIGS[key] then
            print("[createEditConsumablesMenu] Making Button for " .. key)
            consumableBtns[#consumableBtns + 1] = createEditButtonForItem(ITEM_EDIT_CONFIGS[key], "col_edit_consumables")
            print("[createEditConsumablesMenu] Finished making button for " .. key)
        end
    end


    -- Sort the buttons into 3 columns
    print("[createEditConsumablesMenu] Sorting buttons")
    local columns = {
        {},
        {},
        {},
    }

    for index, button in ipairs(consumableBtns) do
        local modIndex = index % 3
        if modIndex == 0 then
           modIndex = 3 
        end
        columns[modIndex][#columns[modIndex] + 1] = button
    end


    return create_UIBox_generic_options({
        back_func = "openModUI_DevJacob_Collectables",
        contents = {
            {
                n = G.UIT.C, 
                config = {
                    align = "cm",
                    padding = 0.1
                },
                nodes = {
                    {
                        n = G.UIT.R, 
                        config = {
                            align = "cl",
                            padding = 0.1
                        },
                        nodes = columns[1]
                    },
                    {
                        n = G.UIT.R, 
                        config = {
                            align = "cm",
                            padding = 0.1
                        },
                        nodes = columns[2]
                    },
                    {
                        n = G.UIT.R, 
                        config = {
                            align = "cr",
                            padding = 0.1
                        },
                        nodes = columns[3]
                    },
                }
            }
        }
    })
end

local function createEditBoostersMenu()
    return create_UIBox_generic_options({
        back_func = "openModUI_DevJacob_Collectables",
        contents = {
            {
                n = G.UIT.C, 
                config = {
                    align = "cm",
                    padding = 0.1
                },
                nodes = {
                    { 
                        n = G.UIT.T, 
                        config = {
                            text = "Hello, world! (Boosters)",
                            colour = G.C.UI.TEXT_LIGHT,
                            scale = 0.5
                        }
                    }
                }
            }
        }
    })
end

local function createEditSealsMenu()
    return create_UIBox_generic_options({
        back_func = "openModUI_DevJacob_Collectables",
        contents = {
            {
                n = G.UIT.C, 
                config = {
                    align = "cm",
                    padding = 0.1
                },
                nodes = {
                    { 
                        n = G.UIT.T, 
                        config = {
                            text = "Hello, world! (Seals)",
                            colour = G.C.UI.TEXT_LIGHT,
                            scale = 0.5
                        }
                    }
                }
            }
        }
    })
end

local function createEditJokersMenu()
    loadItemEditConfigs()
    local jokerBtns = {}
    for key, _ in pairs(Collectables.config.items["Joker"]) do
        print("[createEditJokersMenu] Checking for " .. key)
        if ITEM_EDIT_CONFIGS[key] then
            print("[createEditJokersMenu] Making Button for " .. key)
            jokerBtns[#jokerBtns + 1] = createEditButtonForItem(ITEM_EDIT_CONFIGS[key], "col_edit_jokers")
            print("[createEditJokersMenu] Finished making button for " .. key)
        end
    end

    
    -- Sort the buttons into rows
    print("[createEditJokersMenu] Sorting buttons into rows")
    local rows = {}
    local currentRowNodes = {}

    for index, button in ipairs(jokerBtns) do
        currentRowNodes[#currentRowNodes + 1] = { n = G.UIT.C, config = { align = "cm", padding = 0.1 }, nodes = { button } }

        if #currentRowNodes >= 3 then
            rows[#rows + 1] = { n = G.UIT.R, config = { align = "cm", padding = 0.1 }, nodes = currentRowNodes }
            currentRowNodes = {}
        end
    end

    if #currentRowNodes > 0 then
        rows[#rows + 1] = { n = G.UIT.R, config = { align = "cm", padding = 0.1 }, nodes = currentRowNodes }
        currentRowNodes = {}
    end


    return create_UIBox_generic_options({
        back_func = "openModUI_DevJacob_Collectables",
        contents = {
            { n = G.UIT.C, config = { align = "cm", padding = 0.1 }, nodes = {
                { n = G.UIT.R, config = { align = "cm", padding = 0.1 }, nodes = rows }
            }}
        }
    })
end

local function createEditModItemsTab()
    return {
        label = localize("men_mod_items", "mod_config"),
        chosen = true,
        tab_definition_function = function()
            local resetConfigBtn = UIBox_button({
                button = "col_cfg_reset_config", 
                label = { localize("men_mod_items_reset_items_settings", "mod_config") },
                minw = 5
            })

            local editConsumableTypesBtn = UIBox_button({
                button = "col_edit_consumable_types", 
                label = { localize("men_mod_items_edit_consumable_types", "mod_config") },
                minw = 5
            })
            
            local editConsumablesBtn = UIBox_button({
                button = "col_edit_consumables", 
                label = { localize("men_mod_items_edit_consumables", "mod_config") },
                minw = 5
            })
            
            local editBoostersBtn = UIBox_button({
                button = "col_edit_boosters", 
                label = { localize("men_mod_items_edit_boosters", "mod_config") },
                minw = 5
            })
            
            local editSealsBtn = UIBox_button({
                button = "col_edit_seals", 
                label = { localize("men_mod_items_edit_seals", "mod_config") },
                minw = 5
            })
            
            local editJokersBtn = UIBox_button({
                button = "col_edit_jokers", 
                label = { localize("men_mod_items_edit_jokers", "mod_config") },
                minw = 5
            })

            return {
                n = G.UIT.ROOT,
                config = {
                    emboss = 0.05,
                    minh = 6,
                    r = 0.1,
                    minw = 10,
                    align = "cm",
                    padding = 0.2,
                    colour = G.C.BLACK,
                },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = {
                            align = "cm",
                            padding = 0.15,
                        },
                        nodes = {
                            resetConfigBtn,
                            {
                                n = G.UIT.R,
                                config = {
                                    align = "tm",
                                    padding = 0.1,
                                },
                                nodes = {
                                    {
                                        n = G.UIT.B,
                                        config = {
                                            w = 0.1,
                                            h = 0.4
                                        }
                                    },
                                }
                            },
                            editConsumableTypesBtn,
                            editConsumablesBtn,
                            editBoostersBtn,
                            editSealsBtn,
                            editJokersBtn,
                        }
                    }
                }
            }
        end,
    }
end



function G.FUNCS.col_edit_consumable_types(uiElem)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu({
        definition = createEditConsumableTypesMenu()
    })
end

function G.FUNCS.col_edit_consumables(uiElem)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu({
        definition = createEditConsumablesMenu()
    })
end

function G.FUNCS.col_edit_boosters(uiElem)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu({
        definition = createEditBoostersMenu()
    })
end

function G.FUNCS.col_edit_seals(uiElem)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu({
        definition = createEditSealsMenu()
    })
end

function G.FUNCS.col_edit_jokers(uiElem)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu({
        definition = createEditJokersMenu()
    })
end

function G.FUNCS.col_cfg_reset_config(uiElem)
    G.SETTINGS.paused = true

    local setTableKeys = function(...) end
    setTableKeys = function(fromTbl, toTbl)
        for key, value in pairs(fromTbl) do
            if type(value) == "table" then
                setTableKeys(value, toTbl[key])
            else
                toTbl[key] = value
            end
        end
    end
    setTableKeys(Collectables.defaultConfig, Collectables.config)

    SMODS.full_restart = 1
    G.FUNCS.exit_mods(uiElem)
end

function SMODS.current_mod.extra_tabs()
    return {
        createEditModItemsTab()
    } 
end