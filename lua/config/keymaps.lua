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
-- F8: Toggle ONE bottom terminal split (no new tab/split each time)
-- =========================================================
local term = {
  buf = nil,
  win = nil,
  height = 15,
}

local function open_term_window()
  -- open bottom split
  vim.cmd(("botright %dsplit"):format(term.height))
  term.win = vim.api.nvim_get_current_win()

  -- create terminal buffer if needed
  if not term.buf or not vim.api.nvim_buf_is_valid(term.buf) then
    term.buf = vim.api.nvim_create_buf(false, false)
    vim.bo[term.buf].bufhidden = "hide"
    vim.api.nvim_win_set_buf(term.win, term.buf)
    vim.cmd("terminal")
  else
    vim.api.nvim_win_set_buf(term.win, term.buf)
  end

  vim.cmd("startinsert")
end

local function toggle_term()
  -- If terminal window is open, close it
  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_close(term.win, true)
    term.win = nil
    return
  end

  -- If current buffer is terminal, just hide it
  if vim.bo.buftype == "terminal" then
    vim.cmd("hide")
    term.win = nil
    return
  end

  -- Otherwise open (or re-open) the same terminal buffer
  open_term_window()
end

-- Normal mode: F8 toggles terminal
map("n", "<F8>", toggle_term, { desc = "Toggle Terminal (single split)" })

-- Terminal mode: F8 closes/hides terminal
map("t", "<F8>", function()
  -- go normal mode then close terminal window if it's the tracked one
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_close(term.win, true)
    term.win = nil
  else
    vim.cmd("hide")
  end
end, { desc = "Toggle Terminal (single split)", silent = true })
