-- Auto-install missing colorscheme plugins when selecting from FzfLua
return {
  {
    "ibhagwan/fzf-lua",
    config = function()
      local fzf = require("fzf-lua")

      -- Map colorscheme names to plugin repos
      local theme_plugins = {
        ["adwaita"] = "Mofiqul/adwaita.nvim",
        ["onedark"] = "navarasu/onedark.nvim",
        ["catppuccin"] = "catppuccin/nvim",
        ["nightfox"] = "EdenEast/nightfox.nvim",
        ["tokyodark"] = "tiagovla/tokyodark.nvim",
        ["everforest"] = "sainnhe/everforest",
        ["nord"] = "shaunsingh/nord.nvim",
      }

      local lazy = require("lazy")

      -- Wrapper around original command
      local function apply_colorscheme(name)
        if not pcall(vim.cmd.colorscheme, name) then
          local plugin = theme_plugins[name]
          if plugin then
            print("Installing theme plugin: " .. plugin)
            lazy.install({ plugin })
            lazy.sync()
            vim.defer_fn(function()
              vim.cmd.colorscheme(name)
            end, 200)
          else
            print("Theme not installed and no plugin mapping found: " .. name)
          end
        end
      end

      -- Override FzfLua colorschemes action
      fzf.setup({
        colorschemes = {
          actions = {
            ["default"] = function(selected)
              local name = selected[1]
              name = string.match(name, "^(%S+)")
              apply_colorscheme(name)
            end,
          },
        },
      })
    end,
  },
}
