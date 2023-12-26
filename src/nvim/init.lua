vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt
local o = vim.o
opt.timeoutlen = 10000
opt.autowriteall = true
opt.autowrite = true
opt.hidden = false
opt.swapfile = false
opt.fileformat = "unix"
opt.iskeyword:append("-")
opt.selectmode:append("mouse")
o.fileencodings = "utf-8,chinese,cp936"

vim.cmd("startinsert")
vim.cmd([[
  autocmd BufReadPre * if !&modifiable | set modifiable | endif
]])

-- TODO: move to keymap file
local map = vim.keymap.set
-- no normal mode now..
-- map("i", "<Esc>", "", {})
-- interface edit line
map("i", "<C-e>", "", {})
map("i", "<C-e>d", "<C-o>d0<C-o>d$", {})
map("i", "<C-e>y", "<C-o>yy", {})
map("i", "<C-e>p", "<C-o>p", {})
map("i", "<C-e>n", "<C-o>b<C-o>dw", {})
map("i", "<C-e>o", "<C-o>dw", {})
map("i", "<C-e><Left>", "<C-o>b", {})
map("i", "<C-e><Right>", "<C-o>w", {})
map("i", "<C-e>s", "<C-u>", {})
map("i", "<C-e>t", "<C-o>d$", {})
map("i", "<C-e>r", "<C-r>", {})
map({ "i" }, "<C-e>u", "<C-o>u", { desc = "Go to left window" })
map({ "i" }, "<C-e>U", "<C-o><C-r>", { desc = "Go to left window" })

map("c", "<C-e>", "", {})
map("c", "<C-e>d", "<End><C-u>", {})
map("c", "<C-e>y", "<C-f>yy<C-w>c", {})
map("c", "<C-e>p", '<C-r>"', {})
map("c", "<C-e>n", "<C-w>", {})
map("c", "<C-e>o", "<S-Right><C-w>", {})
map("c", "<C-e><Left>", "<S-Left>", {})
map("c", "<C-e><Right>", "<S-Right>", {})
map("c", "<C-e>s", "<C-u>", {})
-- delete to line end

-- quit interface
map({ "i", "c" }, "<A-q>A", "<C-o><cmd>silent! FloatermKill!<cr><cmd>:wqa<cr>", { desc = "quit nvim" })
map({ "i", "c" }, "<A-q>a", "<C-o><cmd>:qa!<cr>", { desc = "quit nvim without save" })
map({ "i", "c" }, "<A-q>r", "<C-o><cmd>:w<cr>:so<cr>", { desc = "reload current config file" })
map({ "i", "c" }, "<A-q>q", "<C-o><cmd>:close<cr>", { desc = "quit current window" })
map({ "i", "c" }, "<A-q>q", "<C-o><cmd>:close<cr>", { desc = "quit current window" })
map({ "i", "c" }, "<A-q>t", "<C-o><cmd>:tabclose<cr>", { desc = "quit current tab" })
map({ "i", "c" }, "<A-q>o", "<C-o><C-w>o", { desc = "quit to only window" })
map({ "i", "c" }, "<A-q>l", "<C-o><C-w>o", { desc = "quit to only window" })
map({ "i", "c" }, "<A-q>n", "<C-o><cmd>:tabonly<cr>", { desc = "quit to only tab" })
map({ "n", "v" }, "<A-q>A", "<cmd>silent! FloatermKill!<cr><cmd>:wqa<cr>", { desc = "quit nvim" })
map({ "n", "v" }, "<A-q>a", "<cmd>:qa!<cr>", { desc = "quit nvim without save" })
map({ "n", "v" }, "<A-q>r", "<cmd>:w<cr>:so<cr>", { desc = "reload current config file" })
map({ "n", "v" }, "<A-q>q", "<cmd>:close<cr>", { desc = "quit current window" })
map({ "n", "v" }, "<A-q>q", "<cmd>:close<cr>", { desc = "quit current window" })
map({ "n", "v" }, "<A-q>t", "<cmd>:tabclose<cr>", { desc = "quit current tab" })
map({ "n", "v" }, "<A-q>o", "<C-w>o", { desc = "quit to only window" })
map({ "n", "v" }, "<A-q>l", "<C-w>o", { desc = "quit to only window" })
map({ "n", "v" }, "<A-q>n", "<cmd>:tabonly<cr>", { desc = "quit to only tab" })

-- launch interface
map({ "i", "c" }, "<A-l>h", "<cmd>sp<cr>", { desc = "垂直方向打开新的窗口" })
map({ "i", "c" }, "<A-l>v", "<cmd>vs<cr>", { desc = "水平方向打开新的窗口" })
map({ "i", "c" }, "<A-l>t", "<C-o>:tabnew ", { desc = "tab里打开一个新的文件" })
map({ "i", "c" }, "<A-l>w", "<C-o>:vnew ", { desc = "打开新的窗口" })
map({ "i", "c" }, "<A-l>f", "", { desc = "not implement" })
map({ "i", "c" }, "<A-l>r", "<C-o><C-l>", { desc = "refresh screen" })
map({ "i", "c" }, "<A-l>c", "", { desc = "not implement" })
map({ "i", "c" }, "<A-l>R", "", { desc = "not implement" })
map({ "i", "c" }, "<A-.>", "<C-o>:", { desc = "not implement" })
map({ "i", "c" }, "<A-l>m", "<C-o>:h<cr>i", { desc = "not implement" })

-- focus interface
map({ "i", "c" }, "<a-n>", "<C-o><C-w>h", { desc = "Go to left window" })
map({ "i", "c" }, "<a-i>", "<C-o><C-w>j", { desc = "Go to lower window" })
map({ "i", "c" }, "<a-r>", "<C-o><C-w>k", { desc = "Go to upper window" })
map({ "i", "c" }, "<a-o>", "<C-o><C-w>l", { desc = "Go to right window" })
map({ "i", "c" }, "<a-Left>", "<C-o><cmd>:tabprev<cr>", { desc = "Go to left tab" })
map({ "i", "c" }, "<a-Right>", "<C-o><cmd>:tabnext<cr>", { desc = "Go to right tab" })
map({ "n", "v" }, "<a-n>", "<C-w>h", { desc = "Go to left window" })
map({ "n", "v" }, "<a-i>", "<C-w>j", { desc = "Go to lower window" })
map({ "n", "v" }, "<a-r>", "<C-w>k", { desc = "Go to upper window" })
map({ "n", "v" }, "<a-o>", "<C-w>l", { desc = "Go to right window" })
map({ "n", "v" }, "<a-Left>", "<cmd>:tabprev<cr>", { desc = "Go to left tab" })
map({ "n", "v" }, "<a-Right>", "<cmd>:tabnext<cr>", { desc = "Go to right tab" })

-- moveto interface
map({ "i", "c" }, "<A-m>n", "<C-w>H", { desc = "Move to left window" })
map({ "i", "c" }, "<A-m>i", "<C-w>J", { desc = "Move to lower window" })
map({ "i", "c" }, "<A-m>r", "<C-w>K", { desc = "Move to upper window" })
map({ "i", "c" }, "<A-m>o", "<C-w>L", { desc = "Move to right window" })
map({ "i", "c" }, "<A-m>f", "", { desc = "not implement" })
map({ "i", "c" }, "<A-m><Left>", "<cmd>:-tabmove<cr>", { desc = "Move to left tab" })
map({ "i", "c" }, "<A-m><Right>", "<cmd>:+tabmove<cr>", { desc = "Move to right tab" })
map({ "i", "c" }, "<A-m>.", "", { desc = "not implement" })

map("i", "<A-S>r", "<C-o><cmd>resize +4<cr>", { desc = "" })
map("i", "<A-S>i", "<C-o><cmd>resize -4<cr>", { desc = "" })
map("i", "<A-S>o", "<C-o><cmd>vertical resize +4<cr>", { desc = "" })
map("i", "<A-S>n", "<C-o><cmd>vertical resize -4<cr>", { desc = "" })

map("i", "<a-g>n", "<C-o><C-o>", {})
map("i", "<a-g>o", "<C-o><Tab>", {})

-- this function need flash plugin to be installed
function sui_flash_jump()
  local ok, _ = pcall(require, "flash")
  if not ok then
    vim.notify("please install flash plugin!!!", vim.log.levels.ERROR)
	  vim.cmd("startinsert")
    return
  end
	require("flash").jump()
	vim.cmd("startinsert")
end
function sui_flash_treesitter()
  local ok, _ = pcall(require, "flash")
  if not ok then
    vim.notify("please install flash plugin!!!", vim.log.levels.ERROR)
	  vim.cmd("startinsert")
    return
  end
  local api = vim.api
  require("flash").treesitter()
  api.nvim_feedkeys(api.nvim_replace_termcodes("<C-G>", true, true, true), "n", false)
end

function sui_flash_treesitter_line()
  local ok, _ = pcall(require, "flash")
  if not ok then
    vim.notify("please install flash plugin!!!", vim.log.levels.ERROR)
	  vim.cmd("startinsert")
    return
  end
  local api = vim.api
  require("flash").treesitter()
  api.nvim_feedkeys(api.nvim_replace_termcodes("gH", true, true, true), "n", false)
end
-- coding interface
map({ "i" }, "<a-m>m", "<C-o>:/\\V")
-- map({ "x" }, "<a-p>", "<Esc>V")
map({ "x" }, "<a-p>", "<C-g>ya")
map({ "i" }, "<a-s>", "<Esc>:lua sui_flash_jump()<cr>")
map({ "i" }, "<a-l>l", "<Esc>:lua sui_flash_treesitter()<cr>")
map({ "i" }, "<a-l>L", "<Esc>:lua sui_flash_treesitter_line()<cr>")
map({ "i" }, "<a-l><a-l>", "<Esc>:lua sui_flash_treesitter()<cr>")
map({ "i" }, "<a-P>", "<C-o>N")
map({ "i" }, "<a-p>", "<C-o>n")
map({ "i" }, "<a-m>f", "<C-o>o")
map({ "i" }, "<a-m>rf", "<C-o>o")
map({ "i" }, "<a-m>cf", "<C-o>o")

map({ "i" }, "<wC-CR>", "<C-o>o")

map({ "x" }, "<BS>", "<C-G>u<BS>")
map({ "i" }, "<a-V>w", "<Esc>viwgH")
map({ "i" }, "<a-v>w", "<Esc>viw<C-G>")
-- map({ "i" }, "<C-A-v>w", "<Esc>viwg<c-h>")
map({ "i" }, "<C-A-v>w", "<Esc>viwgH")

map({ "x" }, "<a-y>", "<C-o><Esc>y")
map({ "i" }, "<a-d>w", "<Esc>diwi")
map({ "i" }, "<a-d>aw", "<Esc>dawi")
map({ "i" }, "<a-y>w", "<Esc>yiwi")
map({ "i" }, "<a-y>aw", "<Esc>yawi")

map({ "n" }, "tnw", "b")
map({ "n" }, "tow", "e")
map({ "n" }, "tw", "w")

map({ "o" }, "nw", "b")
map({ "o" }, "ow", "e")
map({ "o" }, "w", "iw")
map({ "o" }, "np", "rw")
map({ "o" }, "op", "b")
map({ "o" }, "rp", "e")
