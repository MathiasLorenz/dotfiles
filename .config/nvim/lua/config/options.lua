-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.g.lazyvim_python_lsp = "ruff"
vim.g.lazyvim_python_lsp = "basedpyright"

-- Set root to always be cwd, otherwise the LSP might change it on the fly
vim.g.root_spec = { "cwd" }
