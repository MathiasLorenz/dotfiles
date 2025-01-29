return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          mason = true,
          autostart = false,
        },
        jedi_language_server = {
          mason = true,
          autostart = false,
        },
        pylsp = {
          mason = true,
        },
      },
    },
  },
}
