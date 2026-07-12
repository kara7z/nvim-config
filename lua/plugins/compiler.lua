return {
  { "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
    keys = {
      { "<F6>", "<cmd>CompilerOpen<cr>", desc = "Open compiler" },
      { "<S-F6>", "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>", desc = "Redo last compiler task" },
      { "<S-F7>", "<cmd>CompilerToggleResults<cr>", desc = "Toggle compiler results" },
    },
  },
  { "stevearc/overseer.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = { direction = "bottom", min_height = 25, max_height = 25, default_detail = 1 },
    },
  },
}
