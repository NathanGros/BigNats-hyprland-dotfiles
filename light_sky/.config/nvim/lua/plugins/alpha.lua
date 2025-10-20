return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			"                                                                       ",
			"                                                                       ",
			"                                                                     ",
			"       ████ ██████           █████      ██                     ",
			"      ███████████             █████                             ",
			"      █████████ ███████████████████ ███   ███████████   ",
			"     █████████  ███    █████████████ █████ ██████████████   ",
			"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
			"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
			" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
			"                                                                       ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  Open Tree", ":Neotree toggle<CR>"),
			dashboard.button("fr", "  Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("ff", "  Find File", ":Telescope find_files<CR>"),
			dashboard.button("fw", "󰈭  Find Word", ":Telescope live_grep<CR>"),
			dashboard.button("prog", "󰴉  Programming Folder", ":Neotree dir=~/Documents/programming/<CR>"),
			dashboard.button(
				"aoc",
				"󰚝  Advent of Code Folder",
				":Neotree dir=~/Documents/programming/advent_of_code/<CR>"
			),
			dashboard.button(
				"poly",
				"󰉌  Polytech Folder",
				":Neotree dir=~/Documents/scolaire/2024-2025_si3/cours/informatique/<CR>"
			),
			dashboard.button("conf", "󱁿  Nvim config", ":Neotree dir=~/.config/nvim/<CR>"),
			dashboard.button("m", "  Mappings", ":WhichKey<CR>"),
			dashboard.button("L", "  Open Lazy", ":Lazy<CR>"),
			dashboard.button("M", "  Open Mason", ":Mason<CR>"),
			dashboard.button("q", "󰗼  Quit", ":qa<CR>"),
		}

		dashboard.section.footer.val = {
			'"I use arch, btw."',
		}

		dashboard.section.header.opts.hl = "Title"
		dashboard.section.footer.opts.hl = "Error"

		alpha.setup(dashboard.config)
	end,
}
