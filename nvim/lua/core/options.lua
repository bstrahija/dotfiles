local undodir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undodir, "p")

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.autoread = true
vim.opt.undofile = true
vim.opt.undodir = undodir
vim.opt.updatetime = 200
vim.opt.timeoutlen = 400

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = false
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.cmdheight = 0
vim.opt.pumheight = 10
vim.opt.fillchars = { eob = " " }
vim.opt.conceallevel = 0
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.shortmess:append("I")

pcall(function()
    vim.opt.winborder = "rounded"
end)
