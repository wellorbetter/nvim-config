# wellorbetter.nvim

A personal Neovim setup based on [LazyVim](https://github.com/LazyVim/LazyVim),
optimized for navigating large Rust, Java, and mixed-language repositories on
Windows without turning the configuration into a second full-time project.

## What is included

- transparent Tokyo Night Moon theme, vivid syntax/search highlights, Nerd Font icons,
  global statusline, and a compact dashboard
- fast project/file/text/symbol pickers and a Git-aware file explorer
- Aerial symbol outline, breadcrumbs, sticky Treesitter context, diagnostics, and references
- Rust support through rustaceanvim, rust-analyzer, Cargo, Clippy, tests, and debugging
- Java support through nvim-jdtls, tests, and debugging
- a bottom project-root terminal and LazyGit integration
- automatic reduced-feature mode for large files so LSP and Treesitter do not freeze the editor
- machine-specific SDK paths isolated in an ignored `lua/config/local.lua`

## Install

Back up any existing Neovim configuration, then clone the fork as the active
configuration directory:

```powershell
git clone https://github.com/wellorbetter/nvim-config $env:LOCALAPPDATA\nvim
Copy-Item $env:LOCALAPPDATA\nvim\lua\config\local.example.lua `
  $env:LOCALAPPDATA\nvim\lua\config\local.lua
nvim
```

LazyVim installs plugins on first launch. Edit the ignored `local.lua` when a
machine needs custom JDK, Maven, Python, parser, or compiler paths.

## Daily keys

`<leader>` is the keyboard space bar. `Space Space` means press the space bar
twice (within about 1.5 seconds); it is not a mouse double-click. Press space
once and pause to let WhichKey show the available commands.

| Key | Action |
| --- | --- |
| `Space Space` | Find project files |
| `Space /` | Search text in the project |
| `Space e` | Toggle file explorer |
| `Space o` | Toggle symbol outline |
| `Space pp` | Switch project |
| `Space t` | Open bottom terminal at project root |
| `Ctrl-/` | Focus or hide the terminal |
| `Space gg` | Open LazyGit |
| `gd` / `gr` | Definition / references |
| `K` | Hover documentation |
| `Space ca` | Code action |
| `Space cr` | Rename symbol |
| `Space cf` | Format file |
| `F5`, `F9`, `F10`, `F11` | Debug controls |

The more detailed Java/Artemis learning workflow is in
[ARTEMIS-NEOVIM-GUIDE.md](ARTEMIS-NEOVIM-GUIDE.md).
