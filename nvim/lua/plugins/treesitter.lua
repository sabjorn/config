return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensured_installed = {
        "python",
        "lua",
        "md",
        "yaml",
        "go",
      }
    },
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
