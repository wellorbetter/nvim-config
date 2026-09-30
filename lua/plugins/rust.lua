return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            check = { command = "clippy" },
            files = {
              exclude = { ".git", "target", "node_modules", ".direnv", ".venv" },
            },
          },
        },
      },
    },
    config = function(_, opts)
      if LazyVim.has("mason.nvim") then
        local codelldb = vim.fn.exepath("codelldb")
        local sysname = (vim.uv or vim.loop).os_uname().sysname
        local library_path

        if sysname == "Windows_NT" then
          library_path = vim.fn.expand("$MASON/opt/lldb/bin/liblldb.dll")
        elseif sysname == "Darwin" then
          library_path = vim.fn.expand("$MASON/opt/lldb/lib/liblldb.dylib")
        else
          library_path = vim.fn.expand("$MASON/opt/lldb/lib/liblldb.so")
        end

        if codelldb ~= "" and vim.fn.filereadable(library_path) == 1 then
          opts.dap = require("rustaceanvim.config").get_codelldb_adapter(codelldb, library_path)
        end
      end

      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
      if vim.fn.executable("rust-analyzer") == 0 then
        LazyVim.error("rust-analyzer was not found in PATH", { title = "rustaceanvim" })
      end
    end,
  },
}
