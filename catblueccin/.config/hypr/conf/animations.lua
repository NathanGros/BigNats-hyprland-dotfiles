hl.config({animations = {
	enabled = true,
	workspace_wraparound = false,
}})

hl.curve("easeIn", {type = "bezier", points = {{0.22, 0.63}, {0.1, 1}}})
hl.curve("easeOut", {type = "bezier", points = {{0, 0.39}, {0.14, 1}}})
hl.curve("linear", {type = "bezier", points = {{0, 0}, {1, 1}}})
hl.curve("quick", {type = "bezier", points = {{0.15, 0}, {0.1, 1}}})
hl.curve("easeOutBack", {type = "bezier", points = {{0.34, 1.56}, {0.64, 1}}})

hl.animation({leaf = "global", enabled = true, speed = 5, bezier = "linear"})
hl.animation({leaf = "windowsIn", enabled = true, speed = 4, bezier = "easeOut", style = "popin"})
hl.animation({leaf = "windowsOut", enabled = true, speed = 1, bezier = "easeOut", style = "popin 60%"})
hl.animation({leaf = "windowsMove", enabled = true, speed = 5, bezier = "easeIn", style = "slide"})
hl.animation({leaf = "layers", enabled = true, speed = 5, bezier = "easeIn", style = "fade"})
hl.animation({leaf = "fade", enabled = true, speed = 5, bezier = "easeIn"})
hl.animation({leaf = "fadeIn", enabled = true, speed = 5, bezier = "easeIn"})
hl.animation({leaf = "fadeOut", enabled = true, speed = 5, bezier = "easeIn"})
hl.animation({leaf = "border", enabled = true, speed = 5, bezier = "easeIn"})
hl.animation({leaf = "borderangle", enabled = false, speed = 1, bezier = "linear", style = "once"})
hl.animation({leaf = "workspaces", enabled = true, speed = 5, bezier = "easeIn", style = "slidevert"})
hl.animation({leaf = "specialWorkspace", enabled = true, speed = 5, bezier = "easeIn", style = "slide"})
