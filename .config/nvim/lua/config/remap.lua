vim.g.mapleader = " ";
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.opt.cc = "80"

vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.et = true
vim.opt.sw = 4
vim.opt.ai = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- vim.cmd.colorscheme("rose-pine")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-i>", "<cmd>tabprevious<CR>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-o>", "<cmd>tabnext<CR>", { desc = "Move focus to the left window" })
