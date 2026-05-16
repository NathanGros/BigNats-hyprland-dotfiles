local mainMod = "SUPER"

local minecraft = "prime-run prismlauncher"
local browser = "prime-run zen-browser"
local filemanager = "nautilus"
local discord = "vesktop"
local terminal = "foot"
local lock = "hyprlock"
local appmenu = "~/.config/hypr/scripts/appmenu_toggle.sh"
local clipboard = "~/.config/hypr/scripts/clipboard_toggle.sh"
local logout = "~/.config/hypr/scripts/logout_toggle.sh"
local network = "~/.config/hypr/scripts/wifilist_toggle.sh"
local networkssl = "luakit http://neverssl.com"
local recording = "~/.config/hypr/scripts/recording_toggle.sh"
local screenshot = "~/.config/hypr/scripts/screenshotlist.sh"
local screenshottext = "~/.config/hypr/scripts/screenshot_text.sh"
local todo = "~/.config/hypr/scripts/todo_toggle.sh"
local updates = "~/.config/hypr/scripts/updates_toggle.sh"
local waybar = "~/.config/hypr/scripts/waybar_toggle.sh"

-- Quick Launchers
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(discord))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(filemanager))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(minecraft))

-- General
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(network))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(networkssl))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(recording))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(appmenu))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(waybar))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(todo))
hl.bind("Print", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(screenshottext))

-- System
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(logout))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(updates))

-- ##################
-- # Window Control #
-- ##################

-- Misc
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + J", hl.dsp.layout("fit visible"))
hl.bind(mainMod .. " + K", hl.dsp.layout("promote"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + T", hl.dsp.window.float())

-- Resize windows with mainMod + Control + arrow keys
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.layout("colresize +conf"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {mouse = true})

-- Move windows around with mainMod + Shift + arrow keys
hl.bind(mainMod .. " + CTRL + Left", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + CTRL + Right", hl.dsp.layout("swapcol r"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + Left", hl.dsp.focus({direction = "l"}))
hl.bind(mainMod .. " + Right", hl.dsp.focus({direction = "r"}))
hl.bind(mainMod .. " + Up", hl.dsp.focus({workspace = "r-1"}))
hl.bind(mainMod .. " + Down", hl.dsp.focus({workspace = "r+1"}))

-- Move active window to a workspace with mainMod + SHIFT + [1-5]
hl.bind(mainMod .. " + SHIFT + code:10", hl.dsp.window.move({workspace = 1}))
hl.bind(mainMod .. " + SHIFT + code:11", hl.dsp.window.move({workspace = 2}))
hl.bind(mainMod .. " + SHIFT + code:12", hl.dsp.window.move({workspace = 3}))
hl.bind(mainMod .. " + SHIFT + code:13", hl.dsp.window.move({workspace = 4}))
hl.bind(mainMod .. " + SHIFT + code:14", hl.dsp.window.move({workspace = 5}))

-- #####################
-- # Workspace Control #
-- #####################

-- Switch workspaces with mainMod + [1-5]
hl.bind(mainMod .. " + code:10", hl.dsp.focus({workspace = 1}))
hl.bind(mainMod .. " + code:11", hl.dsp.focus({workspace = 2}))
hl.bind(mainMod .. " + code:12", hl.dsp.focus({workspace = 3}))
hl.bind(mainMod .. " + code:13", hl.dsp.focus({workspace = 4}))
hl.bind(mainMod .. " + code:14", hl.dsp.focus({workspace = 5}))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({workspace = "r-1"}))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({workspace = "r+1"}))


-- ########
-- # Misc #
-- ########

-- Blue filter shader -- Glitched due to hyprland 0.55 refresh changes
-- hl.bind(mainMod .. " + XF86MonBrightnessUp", function()
--     hl.config({decoration = {screen_shader = ''}})
-- end)
-- hl.bind(mainMod .. " + XF86MonBrightnessDown", function()
--     hl.config({decoration = {screen_shader = '~/.config/hypr/shaders/noblue.glsl'}})
-- end)

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1.0"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
