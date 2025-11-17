-- lua/config/lazy_install.lua

local M = {}

-- where to append plugin specs automatically
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

  -- Append plugin spec
  local current = vim.fn.readfile(auto_file)
  table.insert(current, #current, '  { "' .. repo .. '" },')
  vim.fn.writefile(current, auto_file)

  print("Added plugin: " .. repo .. " → plugins/auto.lua")

  -- Now ask Lazy to install it
  require("lazy").sync()
end

return M
