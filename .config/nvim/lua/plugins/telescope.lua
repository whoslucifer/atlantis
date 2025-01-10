return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        hidden = true,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--column",
          "--hidden",
          "--line-number",
          "--no-heading",
          "--smart-case",
          "--unrestricted",
          "--with-filename",
        },
      },
    })
    telescope.load_extension("fzf")
  end,
}
