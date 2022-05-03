local global = require("core.global")
local vim = vim

-- Create cache dir and subs dir
local createdir = function()
	local data_dir = {
		global.cache_dir .. "backup",
		global.cache_dir .. "session",
		global.cache_dir .. "swap",
		global.cache_dir .. "tags",
		global.cache_dir .. "undo",
	}
	-- There only check once that If cache_dir exists
	-- Then I don't want to check subs dir exists
	if vim.fn.isdirectory(global.cache_dir) == 0 then
		os.execute("mkdir -p " .. global.cache_dir)
		for _, v in pairs(data_dir) do
			if vim.fn.isdirectory(v) == 0 then
				os.execute("mkdir -p " .. v)
			end
		end
	end
end

local disable_distribution_plugins = function()
	vim.g.did_load_filetypes = 1
	vim.g.did_load_fzf = 1
	vim.g.did_load_gtags = 1
	vim.g.did_load_gzip = 1
	vim.g.did_load_tar = 1
	vim.g.did_load_tarPlugin = 1
	vim.g.did_load_zip = 1
	vim.g.did_load_zipPlugin = 1
	vim.g.did_load_getscript = 1
	vim.g.did_load_getscriptPlugin = 1
	vim.g.did_load_vimball = 1
	vim.g.did_load_vimballPlugin = 1
	vim.g.did_load_matchit = 1
	vim.g.did_load_matchparen = 1
	vim.g.did_load_2html_plugin = 1
	vim.g.did_load_logiPat = 1
	vim.g.did_load_rrhelper = 1
	vim.g.did_load_netrw = 1
	vim.g.did_load_netrwPlugin = 1
	vim.g.did_load_netrwSettings = 1
	vim.g.did_load_netrwFileHandlers = 1
end

local leader_map = function()
	vim.g.mapleader = ";"
	vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
	vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

local dashboard_config = function()
	vim.g.dashboard_default_executive = "telescope"

	vim.g.dashboard_custom_header = {
	}

	vim.g.dashboard_custom_footer = {
		" Have Fun!"
	}

	vim.g.dashboard_custom_section = {
		find_file = {
			id = 1,
			description = { " Find   " },
			command = "DashboardFindFile",
		},
		file_new = {
			id = 2,
			description = { " New    " },
			command = "DashboardNewFile",
		},
		find_history = {
			id = 3,
			description = { " History" },
			command = "DashboardFindHistory",
		},
		find_project = {
			id = 4,
			description = { " Project" },
			command = "Telescope project",
		},
		find_word = {
			id = 5,
			description = { " Word   " },
			command = "DashboardFindWord",
		},
		change_colorscheme = {
			id = 6,
			description = { " Scheme " },
			command = "DashboardChangeColorscheme",
		},
	}

end

local minimap_config = function()
	vim.g.minimap_auto_start = 0
	vim.g.minimap_block_filetypes = { "aerial", "NvimTree" }
	vim.g.minimap_git_colors = 1
end

local clipboard_config = function()
	vim.cmd([[
    let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }
    ]])
end

local load_core = function()
	local pack = require("core.pack")
	createdir()
	disable_distribution_plugins()
	leader_map()

	pack.ensure_plugins()
	dashboard_config()
	minimap_config()
	-- clipboard_config()

	require("core.options")
	require("core.mapping")
	require("keymap")
	require("core.event")
	pack.load_compile()

	vim.cmd([[colorscheme nightfox]])
end

load_core()
