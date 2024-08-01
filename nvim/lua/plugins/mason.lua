return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "pyright",
      "pytest",
      "debugpy",
      "black",
      "ruff",
      "mypy",
      "rust-analyzer",
      "codelldb",
    }
  },
  lazy = false,
  config = function()
    require("mason").setup()
  end,
}
