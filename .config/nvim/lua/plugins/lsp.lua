return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          mason = false, -- disable for now to force to only run pyright
        },
      },
    },
  },
}
