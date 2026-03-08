return {
  {
    "nvim-neotest/neotest",
    cmd = { "Neotest", "NeotestRun", "NeotestRunFile", "NeotestSummary" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest",
            python = ".venv/bin/python",
          }),
        },
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run() end, { desc = "Run nearest test" })
      vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run current file" })
      vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })
    end,
  },
}
