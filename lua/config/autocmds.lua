-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local image_preview = vim.api.nvim_create_augroup("image_preview", { clear = true })

vim.api.nvim_create_autocmd("BufReadCmd", {
  group = image_preview,
  pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif" },
  callback = function()
    -- vim.ui.open automatically uses the correct tool for Linux, macOS, and Windows
    vim.ui.open(vim.fn.expand("%:p"))
    vim.cmd("bdelete!")
  end,
})
