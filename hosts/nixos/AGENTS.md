# Host System Configuration

**Scope:** System-level NixOS modules

## OVERVIEW

System configuration modules for the nixos host. Contains hardware-specific settings, system services, and Niri window manager configuration.

## FILES

| File | Purpose |
|------|---------|
| `default.nix` | Host entry point, imports configuration.nix and niri.nix |
| `configuration.nix` | Base system config: users, services, networking |
| `hardware-configuration.nix` | Hardware-specific: filesystems, bootloader, modules |
| | |

## KEY CONFIGS

**configuration.nix:**
- Users: `sweet` (wheel, networkmanager groups)
- Services: SSH, PulseAudio, Bluetooth, Power Profiles Daemon, UPower
- Timezone: Asia/Shanghai
- Locale: en_US.UTF-8

**niri.nix:**
- Spawns Noctalia at startup
- Mod4 keybindings for launcher, terminal, browser
- IPC calls to Noctalia for volume, brightness, lock screen
- Screenshot on Print key

## MODULE PATTERN

```nix
{ config, pkgs, ... }:

{
  imports = [ ... ];
  # options...
}
```

## NOTES

- hardware-configuration.nix should be regenerated with `nixos-generate-config` on new hardware
- Bootloader device (`/dev/sda`) must match actual disk
- State version `24.11` determines default service versions
