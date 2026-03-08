return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          cmd = { "ruff", "server", "--preview" },
          filetypes = { "python" },
          root_dir = function(fname)
            return require("lspconfig").util.root_pattern("pyproject.toml", "setup.py", ".git")(fname) or vim.fn.getcwd()
          end,
          settings = {},
          on_attach = function(client, bufnr)
            -- Disable hover in favor of basedpyright
            client.server_capabilities.hoverProvider = false
            -- Disable formatting in favor of basedpyright (optional, remove if you want ruff to format)
            -- client.server_capabilities.documentFormattingProvider = false
            -- client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
      },
    },
  },
}
