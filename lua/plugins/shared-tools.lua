return {
  {
    "mason-org/mason.nvim",
    opts = {
      install_root_dir = vim.env.NVIM_MASON_HOME or (vim.fn.stdpath("data") .. "/mason"),
    },
  },
}
