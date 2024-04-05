return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = {
              justMyCode = false,
              console = "integratedTerminal",
            },
            args = { "--log-level", "DEBUG", "--quiet" },
            runner = "pytest",
            python = vim.fn.getcwd() .. "/venv/bin/python"
          })
        }
      })
      local neotest = require("neotest")

      vim.keymap.set("n", "<Leader>tm", neotest.run.run)
      vim.keymap.set("n", "<Leader>tf", function () neotest.run.run(vim.fn.expand('%')) end)
      vim.keymap.set("n", "<Leader>td", function () neotest.run.run({strategy = "dap"}) end)
      vim.keymap.set("n", "<Leader>ts", function () neotest.summary.open() end)
    end
  },
}
