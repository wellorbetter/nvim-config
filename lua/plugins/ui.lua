return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      terminal_colors = true,
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        hl.Normal = { fg = c.fg, bg = "NONE" }
        hl.NormalNC = { fg = c.fg, bg = "NONE" }
        hl.SignColumn = { bg = "NONE" }
        hl.EndOfBuffer = { fg = c.bg_dark, bg = "NONE" }
        hl.CursorLine = { bg = "#292d43" }
        hl.Visual = { bg = "#3b4261" }
        hl.Search = { fg = c.bg_dark, bg = c.yellow, bold = true }
        hl.IncSearch = { fg = c.bg_dark, bg = c.magenta, bold = true }
        hl.CurSearch = { fg = c.bg_dark, bg = c.orange, bold = true }
        hl.FloatBorder = { fg = c.blue, bg = "NONE" }
        hl.DiagnosticVirtualTextError = { fg = c.error, bg = "NONE", italic = true }
        hl.DiagnosticVirtualTextWarn = { fg = c.warning, bg = "NONE", italic = true }
        hl.DiagnosticVirtualTextInfo = { fg = c.info, bg = "NONE", italic = true }
        hl.DiagnosticVirtualTextHint = { fg = c.hint, bg = "NONE", italic = true }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight-moon" },
  },
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = {
        enabled = true,
        notify = true,
        size = 1.5 * 1024 * 1024,
        line_length = 1000,
      },
      terminal = {
        win = {
          position = "bottom",
          height = 0.35,
          border = "rounded",
        },
      },
      dashboard = {
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.globalstatus = true
      opts.options.component_separators = { left = "│", right = "│" }
      opts.options.section_separators = { left = "", right = "" }
    end,
  },
}
