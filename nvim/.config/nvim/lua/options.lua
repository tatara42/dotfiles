vim.g.background = "light"

vim.wo.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "100"

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldlevel = 1
-- vim.opt.foldenable = false
vim.opt.guicursor =  "n-v-c-sm-i:block,ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"




