return {
  {
    "mfussenegger/nvim-dap",
    cmd = { "DapContinue", "DapLaunch", "DapToggleBreakpoint", "DapStepOver", "DapStepInto", "DapStepOut", "DapTerminate", "DapShowLog" },
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")
      local dap_python = require("dap-python")

      -- Setup debugpy using the Python in the virtualenv
      -- This will use the Python interpreter from the active virtualenv
      dap_python.setup("python")

      -- Configure Python adapter to use the project's virtualenv
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            -- Use the active Python interpreter (respects virtualenv)
            local cwd = vim.fn.getcwd()
            -- Check for virtualenv in common locations
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
              return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
              return cwd .. "/.venv/bin/python"
            elseif vim.fn.executable(cwd .. "/env/bin/python") == 1 then
              return cwd .. "/env/bin/python"
            else
              -- Fall back to system python
              return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
            end
          end,
        },
        {
          type = "python",
          request = "launch",
          name = "Launch file with arguments",
          program = "${file}",
          args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " ")
          end,
          pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
              return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
              return cwd .. "/.venv/bin/python"
            elseif vim.fn.executable(cwd .. "/env/bin/python") == 1 then
              return cwd .. "/env/bin/python"
            else
              return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
            end
          end,
        },
        {
          type = "python",
          request = "attach",
          name = "Attach remote",
          connect = function()
            local host = vim.fn.input("Host [127.0.0.1]: ")
            host = host ~= "" and host or "127.0.0.1"
            local port = tonumber(vim.fn.input("Port [5678]: ")) or 5678
            return { host = host, port = port }
          end,
        },
      }

      -- Keymaps for debugging
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "Debug: Continue/Start" })

      vim.keymap.set("n", "<F9>", function()
        dap.toggle_breakpoint()
      end, { desc = "Debug: Toggle Breakpoint" })

      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { desc = "Debug: Step Over" })

      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "Debug: Step Into" })

      vim.keymap.set("n", "<S-F11>", function()
        dap.step_out()
      end, { desc = "Debug: Step Out" })

      vim.keymap.set("n", "<F8>", function()
        dap.terminate()
      end, { desc = "Debug: Terminate" })

      -- Additional useful keymaps
      vim.keymap.set("n", "<leader>db", function()
        dap.toggle_breakpoint()
      end, { desc = "Toggle Breakpoint" })

      vim.keymap.set("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Breakpoint with Condition" })

      vim.keymap.set("n", "<leader>dc", function()
        dap.continue()
      end, { desc = "Continue/Start Debugging" })

      vim.keymap.set("n", "<leader>dt", function()
        dap.terminate()
      end, { desc = "Terminate Debugging" })

      vim.keymap.set("n", "<leader>dr", function()
        dap.repl.open()
      end, { desc = "Open REPL" })

      vim.keymap.set("n", "<leader>dl", function()
        dap.run_last()
      end, { desc = "Run Last" })
    end,
  },
}
