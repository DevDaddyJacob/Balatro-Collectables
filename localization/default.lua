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
            j_col_bloomer = {
                name = "Bloomer",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "for every {C:money}$1 interest{} earned at",
                    "the end of the round",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
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
            
            k_mod_sticker = "Sticker",
            b_mod_sticker_cards = "Sticker Cards",
        },
        mod_config = {
            -- [START] Item Names
            name_mod_sticker = "Sticker Cards",
            name_mod_job_well_done = "Job Well Done",
            name_mod_bloomer = "Bloomer",
            name_mod_one_fish = "One Fish",
            name_mod_two_fish = "Two Fish",
            name_mod_red_fish = "Red Fish",
            name_mod_blue_fish = "Blue Fish",
            -- [END] Item Names


            -- [START] Misc Strings
            misc_enabled = "Enabled",
            misc_disabled = "Disabled",
            misc_enable_item = "Enable Item",
            misc_shop_rate = "Shop Rate",
            misc_shop_cost = "Shop Cost",
            misc_mult_increase_rate = "Mult Increase Rate",
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