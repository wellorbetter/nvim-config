" Neovim 0.12 on Windows may probe init.vim but skip init.lua when its TUI
" starts an embedded backend. Keep this compatibility entry point tiny and
" hand the full configuration to Lua.
lua require("config.lazy")
