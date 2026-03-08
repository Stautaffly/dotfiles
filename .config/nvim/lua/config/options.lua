-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_python_lsp = "basedpyright"

-- Use Neovim's virtual environment for Python plugins (molten.nvim, etc.)
vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/venv/bin/python3")