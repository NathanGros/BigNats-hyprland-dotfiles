-- layerrules
hl.layer_rule({match = {namespace = "swww-daemon"}, no_anim = true})
hl.layer_rule({match = {namespace = "selection"}, animation = "fade"})
hl.layer_rule({match = {namespace = "hyprpicker"}, animation = "fade"})
hl.layer_rule({
	match = {namespace = "logout_dialog"},
	animation = "fade",
	blur = true,
})

-- wofi
hl.window_rule({
	match = {class = "wofi"},
	animation = "fade 60%",
	pin = true,
})

-- c3 todo list
hl.window_rule({
	match = {title = "todo"},
	float = true,
	size = {600, 800},
	move =  {660, 65},
	pin = true,
})

-- jetbrains
-- fix tooltips (always have a title of `win.<id>`)
-- hl.window_rule({match = {class = ^(.*jetbrains.*)$, match:title ^(win.*)$, no_initial_focus on
-- hl.window_rule({match = {class = ^(.*jetbrains.*)$, match:title ^(win.*)$, nofocus on
-- hl.window_rule({match = {initial_class = jetbrains-toolbox, pin on
-- fix tab dragging (always have a single space character as their title)
-- hl.window_rule({match = {class = ^(.*jetbrains.*)$, match:title ^\\s$, no_initial_focus on

-- Zen Browser
hl.window_rule({
	match = {initial_class = "zen"},
	min_size = {450, 150},
})

-- Logisim
hl.window_rule({
	match = {initial_title = "^(.*Logisim-evolution\\ v4.0.0)$"},
	tile = true,
})
-- hl.window_rule({match = {class = "com-cburch-logisim-Main"}, no_initial_focus = true})

-- Steam
hl.window_rule({
	match = {class = "^(steam)$"},
	no_blur = true,
	no_shadow = true,
})
