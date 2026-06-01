-- Hyprland Configuration
-- https://wiki.hypr.land/Configuring/

-- ==================
-- STARTUP APPS
-- ==================
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user start hyprland-session.target")
    hl.exec_cmd("1password --silent")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("/usr/lib/mate-polkit/polkit-mate-authentication-agent-1")
    hl.exec_cmd("hyprsunset -t 4500")
    hl.exec_cmd("foot --title quake")
    hl.exec_cmd("wl-paste --watch cliphist store")
end)

-- ==================
-- ENVIRONMENT VARIABLES
-- ==================
hl.env("LIBVA_DRIVER_NAME",         "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- ==================
-- INPUT CONFIG
-- ==================
hl.config({
    input = {
        kb_layout          = "us",
        numlock_by_default = true,
        kb_options         = "caps:ctrl_modifier",
    },
})

hl.device({
    name           = "logitech-mx-master-3-1",
    natural_scroll = true,
})

-- ==================
-- GENERAL LAYOUT
-- ==================
hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 5,
        border_size = 2,
        layout      = "dwindle",
    },
})

-- ==================
-- DECORATION
-- ==================
hl.config({
    decoration = {
        rounding         = 12,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = true,
            range        = 30,
            render_power = 5,
            offset       = "0 5",
            color        = "rgba(00000070)",
        },
    },
})

-- ==================
-- ANIMATIONS
-- ==================
hl.config({
    animations = { enabled = true },
})

hl.animation({ leaf = "windowsIn",   enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "border",      enabled = true, speed = 3, bezier = "default" })

-- ==================
-- LAYOUTS
-- ==================
hl.config({
    dwindle = { preserve_split = true },
    master  = { mfact = 0.5 },
})

-- ==================
-- MISC
-- ==================
hl.config({
    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
    },
})

-- ==================
-- WINDOW RULES
-- ==================
hl.window_rule({ match = { class = "^(org\\.wezfurlong\\.wezterm)$" }, tile     = true })
hl.window_rule({ match = { class = "^(org\\.gnome\\.)" },              rounding = 12   })
hl.window_rule({ match = { class = "^(gnome-control-center)$" },       tile     = true })
hl.window_rule({ match = { class = "^(pavucontrol)$" },                tile     = true })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" },       tile     = true })
hl.window_rule({ match = { class = "^(gnome-calculator)$" },           float    = true })
hl.window_rule({ match = { class = "^(galculator)$" },                 float    = true })
hl.window_rule({ match = { class = "^(blueman-manager)$" },            float    = true })
hl.window_rule({ match = { class = "^(org\\.gnome\\.Nautilus)$" },     float    = true })
hl.window_rule({ match = { class = "^(xdg-desktop-portal)$" },         float    = true })
hl.window_rule({ match = { class = "^(zoom)$" },                       float    = true })

hl.window_rule({
    match = { class = "^(steam)$", title = "^(notificationtoasts)" },
    pin   = true,
})

hl.window_rule({
    match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
    float = true,
})

-- DMS windows: Hyprland doesn't size these correctly so float is disabled
-- hl.window_rule({ match = { class = "^(org%.quickshell)$" }, float = true })

hl.layer_rule({
    match   = { namespace = "^(quickshell)$" },
    no_anim = true,
})

-- ==================
-- SPECIAL BINDS
-- ==================
hl.bind("SUPER + grave",     hl.dsp.workspace.toggle_special("quake"))
hl.bind("SUPER + backslash", hl.dsp.exec_cmd("1password --quick-access"))

-- ==================
-- SOURCED CONFIGS
-- ==================
require("dms.outputs")
require("dms.layout")
require("dms.cursor")
require("dms.binds")
