-- TODO: get lighter foreground color happening...
-- vim.g.gruvbox_material_colors_override = {'fg0' = '#E1D7C6'}

-- vim.g.gruvbox_material_background = 'hard'
-- vim.g.gruvbox_material_foreground = 'material'
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_material_enable_italic = 1
--
-- return {
-- 	'cfsanderson/cfs-gruvbox-material',
-- }
--
return {
	"cfsanderson/cfs-gruvbox-material",
	priority = 10000,
	lazy = false,
	config = function()
		vim.g.gruvbox_material_foreground = "material"
		vim.g.gruvbox_material_background = "hard"
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
