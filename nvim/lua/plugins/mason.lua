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
      'ts_ls',
      'eslint',
      'html',
      'cssls'
    }
  },
  lazy = false,
  config = function()
    require("mason").setup()
  end,
}
