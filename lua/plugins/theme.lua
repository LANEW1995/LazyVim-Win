return {
  -- Disable the default LazyVim colorscheme (tokyonight)
  { "folke/tokyonight.nvim", enabled = false },

  -- Enable OneDark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "warmer", -- <- THIS is the warm version
      transparent = false,
      term_colors = true,
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      require("onedark").load()
    end,
  },
}
