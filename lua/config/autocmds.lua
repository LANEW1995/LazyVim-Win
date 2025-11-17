-- verify install

vim.schedule(function()
  vim.notify("config.autocmds loaded")
end)

-- apt-like plugin installer: :plugininstall user/repo
vim.api.nvim_create_user_command("plugininstall", function(opts)
  local repo = opts.args
  if repo == "" then
    print("Usage: :plugininstall username/repo")
    return
  end

  -- Where we'll store auto-installed plugins
  local auto_file = vim.fn.stdpath("config") .. "/lua/plugins/auto.lua"

  -- Create auto.lua if it doesn't exist
  if vim.fn.filereadable(auto_file) == 0 then
    vim.fn.writefile({ "return {", "}" }, auto_file)
  end

  -- Read existing content
  local lines = vim.fn.readfile(auto_file)

  -- Insert the plugin spec before the final "}"
  table.insert(lines, #lines, ('  { "%s" },'):format(repo))

  vim.fn.writefile(lines, auto_file)

  print("Added plugin: " .. repo .. " → lua/plugins/auto.lua")

  -- Ask Lazy.nvim to install / sync
  require("lazy").sync()
end, {
  nargs = 1,
})
