vim.opt.termguicolors = true

-- numbering
vim.opt.nu = true -- number
vim.opt.rnu = true -- relative line number

-- indentation
vim.opt.ts = 4 -- tab stop
vim.opt.sw = 4 -- shift width
vim.opt.et = true -- expand tab
vim.opt.ai = true -- auto indent

vim.opt.wrap = false -- no text wrap

-- vim.opt.sp = "en"		-- spell
-- set clipboard+=unnamed

-- WinBar
local win_bar = require("utils.winbar")
win_bar.setup()

-- StatusLine
vim.o.laststatus = 3
