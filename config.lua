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
            -- Glass House [resources/jokers/glassHouse.lua]
            ["glass_house"] = {
                enabled = true,
                cost = 5,
                xMult = 4,
            },

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

            -- Casper [resources/jokers/casper.lua]
            ["casper"] = {
                enabled = true,
                cost = 12,
                reducedJokerSlots = 1,
                roundsUntilActive = 5,
            },

            -- Painting [resources/jokers/painting.lua]
            ["painting"] = {
                enabled = true,
                cost = 5,
                xChips = 2,
            },

            -- Confused Blueprint [resources/jokers/confusedBlueprint.lua]
            ["confused_blueprint"] = {
                enabled = true,
                cost = 8,
            },
        }
    }
}