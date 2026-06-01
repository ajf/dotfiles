local M = "SUPER"

-- === Application Launchers ===
hl.bind(M .. " + T",           hl.dsp.exec_cmd("ghostty"))
hl.bind(M .. " + space",       hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(M .. " + V",           hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind(M .. " + M",           hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))
hl.bind(M .. " + comma",       hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"))
hl.bind(M .. " + N",           hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind(M .. " + SHIFT + N",   hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind(M .. " + Y",           hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind(M .. " + TAB",         hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))
hl.bind(M .. " + X",           hl.dsp.exec_cmd("dms ipc call powermenu toggle"))

-- === Cheat Sheet ===
hl.bind(M .. " + SHIFT + Slash", hl.dsp.exec_cmd("dms ipc call keybinds toggle hyprland"))

-- === Security ===
hl.bind(M .. " + ALT + L",      hl.dsp.exec_cmd("dms ipc call lock lock"))
hl.bind(M .. " + SHIFT + E",    hl.dsp.exit())
hl.bind("CTRL + ALT + Delete",  hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))

-- === Audio Controls ===
hl.bind("XF86AudioRaiseVolume",        hl.dsp.exec_cmd("dms ipc call audio increment 3"),  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",        hl.dsp.exec_cmd("dms ipc call audio decrement 3"),  { locked = true, repeating = true })
hl.bind("XF86AudioMute",               hl.dsp.exec_cmd("dms ipc call audio mute"),          { locked = true })
hl.bind("XF86AudioMicMute",            hl.dsp.exec_cmd("dms ipc call audio micmute"),       { locked = true })
hl.bind("XF86AudioPause",              hl.dsp.exec_cmd("dms ipc call mpris playPause"),     { locked = true })
hl.bind("XF86AudioPlay",               hl.dsp.exec_cmd("dms ipc call mpris playPause"),     { locked = true })
hl.bind("XF86AudioPrev",               hl.dsp.exec_cmd("dms ipc call mpris previous"),      { locked = true })
hl.bind("XF86AudioNext",               hl.dsp.exec_cmd("dms ipc call mpris next"),          { locked = true })
hl.bind("CTRL + XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call mpris increment 3"),  { locked = true, repeating = true })
hl.bind("CTRL + XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call mpris decrement 3"),  { locked = true, repeating = true })

-- === Brightness Controls ===
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd([[dms ipc call brightness increment 5 ""]]), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd([[dms ipc call brightness decrement 5 ""]]), { locked = true, repeating = true })

-- === Window Management ===
hl.bind(M .. " + Q",         hl.dsp.window.close())
hl.bind(M .. " + F",         hl.dsp.window.fullscreen(1))
hl.bind(M .. " + SHIFT + F", hl.dsp.window.fullscreen(0))
hl.bind(M .. " + SHIFT + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(M .. " + W",         hl.dsp.group.toggle())
hl.bind(M .. " + SHIFT + W", hl.dsp.exec_cmd("dms ipc call window-rules toggle"))

-- === Focus Navigation ===
hl.bind(M .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(M .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(M .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(M .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(M .. " + H",     hl.dsp.focus({ direction = "left" }))
hl.bind(M .. " + J",     hl.dsp.focus({ direction = "down" }))
hl.bind(M .. " + K",     hl.dsp.focus({ direction = "up" }))
hl.bind(M .. " + L",     hl.dsp.focus({ direction = "right" }))

-- === Window Movement ===
hl.bind(M .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(M .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))
hl.bind(M .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(M .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(M .. " + SHIFT + H",     hl.dsp.window.move({ direction = "left" }))
hl.bind(M .. " + SHIFT + J",     hl.dsp.window.move({ direction = "down" }))
hl.bind(M .. " + SHIFT + K",     hl.dsp.window.move({ direction = "up" }))
hl.bind(M .. " + SHIFT + L",     hl.dsp.window.move({ direction = "right" }))

-- === Column Navigation ===
hl.bind(M .. " + Home", hl.dsp.focus({ window = "first" }))
hl.bind(M .. " + End",  hl.dsp.focus({ window = "last" }))

-- === Monitor Navigation ===
hl.bind(M .. " + CTRL + left",  hl.dsp.focus({ monitor = "l" }))
hl.bind(M .. " + CTRL + right", hl.dsp.focus({ monitor = "r" }))
hl.bind(M .. " + CTRL + H",     hl.dsp.focus({ monitor = "l" }))
hl.bind(M .. " + CTRL + J",     hl.dsp.focus({ monitor = "d" }))
hl.bind(M .. " + CTRL + K",     hl.dsp.focus({ monitor = "u" }))
hl.bind(M .. " + CTRL + L",     hl.dsp.focus({ monitor = "r" }))

-- === Move to Monitor ===
hl.bind(M .. " + SHIFT + CTRL + left",  hl.dsp.window.move({ monitor = "l" }))
hl.bind(M .. " + SHIFT + CTRL + down",  hl.dsp.window.move({ monitor = "d" }))
hl.bind(M .. " + SHIFT + CTRL + up",    hl.dsp.window.move({ monitor = "u" }))
hl.bind(M .. " + SHIFT + CTRL + right", hl.dsp.window.move({ monitor = "r" }))
hl.bind(M .. " + SHIFT + CTRL + H",     hl.dsp.window.move({ monitor = "l" }))
hl.bind(M .. " + SHIFT + CTRL + J",     hl.dsp.window.move({ monitor = "d" }))
hl.bind(M .. " + SHIFT + CTRL + K",     hl.dsp.window.move({ monitor = "u" }))
hl.bind(M .. " + SHIFT + CTRL + L",     hl.dsp.window.move({ monitor = "r" }))

-- === Workspace Navigation ===
hl.bind(M .. " + Page_Down",    hl.dsp.focus({ workspace = "e+1" }))
hl.bind(M .. " + Page_Up",      hl.dsp.focus({ workspace = "e-1" }))
hl.bind(M .. " + U",            hl.dsp.focus({ workspace = "e+1" }))
hl.bind(M .. " + I",            hl.dsp.focus({ workspace = "e-1" }))
hl.bind(M .. " + CTRL + down",  hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(M .. " + CTRL + up",    hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(M .. " + CTRL + U",     hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(M .. " + CTRL + I",     hl.dsp.window.move({ workspace = "e-1" }))

-- === Workspace Management ===
hl.bind("CTRL + SHIFT + R", hl.dsp.exec_cmd("dms ipc call workspace-rename open"))

-- === Move to Adjacent Workspace ===
hl.bind(M .. " + SHIFT + Page_Down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(M .. " + SHIFT + Page_Up",   hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(M .. " + SHIFT + U",         hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(M .. " + SHIFT + I",         hl.dsp.window.move({ workspace = "e-1" }))

-- === Mouse Wheel Navigation ===
hl.bind(M .. " + mouse_down",        hl.dsp.focus({ workspace = "e+1" }))
hl.bind(M .. " + mouse_up",          hl.dsp.focus({ workspace = "e-1" }))
hl.bind(M .. " + CTRL + mouse_down", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(M .. " + CTRL + mouse_up",   hl.dsp.window.move({ workspace = "e-1" }))

-- === Numbered Workspaces ===
for i = 1, 9 do
    hl.bind(M .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(M .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- === Column Management ===
hl.bind(M .. " + bracketleft",  hl.dsp.layout("preselect l"))
hl.bind(M .. " + bracketright", hl.dsp.layout("preselect r"))

-- === Sizing & Layout ===
hl.bind(M .. " + R",        hl.dsp.layout("togglesplit"))
--hl.bind(M .. " + CTRL + F", hl.dsp.window.resize({ x = "100%", y = "100%", relative = false }))

-- === Move/resize windows with mouse dragging ===
hl.bind(M .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "Move window" })
hl.bind(M .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- === Resize with keycodes (code:20 = minus, code:21 = equal on US layout) ===
hl.bind(M .. " + code:20", hl.dsp.window.resize({ x = -100, y = 0 }), { description = "Expand window left" })
hl.bind(M .. " + code:21", hl.dsp.window.resize({ x = 100, y = 0 }),  { description = "Shrink window left" })

-- === Manual Sizing ===
--hl.bind(M .. " + minus",         hl.dsp.window.resize({ x = "-10%", y = 0 }),  { repeating = true })
--hl.bind(M .. " + equal",         hl.dsp.window.resize({ x = "10%", y = 0 }),   { repeating = true })
--hl.bind(M .. " + SHIFT + minus", hl.dsp.window.resize({ x = 0, y = "-10%" }),  { repeating = true })
--hl.bind(M .. " + SHIFT + equal", hl.dsp.window.resize({ x = 0, y = "10%" }),   { repeating = true })

-- === Screenshots ===
hl.bind(M .. " + CTRL + 3", hl.dsp.exec_cmd("dms screenshot full"))
hl.bind(M .. " + CTRL + 4", hl.dsp.exec_cmd("dms screenshot"))
hl.bind(M .. " + CTRL + 5", hl.dsp.exec_cmd("dms screenshot window"))

-- === System Controls ===
hl.bind(M .. " + SHIFT + P", hl.dsp.dpms("toggle"))
