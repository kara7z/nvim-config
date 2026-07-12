-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- =========================================================
-- Undo / Redo like normal editors
-- =========================================================
-- Ctrl+Z = undo
map("n", "<C-z>", "u", { desc = "Undo" })
map("i", "<C-z>", "<Esc>u", { desc = "Undo" })

-- Ctrl+Shift+Z = redo (may not work in some terminals)
map("n", "<C-S-z>", "<C-r>", { desc = "Redo" })
map("i", "<C-S-z>", "<Esc><C-r>", { desc = "Redo" })

-- Fallback redo that works in almost all terminals
map("n", "<C-y>", "<C-r>", { desc = "Redo (fallback)" })
map("i", "<C-y>", "<Esc><C-r>", { desc = "Redo (fallback)" })

-- =========================================================
-- Explorer (Snacks)
-- =========================================================
-- F2: toggle Snacks Explorer (safe require)
map("n", "<F2>", function()
  local ok, snacks = pcall(require, "snacks")
  if not ok or not snacks.explorer or not snacks.explorer.toggle then
    vim.notify("snacks.nvim is not installed/loaded", vim.log.levels.ERROR)
    return
  end
  snacks.explorer.toggle()
end, { desc = "Explorer (Snacks)" })

-- =========================================================
-- Select all
-- =========================================================
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- =========================================================
-- Terminal toggle (F8 / Ctrl+/)
-- =========================================================
local term = {
  buf = nil,
  win = nil,
  height = 15,
}

local function toggle_term()
  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_close(term.win, true)
    term.win = nil
    return
  end

  if vim.bo.buftype == "terminal" then
    vim.cmd("hide")
    term.win = nil
    return
  end

  vim.cmd(("botright %dsplit"):format(term.height))
  term.win = vim.api.nvim_get_current_win()

  if not term.buf or not vim.api.nvim_buf_is_valid(term.buf) then
    term.buf = vim.api.nvim_create_buf(false, false)
    vim.bo[term.buf].bufhidden = "hide"
  end

  vim.api.nvim_win_set_buf(term.win, term.buf)
  if vim.bo[term.buf].buftype ~= "terminal" then
    vim.cmd("terminal")
  end
  vim.cmd("startinsert")
end

map("n", "<F8>", toggle_term, { desc = "Toggle Terminal" })
map("t", "<F8>", [[<C-\><C-n><cmd>lua toggle_term()<cr>]], { desc = "Toggle Terminal" })
map("n", "<C-_>", toggle_term, { desc = "Toggle Terminal" })
map("t", "<C-_>", [[<C-\><C-n><cmd>lua toggle_term()<cr>]], { desc = "Toggle Terminal" })
