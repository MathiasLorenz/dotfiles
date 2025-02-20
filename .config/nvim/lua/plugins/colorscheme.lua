return {
  -- { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim" },
  -- { "slugbyte/lackluster.nvim" },
  --  See https://github.com/zenbones-theme/zenbones.nvim?tab=readme-ov-file for colorschemes for zenbones
  -- { "zenbones-theme/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
