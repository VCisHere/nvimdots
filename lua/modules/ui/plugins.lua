local ui = {}
local conf = require("modules.ui.config")

ui["kyazdani42/nvim-web-devicons"] = { opt = false }
ui["sainnhe/edge"] = { opt = false, config = conf.edge }
ui["EdenEast/nightfox.nvim"] = {
	opt = false,
	config = conf.nightfox
}
ui["hoob3rt/lualine.nvim"] = {
	opt = true,
	after = "lualine-lsp-progress",
	config = conf.lualine,
}
ui["SmiteshP/nvim-gps"] = {
	opt = true,
	after = "nvim-treesitter",
	config = conf.nvim_gps,
}
ui["arkav/lualine-lsp-progress"] = { opt = true, after = "nvim-gps" }
ui["VCisHere/dashboard-nvim"] = { opt = true, event = "BufWinEnter" }
ui["kyazdani42/nvim-tree.lua"] = {
	opt = true,
	cmd = { "NvimTreeToggle" },
	config = conf.nvim_tree,
}
ui["lewis6991/gitsigns.nvim"] = {
	opt = true,
	event = { "BufRead", "BufNewFile" },
	config = conf.gitsigns,
	requires = { "nvim-lua/plenary.nvim", opt = true },
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	opt = true,
	event = "BufRead",
	config = conf.indent_blankline,
}
ui["romgrk/barbar.nvim"] = {
	requires = {"kyazdani42/nvim-web-devicons"},
	config = conf.barbar,
}
ui["petertriho/nvim-scrollbar"] = {
	opt = true,
	event = "BufRead",
	config = function()
		require("scrollbar").setup()
	end,
}
ui["mbbill/undotree"] = {
	opt = true,
	cmd = "UndotreeToggle",
}
ui["xiyaowong/nvim-transparent"] = {
	opt = false,
	config = conf.transparent,
}

return ui
