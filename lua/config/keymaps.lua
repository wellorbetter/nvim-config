-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Familiar debugger keys in addition to LazyVim's <leader>d mappings.
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Debug: Continue / Start" })
vim.keymap.set("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<S-F11>", function()
  require("dap").step_out()
end, { desc = "Debug: Step Out" })

vim.keymap.set("n", "<leader>jh", "<cmd>checkhealth vim.lsp<cr>", { desc = "Java/LSP Health" })

-- A small personal layer on top of LazyVim's discoverable defaults.
vim.keymap.set("n", "<leader><space>", function()
  Snacks.picker.files({ cwd = LazyVim.root.get() })
end, { desc = "Find Files (Root Dir)", nowait = true })

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save File" })
vim.keymap.set("n", "<leader>cf", function()
  vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
end, { desc = "Format File" })

-- Open a project-root terminal in the lower part of the current Neovim UI.
-- Ctrl-/ remains LazyVim's built-in toggle from both normal and terminal mode.
vim.keymap.set("n", "<leader>t", function()
  Snacks.terminal.focus(nil, {
    cwd = LazyVim.root.get(),
    win = { position = "bottom", height = 0.35 },
  })
end, { desc = "Terminal (Bottom, Project Root)" })

vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<cr>", { desc = "Symbols Outline" })
vim.keymap.set("n", "<leader>pp", function()
  Snacks.picker.projects()
end, { desc = "Projects" })
