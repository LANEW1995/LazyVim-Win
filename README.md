# LazyVim Configuration for Windows, WSL, and Linux

A personal Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim), optimized for cross-platform reliability and enhanced with custom features for a streamlined development experience.

## Overview

This configuration extends LazyVim with carefully selected customizations that maintain stability across Windows, WSL, and Linux environments while adding useful features for plugin management and theming.

## Features

### 🎨 Custom Theming
- **Automatic Theme Installation**: FzfLua integration automatically installs missing colorscheme plugins when selected
- **Pre-configured Theme Mappings**: Quick access to popular themes (Adwaita, Catppuccin, Nightfox, TokyoDark, Everforest, Nord)

### 📦 Enhanced Plugin Management
- **APT-like Plugin Installer**: Custom `:plugininstall` command for easy plugin installation
  - Usage: `:plugininstall username/repo`
  - Automatically adds plugins to `lua/plugins/auto.lua`
  - Triggers immediate plugin synchronization
- **Modular Plugin Structure**: Organized plugin configurations in `lua/plugins/` directory

### ⚙️ Configuration Structure

```
├── init.lua                    # Entry point, bootstraps LazyVim
├── lua/
│   ├── config/
│   │   ├── autocmds.lua       # Custom autocommands and :plugininstall command
│   │   ├── keymaps.lua        # Custom key mappings
│   │   ├── options.lua        # Neovim options
│   │   ├── lazy.lua           # Lazy.nvim plugin manager configuration
│   │   ├── plugin_install.lua # Plugin installation module
│   │   └── lazy_install.lua   # Alternative installation module
│   └── plugins/
│       ├── colorscheme.lua    # Basic OneDark setup
│       ├── theme.lua          # Advanced OneDark configuration (warmer style)
│       ├── fzf-colorsschemes.lua # Auto-installing colorscheme picker
│       ├── example.lua        # Example plugin configurations (disabled)
│       └── auto.lua           # Auto-generated plugin list (created on first use)
```

## Installation

1. **Prerequisites**: Neovim 0.9.0+ required
2. **Backup** your existing Neovim configuration if you have one
3. **Clone** this repository to your Neovim config directory:

   **Linux/macOS:**
   ```bash
   git clone https://github.com/LANEW1995/LazyVim-Win.git ~/.config/nvim
   ```

   **Windows (PowerShell):**
   ```powershell
   git clone https://github.com/LANEW1995/LazyVim-Win.git $env:LOCALAPPDATA\nvim
   ```

4. **Launch** Neovim - plugins will install automatically on first run

### Plugin Installation Command
The custom `:plugininstall` command provides an intuitive way to add plugins:

```vim
:plugininstall folke/which-key.nvim
```

This command:
1. Creates `lua/plugins/auto.lua` if it doesn't exist
2. Adds the plugin specification to the file
3. Automatically runs `lazy.sync()` to install the plugin
4. Provides immediate feedback on the installation

### FzfLua Colorscheme Integration
When browsing colorschemes with FzfLua, the configuration automatically:
- Detects when a colorscheme plugin is missing
- Installs the required plugin on-the-fly
- Applies the colorscheme after installation
- Supports common themes out-of-the-box

### Performance Optimizations
Disabled unnecessary runtime plugins for faster startup:
- gzip
- tarPlugin
- tohtml
- tutor
- zipPlugin

### Auto-update Checking
- Plugin update checking is enabled
- Notifications are disabled to reduce interruptions
- Manual review of updates encouraged for stability

## Cross-Platform Compatibility

This configuration is tested and works reliably on:
- ✅ **Windows** (native Neovim installation)
- ✅ **WSL** (Windows Subsystem for Linux)

## Usage Tips

### Adding New Plugins
1. **Quick method**: Use `:plugininstall username/repo`
2. **Manual method**: Create a new file in `lua/plugins/` with your plugin configuration
3. **Both methods** trigger automatic plugin synchronization

### Changing Themes
1. Use FzfLua colorscheme picker (if configured)
2. Or manually edit `lua/plugins/theme.lua`
3. Restart Neovim or run `:Lazy reload`

### Updating Plugins
- Run `:Lazy` to open the Lazy.nvim UI
- Press `U` to update all plugins
- Press `C` to check for updates without installing

## Configuration Files

### Core Configuration
- **init.lua**: Bootstrap file that loads the lazy.nvim plugin manager
- **lua/config/lazy.lua**: Main Lazy.nvim setup with plugin specifications
- **lua/config/options.lua**: Custom Neovim options (extends LazyVim defaults)
- **lua/config/keymaps.lua**: Custom key mappings (extends LazyVim defaults)

### Custom Features
- **lua/config/autocmds.lua**: Contains the `:plugininstall` command implementation
- **lua/config/plugin_install.lua**: Module for programmatic plugin installation
- **lua/config/lazy_install.lua**: Alternative installation helper module

### Plugin Configurations
- **lua/plugins/theme.lua**: OneDark theme with custom settings (active)
- **lua/plugins/colorscheme.lua**: Basic OneDark setup (alternative configuration)
- **lua/plugins/fzf-colorsschemes.lua**: Auto-installing colorscheme picker
- **lua/plugins/example.lua**: Commented examples from LazyVim documentation
- **lua/plugins/auto.lua**: Automatically generated by `:plugininstall` command

## LazyVim Base

This configuration builds upon [LazyVim](https://github.com/LazyVim/LazyVim), which provides:
- Sensible defaults for Neovim
- Pre-configured LSP, treesitter, and autocompletion
- Beautiful UI with statusline and file explorer
- Extensive documentation and community support

For LazyVim's default keybindings and features, refer to the [official documentation](https://www.lazyvim.org/).

## Contributing

Feel free to fork this configuration and adapt it to your needs. If you have suggestions for improvements that maintain cross-platform compatibility, please open an issue or pull request.

## License

This configuration is provided as-is. See [LICENSE](LICENSE) for details.
