-- See `:help lspconfig-setup`, really helpful!
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
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  maxLineLength = 120, -- Not the best to set globally but ok for now
                },
              },
            },
          },
        },
      },
    },
  },
}
