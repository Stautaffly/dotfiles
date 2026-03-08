-- Custom keymaps for Python/Jupyter/Markdown
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Python keymaps (<leader>p)
map("n", "<leader>pr", "<cmd>PyrightOrganizeImports<CR>", { desc = "Organize Imports" })
map("n", "<leader>pf", "<cmd>RuffFormat<CR>", { desc = "Format with Ruff" })

-- Jupyter keymaps (<leader>j) - most defined in molten.lua
-- Additional keymaps here if needed
map("n", "<leader>jn", "<cmd>MoltenNext<CR>", { desc = "Next Cell" })
map("n", "<leader>jp", "<cmd>MoltenPrev<CR>", { desc = "Previous Cell" })

-- Markdown keymaps (<leader>m)
map("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop Preview" })
map("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Preview" })
map("n", "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle Render" })
