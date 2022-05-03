local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
	-- Vim map
	["n|<C-s>"] = map_cu("write"):with_noremap(),
	["n|<C-z>"] = map_cmd("u"):with_noremap(),
	["n|Y"] = map_cmd("y$"),
	["n|D"] = map_cmd("d$"),
	["n|<A-[>"] = map_cr("vertical resize -1"):with_silent(),
	["n|<A-]>"] = map_cr("vertical resize +1"):with_silent(),
	["n|<A-;>"] = map_cr("resize -1"):with_silent(),
	["n|<A-'>"] = map_cr("resize +1"):with_silent(),
	["n|<A-Up>"] = map_cmd(":m -2<CR>"),
	["n|<A-Down>"] = map_cmd(":m +1<CR>"),
	-- Insert
	["i|<C-d>"] = map_cmd("<ESC>dd i"):with_noremap(),
	["i|<C-s>"] = map_cmd("<Esc>:w<CR>"):with_noremap(),
	["i|<C-z>"] = map_cmd("<Esc>u"):with_noremap(),
	["i|<C-<Left>>"] = map_cmd("<Esc>b i"):with_noremap(),
	["i|<C-<Right>>"] = map_cmd("<Esc>w i"):with_noremap(),
	-- command line
	["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
	["c|w!!"] = map_cmd("execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),
	-- Visual
	["v|J"] = map_cmd(":m '>+1<cr>gv=gv"),
	["v|K"] = map_cmd(":m '<-2<cr>gv=gv"),
	["v|<S-Tab>"] = map_cmd("<gv"),
	["v|<Tab>"] = map_cmd(">gv"),
}

bind.nvim_load_mapping(def_map)
