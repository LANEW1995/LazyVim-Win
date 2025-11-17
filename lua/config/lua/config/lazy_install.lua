-- lua/config/lazy_install.lua

local M = {}

-- Where installed plugins get recorded automatically
local auto_file = vim.fn.stdpath("config") .. "/lua/plugins/auto.lua"

function M.install(repo)
  if not repo or repo == "" then
    print("Usage: :PluginInstall username/repo")
    return
  end

  -- Ensure auto.lua exists
  if vim.fn.filereadable(auto_file) == 0 then
    vim.fn.writefile({ "return {", "}" }, auto_file)
  end

  -- Load existing content
  local lines = vim.fn.readfile(auto_file)

  -- Insert plugin spec BEFORE the final "}"
  table.insert(lines, #lines, '  { "' .. repo .. '" },')

  vim.fn.writefile(lines, auto_file)

  print("Added plugin: " .. repo .. " → plugins/auto.lua")

  -- Install via lazy.nvim
  require("lazy").sync()
end

return M
