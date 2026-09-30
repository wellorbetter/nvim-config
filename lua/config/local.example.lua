-- Copy this file to local.lua for machine-specific SDK paths.
-- local.lua is ignored by Git.

local home = vim.fn.expand("~")
local paths = {
  home .. "/.local/bin",
  home .. "/.cargo/bin",
}

vim.env.PATH = table.concat(paths, ";") .. ";" .. vim.env.PATH

-- Optional examples:
-- vim.env.JAVA_HOME = "C:/Program Files/Microsoft/jdk-25"
-- vim.env.JAVA_17_HOME = "C:/Program Files/Microsoft/jdk-17"
-- vim.env.MAVEN_HOME = home .. "/AppData/Local/Programs/Apache/Maven/apache-maven"
-- vim.env.NVIM_MASON_HOME = vim.fn.stdpath("data") .. "/mason"
