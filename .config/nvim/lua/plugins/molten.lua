return {
  {
    "benlubas/molten-nvim",
    ft = "python",
    build = ":UpdateRemotePlugins",
    dependencies = {},
    init = function()
      -- Image provider for displaying plots and outputs
      -- Set to "none" if image.nvim is not available (unsupported terminal)
      -- Options: "image.nvim", "none", or leave empty for text output
      vim.g.molten_image_provider = "none"
      -- Maximum height of output window
      vim.g.molten_output_win_max_height = 20
      -- Auto-open output when running cells
      vim.g.molten_auto_open_output = true
      -- Wrap output text
      vim.g.molten_wrap_output = true
      -- Virt text format for cell execution status
      vim.g.molten_virt_text_output = true
    end,
    config = function()
      -- Keymaps for molten (Jupyter integration)
      -- Leader + j prefix for Jupyter operations
      vim.keymap.set("n", "<leader>ji", ":MoltenInit<CR>", { desc = "Initialize Molten" })
      vim.keymap.set("n", "<leader>jr", ":MoltenEvaluateOperator<CR>", { desc = "Run cell" })
      vim.keymap.set("n", "<leader>jR", ":MoltenReevaluateCell<CR>", { desc = "Re-run cell" })
      vim.keymap.set("n", "<leader>ja", ":MoltenReevaluateAll<CR>", { desc = "Run all cells" })
      vim.keymap.set("n", "<leader>jo", ":MoltenShowOutput<CR>", { desc = "Show output" })
      vim.keymap.set("n", "<leader>jh", ":MoltenHideOutput<CR>", { desc = "Hide output" })
      vim.keymap.set("n", "<leader>jd", ":MoltenDelete<CR>", { desc = "Delete cell" })

      -- Visual mode: evaluate selection
      vim.keymap.set("v", "<leader>jr", ":<C-u>MoltenEvaluateVisual<CR>", { desc = "Run selection" })
    end,
  },
}

--[[
================================================================================
IMPORTANT: Python Dependencies Setup
================================================================================

Molten.nvim requires Python dependencies to communicate with Jupyter kernels.
DO NOT install globally - use a virtual environment approach:

1. In your project virtualenv (recommended):
   $ python -m venv .venv
   $ source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   $ pip install pynvim jupyter-client ipykernel

2. Ensure Neovim uses the virtualenv Python:
   Add to your init.lua or check with:
   :lua print(vim.fn.exepath('python3'))

3. Register the kernel with Jupyter:
   $ python -m ipykernel install --user --name=myproject

================================================================================
REQUIRED: Post-Installation Steps
================================================================================

1. After installing molten.nvim, run:
   :UpdateRemotePlugins

   This generates the remote plugin manifest required for Python integration.
   RESTART Neovim after running this command.

2. Initialize molten for your buffer:
   :MoltenInit python3

   Or use the keymap: <leader>ji

================================================================================
Usage Workflow
================================================================================

1. Open a Python file
2. Initialize: <leader>ji (or :MoltenInit python3)
3. Run cell under cursor: <leader>jr
4. Run visual selection: <leader>jr (in visual mode)
5. Re-run current cell: <leader>jR
6. Run all cells: <leader>ja
7. Show/hide output: <leader>jo / <leader>jh
8. Delete cell: <leader>jd

Cell boundaries are defined by:
- # %% (Spyder-style cell markers)
- # %% [markdown] (Markdown cells)
- # <codecell> (IPython-style)

================================================================================
--]]
