return {
    descriptions = {
        Mod_Sticker = {
            c_col_job_well_done = {
                name = "Job Well Done",
                text = {
                    "Add a {C:money}Gold Star{}",
                    "to {C:attention}#1#{} selected",
                    "card in your hand",
                },
            },
        },
        Joker = {
            j_col_casper = {
                name = "Casper",
                text = {
                    "{C:red}-#1#{} Joker slot",
                    "After {C:attention}#2#{} rounds,",
                    "sell this card to",
                    "create a random",
                    "{C:legendary,E:1}Legendary{} Joker",
                    "{C:inactive}(Currently {C:attention}#3#{C:inactive}/#2#)",
                },
            },
            j_col_painting = {
                name = "Painting",
                text = {
                    "First played {C:attention}face",
                    "card gives {X:chips,C:white} X#1# {} Chips",
                    "when scored",
                },
            },
            j_col_confused_blueprint = {
                name = "Confused Blueprint",
                text = {
                    "Copies the ability of",
                    "{C:attention}Jokers{} to the left",
                    "and to the right"
                },
            },
            j_col_glass_house = {
                name = "Glass House",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:mult}Self destructs{} when",
                    "you play the same",
                    "{C:money}poker hand{} twice",
                    "in a row"
                },
            },
            j_col_one_fish = {
                name = "One Fish",
                text = {
                    "{C:mult}+#1#{} Mult, or {X:mult,C:white}X#2#{} Mult",
                    "when paired with at",
                    "least 1 other",
                    "{C:purple}Seuss Joker{}"
                },
            },
            j_col_two_fish = {
                name = "Two Fish",
                text = {
                    "{C:mult}+#1#{} Mult, or {X:mult,C:white}X#2#{} Mult",
                    "when paired with at",
                    "least 1 other",
                    "{C:purple}Seuss Joker{}"
                },
            },
            j_col_red_fish = {
                name = "Red Fish",
                text = {
                    "{C:mult}+#1#{} Mult, or {X:mult,C:white}X#2#{} Mult",
                    "when paired with at",
                    "least 1 other",
                    "{C:purple}Seuss Joker{}"
                },
            },
            j_col_blue_fish = {
                name = "Blue Fish",
                text = {
                    "{C:mult}+#1#{} Mult, or {X:mult,C:white}X#2#{} Mult",
                    "when paired with at",
                    "least 1 other",
                    "{C:purple}Seuss Joker{}"
                },
            },
        },
        Other = {
            col_seuss_jokers = {
                name = "Seuss Jokers",
                text = {
                    "{C:attention}#1#{}, {C:attention}#2#{},",
                    "{C:attention}#3#{}, and {C:attention}#4#{}",
                    "are {C:purple}Seuss Jokers{}",
                },
            },
            p_col_sticker_pack_normal = {
                name = "Sticker Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:col_sticker} Sticker{} cards",
                },
            },
            p_col_sticker_pack_jumbo = {
                name = "Jumbo Sticker Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:col_sticker} Sticker{} cards",
                },
            },
            p_col_sticker_pack_mega = {
                name = "Mega Sticker Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:col_sticker} Sticker{} cards",
                },
            },
            p_col_collectable_pack_normal = {
                name = "Collectable Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:collectables} Collectable{} Jokers",
                },
            },
            p_col_collectable_pack_jumbo = {
                name = "Jumbo Collectable Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:collectables} Collectable{} Jokers",
                },
            },
            p_col_collectable_pack_mega = {
                name = "Mega Collectable Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:collectables} Collectable{} Jokers",
                },
            },
            col_gold_star_seal = {
                name = "Gold Star",
                text = {
                    "Earn {C:money}$#1#{} when this",
                    "card is played",
                    "and scored",
                },
            },
        },
    },
    misc = {
        labels = {
            col_gold_star_seal = "Gold Star",
        },
        dictionary = {
            k_col_sticker_pack = "Sticker Pack",
            k_col_collectable_pack = "Collectable Pack",
            
            k_mod_sticker = "Sticker",
            b_mod_sticker_cards = "Sticker Cards",

            k_right_compatible = "right compatible",
            k_right_incompatible = "right incompatible",
            k_left_compatible = "left compatible",
            k_left_incompatible = "left incompatible",
        },
        mod_config = {
            -- [START] Item Names
            name_mod_sticker = "Sticker Cards",
            name_mod_job_well_done = "Job Well Done",
            name_mod_glass_house = "Glass House",
            name_mod_one_fish = "One Fish",
            name_mod_two_fish = "Two Fish",
            name_mod_red_fish = "Red Fish",
            name_mod_blue_fish = "Blue Fish",
            name_mod_casper = "Casper",
            name_mod_painting = "Painting",
            name_mod_confused_blueprint = "Confused Blueprint",
            -- [END] Item Names


            -- [START] Misc Strings
            misc_enabled = "Enabled",
            misc_disabled = "Disabled",
            misc_enable_item = "Enable Item",
            misc_shop_rate = "Shop Rate",
            misc_shop_cost = "Shop Cost",
            misc_mult_increase_rate = "Mult Increase Rate",
            misc_x_mult_value = "X Mult Value",
            misc_x_chip_value = "X Chip Value",
            -- [END] Misc Strings


            -- [START] Template Strings
            template_edit = "Edit %s",
            template_editting = "Editting %s",
            template_current = "Current: %s",
            template_current_state = "Current State: %s",
            template_current_value = "Current Value: %s",
            template_current_var = "Current %s: %s",
            -- [END] Template Strings


            -- [START] Mod Settings Menu
            men_mod_items = "Mod Items",
            men_mod_items_reset_items_settings = "Reset Item Settings",
            men_mod_items_edit_consumable_types = "Edit Consumable Types",
            men_mod_items_edit_consumables = "Edit Consumables",
            men_mod_items_edit_boosters = "Edit Boosters",
            men_mod_items_edit_seals = "Edit Seals",
            men_mod_items_edit_jokers = "Edit Jokers",
            -- [END] Mod Settings Menu
        }
    },
}

-- local stuct = {
--     descriptions = {
--         Other = {},
--         Back = {},
--         Blind = {},
--         Edition = {},
--         Enhanced = {},
--         Joker = {},
--         Planet = {},
--         Spectral = {},
--         Stake = {},
--         Tag = {},
--         Tarot = {},
--         Voucher = {},
--     },
--     misc = {
--         achievement_descriptions = {},
--         achievement_names = {},
--         blind_states = {},
--         challenge_names = {},
--         collabs = {},
--         dictionary = {},
--         high_scores = {},
--         labels = {},
--         poker_hand_descriptions = {},
--         poker_hands = {},
--         quips = {},
--         ranks = {},
--         suits_plural = {},
--         suits_singular = {},
--         tutorial = {},
--         v_dictionary = {},
--         v_text = {},
--     },
-- }