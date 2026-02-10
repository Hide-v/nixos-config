# NixOS Flake Configuration

**Generated:** 2026-02-10
**Commit:** main
**Branch:** main

## OVERVIEW

NixOS flake configuration with Home Manager, featuring Niri window manager + Noctalia desktop shell, Kitty terminal, Fish shell, and OpenCode AI coding agent.

## STRUCTURE

```
/home/sweet/project/nixos/
├── flake.nix                    # Flake entry, 4 inputs (nixpkgs, home-manager, niri, noctalia)
├── AGENTS.md                    # This file
├── hosts/
│   └── nixos/                  # System configs (4 files)
└── home/
    └── sweet/                  # User configs (5 files)
```

## WHERE TO LOOK

| Task | Location | Notes |
|------|----------|-------|
| System configuration | `hosts/nixos/configuration.nix` | Base system, services, users |
| Niri WM config | `home/sweet/niri.nix` | Keybindings, startup, compositor |
| Hardware config | `hosts/nixos/hardware-configuration.nix` | **Edit for your hardware** |
| User packages | `home/sweet/default.nix` | CLI tools, dev tools |
| Kitty terminal | `home/sweet/kitty.nix` | Terminal config, theme |
| Fish shell | `home/sweet/fish.nix` | Fish + fisher plugins |
| Noctalia shell | `home/sweet/noctalia.nix` | Bar, widgets, plugins |
| OpenCode AI | `home/sweet/opencode.nix` | OpenCode + oh-my-opencode |

## MODULE HIERARCHY

```
flake.nix
├── nixosConfigurations.nixos
│   └── hosts/nixos/default.nix
│       ├── configuration.nix (imports hardware-configuration.nix)
│   └── niri.nixosModules.niri (system-level installation)
│   └── home-manager (home/sweet/)
│       └── default.nix
│           ├── kitty.nix
│           ├── fish.nix
│           ├── noctalia.nix
│           ├── opencode.nix
│           └── niri.nix (inputs.niri.homeModules.config)
```

## KEYBINDS (Niri)

| Key | Action |
|-----|--------|
| `Mod4+Return` | Toggle Noctalia launcher |
| `Mod4+Enter` | Launch Kitty |
| `Mod4+B` | Launch Zen Browser |
| `Mod4+M` | Toggle session menu |
| `Mod4+L` | Lock screen |
| `Print` | Screenshot |

## CONVENTIONS

- `home.stateVersion = "25.11"`
- `system.stateVersion = "24.11"`
- Home modules import via `imports = [...]` in `default.nix`
- Host modules import via `hosts/nixos/default.nix`
- Niri keybindings use new syntax: `"Key" = { spawn = [...] }`
- XDG configs in `xdg.configFile."path".text`

## ANTI-PATTERNS (THIS PROJECT)

- **DON'T** modify `hardware-configuration.nix` without regenerating: `nixos-generate-config`
- **DON'T** use hardcoded paths; use `~/.config/` via XDG
- **DON'T** enable both GDM and Niri display manager

## COMMANDS

```bash
# Build and switch
sudo nixos-rebuild switch --flake .#nixos

# Dry build (preview)
sudo nixos-rebuild dry-build --flake .#nixos

# Update flake inputs
nix flake update

# Home Manager only
home-manager switch --flake .#nixos

# Rollback
sudo nixos-rebuild rollback
```

## NOTES

- Hardware UUIDs in `hardware-configuration.nix` require editing for new systems
- Noctalia requires: NetworkManager, Bluetooth, power-profiles-daemon, UPower
- OpenCode MCP nixos uses `uvx mcp-nixos` (requires `uvx` or pipx)
