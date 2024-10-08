return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    "mxsdev/nvim-dap-vscode-js",
    {
      "microsoft/vscode-js-debug",
      version = "1.x",
      build = "yarn install && yarn run compile vsDebugServerBundle && mv dist out",  -- Build JS Debugger
    },
    "tpope/vim-fugitive",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    require("dapui").setup()

    require("dap-python").setup(
      "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    )
    require("dap-python").test_runner = "pytest"

    require("dap-vscode-js").setup({
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    })
    for _, language in ipairs({ "typescript", "javascript" }) do
      require("dap").configurations[language] = {
        {
          type = "pwa-chrome",
          name = "Launch Chrome to debug client",
          request = "launch",
          url = "http://localhost:8000",
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}",
          localRoot = "${workspaceFolder}/frontend/js/src",
          cwd = "${workspaceFolder}",
          skipFiles = { "**/node_modules/**/*" },
        },
        -- start chrome with: /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222
        {
          type = "pwa-chrome",
          name = "Attach to running Chrome instance",
          request = "attach",
          port = 9222,
          webRoot = "${workspaceFolder}",
          localRoot = "${workspaceFolder}/frontend/js/src",
          cwd = "${workspaceFolder}",
          skipFiles = { "**/node_modules/**/*" },
        },
      }
    end

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({ reset = true })
    end
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    vim.fn.sign_define('DapBreakpoint', { text='●', texthl='LspDiagnosticsDefaultError' })
    vim.fn.sign_define('DapLogPoint' , { text='◉', texthl='LspDiagnosticsDefaultError' })
    vim.fn.sign_define('DapStopped' , { text='➔', texthl='LspDiagnosticsDefaultInformation', linehl='CursorLine' })

    vim.keymap.set('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { desc = '[D]ebug [B]reakpoint' })
    vim.keymap.set('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', { desc = '[D]ebug [C]ontinue' })
    vim.keymap.set('n', '<leader>do', '<cmd>lua require"dap".step_over()<CR>', { desc = '[D]ebug Step [O]ver' })
    vim.keymap.set('n', '<leader>di', '<cmd>lua require"dap".step_into()<CR>', { desc = '[D]ebug Step [I]nto' })
    vim.keymap.set("n", "<Leader>dx", '<cmd>lua require"dap".terminate()<CR>', { desc = '[D]ebug E[x]it' })

    vim.keymap.set('n', '<leader>dt', '<cmd>lua require"dap-python".test_method()<CR>', { desc = '[D]ebug [T]est' })
  end,
}
