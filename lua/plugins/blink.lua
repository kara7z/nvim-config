return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = opts.keymap or {}
    opts.keymap.preset = "default"
    opts.keymap["<Tab>"] = { "select_next", "fallback" }
    opts.keymap["<S-Tab>"] = { "select_prev", "fallback" }
    opts.keymap["<CR>"] = { "accept", "fallback" }
    opts.keymap["<C-e>"] = { "hide", "fallback" }
  end,
}
