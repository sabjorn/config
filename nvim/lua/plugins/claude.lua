return {
  {
    dir = "~/.config/nvim/lua/plugins",
    name = "claude-nvim",
    config = function()
      local system_prompt = [[You are an AI assistant integrated into Neovim. Your output will be inserted directly into the editor at the cursor position. When asked to write code:
- Output ONLY the code, nothing else
- No explanations, no markdown code fences, no comments about what the code does
- No "Here's the code:" or similar preambles
- Just raw code that can be directly used]]

      vim.api.nvim_create_user_command("Claude", function(opts)
        local prompt = opts.args
        if prompt == "" then
          vim.notify("Usage: :Claude <prompt>", vim.log.levels.ERROR)
          return
        end

        vim.notify("Running Claude...", vim.log.levels.INFO)

        local cmd = {
          "claude",
          "-p",
          prompt,
          "--system-prompt",
          system_prompt,
        }

        vim.fn.jobstart(cmd, {
          stdout_buffered = true,
          on_stdout = function(_, data)
            if data then
              -- Filter out empty strings
              local lines = vim.tbl_filter(function(line)
                return line ~= ""
              end, data)

              if #lines > 0 then
                -- Get current cursor position
                local row, col = unpack(vim.api.nvim_win_get_cursor(0))
                -- Insert at cursor position
                vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, lines)
                vim.notify("Claude output inserted", vim.log.levels.INFO)
              end
            end
          end,
          on_stderr = function(_, data)
            if data and #data > 0 and data[1] ~= "" then
              vim.notify("Claude error: " .. table.concat(data, "\n"), vim.log.levels.ERROR)
            end
          end,
        })
      end, {
        nargs = "+",
        desc = "Run Claude CLI and insert output at cursor",
      })
    end,
  },
}
