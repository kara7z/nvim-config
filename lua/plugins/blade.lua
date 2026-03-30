return {
  -- Blade treesitter parser
  {
    "EmranMR/tree-sitter-blade",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    build = ":TSUpdate",
  },

  -- Ensure treesitter installs the languages we need for Blade
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "blade",
        "php",
        "html",
        "css",
        "javascript",
        "json",
      })
    end,
  },
}
