local runtimes = {}

if vim.env.JAVA_17_HOME then
  table.insert(runtimes, { name = "JavaSE-17", path = vim.env.JAVA_17_HOME })
end
if vim.env.JAVA_HOME then
  table.insert(runtimes, { name = "JavaSE-25", path = vim.env.JAVA_HOME, default = true })
end

return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          configuration = {
            runtimes = runtimes,
          },
          import = {
            maven = { enabled = true },
          },
        },
      },
    },
  },
}
