# User Home Configuration

**Scope:** Home Manager user-level modules

## OVERVIEW

User environment configuration via Home Manager. Contains terminal (Kitty), shell (Fish), desktop shell (Noctalia), and AI coding tool (OpenCode) modules.

## FILES

| File | Purpose |
|------|---------|
| `default.nix` | User entry point, imports all modules |
| `kitty.nix` | Kitty terminal: theme, font, keybindings, settings |
| `fish.nix` | Fish shell: abbreviations, aliases, keybindings, init scripts |
| `noctalia.nix` | Noctalia shell: bar, widgets, plugins, colors, systemd |
| `opencode.nix` | OpenCode AI: main config + oh-my-opencode plugin |

## KEY CONFIGS

**default.nix:**
- State version: `25.11`
- Packages: neovim, git, fzf, starship, tmux, lazygit, dev tools
- Programs: git, starship, fzf, tmux, neovim, home-manager
- XDG: nvim/init.lua config

**noctalia.nix:**
- Bar: top position, compact density, custom widgets
- Plugins: official Noctalia plugins source
- Colors: Material 3 monochrome theme
- Systemd: enabled for auto-start

**kitty.nix:**
- Font: JetBrains Mono Nerd Font 14px
- Theme: One Dark
- Background opacity: 0.95

## MODULE PATTERN

```nix
{ config, pkgs, ... }:

{
  imports = [ ./module.nix ];
  # options...
}
```

## NOTES

- All modules imported via `imports` array in default.nix
- XDG config files created via `xdg.configFile."path".text`
- Fish shell uses fisher plugin manager (install separately)
- OpenCode MCP nixos requires `uvx mcp-nixos` package
