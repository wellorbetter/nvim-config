-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Machine-specific SDK paths live in ignored lua/config/local.lua. Keeping
-- them out of the public repo makes this config portable and avoids changing
-- the global PATH for unrelated projects.
pcall(require, "config.local")

vim.g.have_nerd_font = true
vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h12"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes:1"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.confirm = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.updatetime = 200
-- Give new Vim users enough time to finish sequences such as Space Space.
vim.opt.timeoutlen = 800
