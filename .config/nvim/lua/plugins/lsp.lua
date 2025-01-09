return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          mason = true,
        },
      },
    },
  },
}
