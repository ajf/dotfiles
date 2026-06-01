-- Auto-generated file. Do not edit directly.
-- Remove require("dms.colors") from your config to override.

local primary     = "rgb(82aaff)"
local outline     = "rgb(444a73)"
local error_color = "rgb(ff757f)"

hl.config({
    general = {
        col = {
            active_border   = primary,
            inactive_border = outline,
        },
    },
    group = {
        col = {
            border_active          = primary,
            border_inactive        = outline,
            border_locked_active   = error_color,
            border_locked_inactive = outline,
        },
        groupbar = {
            col = {
                active          = primary,
                inactive        = outline,
                locked_active   = error_color,
                locked_inactive = outline,
            },
        },
    },
})
