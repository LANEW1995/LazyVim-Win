-- lua/config/plugin_install.lua

local M = {}

local auto_file = vim.fn.stdpath("config") .. "/lua/plugins/auto.lua"

function M.install(repo)
  if not repo or repo == "" then
    print("Usage: :plugininstall username/repo")
    return
  end

  if vim.fn.filereadable(auto_file) == 0 then
    vim.fn.writefile({ "return {", "}" }, auto_file)
  end

  local lines = vim.fn.readfile(auto_file)
  table.insert(lines, #lines, '  { "' .. repo .. '" },')
  vim.fn.writefile(lines, auto_file)

  print("Added plugin: " .. repo)
  require("lazy").sync()
end

return M
