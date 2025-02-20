return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {},
      picker = {
        sources = {
          files = { hidden = true, ignored = true },
          grep = { hidden = true, ignored = false },
          explorer = { hidden = true, ignored = true },
        },
      },
      words = {
        debounce = 100,
      },
    },
  },
}
