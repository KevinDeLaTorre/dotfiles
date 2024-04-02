return {
  -- Add dracula theme
  {
    "Mofiqul/dracula.nvim",
    opts = {
      colors = {
        bg = "#1A1B26",
      },
    },
  },

  -- Adds tokyonight theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      on_highlights = function(highlights, colors)
        highlights.Comment = { fg = "#708090" }
      end,
    },
  },
}
