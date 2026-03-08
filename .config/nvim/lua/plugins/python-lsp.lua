return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                autoImportCompletions = true,
                diagnosticSeverityOverrides = {
                  reportUnknownMemberType = "warning",
                },
              },
            },
          },
        },
      },
    },
  },
}
