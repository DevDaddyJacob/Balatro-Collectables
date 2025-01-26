return {
    ["discoverAll"] = true,
    ["itemTypes"] = {
        ["ConsumableType"] = { enabled = true },
        ["Consumable"] = { enabled = true },
        ["Booster"] = { enabled = true },
        ["Seal"] = { enabled = true },
        ["Joker"] = { enabled = true },
    },
    ["items"] = {
        -- Consumable Types [resources/consumableTypes]
        ["ConsumableType"] = {
            -- Mod Sticker (aka Sticker Cards) [resources/consumableTypes/modSticker.lua]
            ["Mod_Sticker"] = {
                enabled = true,
                shopRate = 0.0,
            },
        },

        -- Consumables [resources/consumables]
        ["Consumable"] = {
            -- Job Well Done [resources/consumables/jobWellDone.lua]
            ["job_well_done"] = {
                enabled = true,
            },
        },

        -- Jokers [resources/jokers]
        ["Joker"] = {
            -- One Fish [resources/jokers/oneFish.lua]
            ["one_fish"] = {
                enabled = true,
                cost = 8,
            },

            -- Two Fish [resources/jokers/twoFish.lua]
            ["two_fish"] = {
                enabled = true,
                cost = 8,
            },

            -- Red Fish [resources/jokers/redFish.lua]
            ["red_fish"] = {
                enabled = true,
                cost = 8,
            },

            -- Blue Fish [resources/jokers/blueFish.lua]
            ["blue_fish"] = {
                enabled = true,
                cost = 8,
            },
        }
    }
}