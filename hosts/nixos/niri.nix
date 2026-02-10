# Niri window manager configuration
# Configured for compatibility with Noctalia shell
{ config, pkgs, ... }:

{
  programs.niri = {
    enable = true;

    settings = {
      # Spawn Noctalia at startup
      spawn-at-startup = [
        "noctalia-shell"
      ];

      # Environment variables
      environment = {
        NUXT_TELEMETRY_DISABLED = "1";
      };

      # Keybindings for Noctalia integration
      binds = {
        # Launch Noctalia launcher (Mod4+Return)
        "Mod4+Return" = {
          spawn = [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ];
        };

        # Launch terminal - Kitty (Mod4+Enter)
        "Mod4+Enter" = {
          spawn = [ "kitty" ];
        };

        # Launch browser (Mod4+B)
        "Mod4+B" = {
          spawn = [ "zen-browser" ];
        };

        # Session menu (Mod4+M)
        "Mod4+M" = {
          spawn = [ "noctalia-shell" "ipc" "call" "sessionMenu" "toggle" ];
        };

        # Lock screen (Mod4+L)
        "Mod4+L" = {
          spawn = [ "noctalia-shell" "ipc" "call" "lockScreen" "lock" ];
        };

        # Volume controls via Noctalia
        "XF86AudioLowerVolume" = {
          spawn = [ "noctalia-shell" "ipc" "call" "volume" "decrease" ];
        };
        "XF86AudioRaiseVolume" = {
          spawn = [ "noctalia-shell" "ipc" "call" "volume" "increase" ];
        };
        "XF86AudioMute" = {
          spawn = [ "noctalia-shell" "ipc" "call" "volume" "muteOutput" ];
        };

        # Brightness controls via Noctalia
        "XF86MonBrightnessUp" = {
          spawn = [ "noctalia-shell" "ipc" "call" "brightness" "increase" ];
        };
        "XF86MonBrightnessDown" = {
          spawn = [ "noctalia-shell" "ipc" "call" "brightness" "decrease" ];
        };

        # Quit niri (Mod4+Shift+Q)
        "Mod4+Shift+Q" = {
          quit = true;
        };

        # Screenshot (Print key)
        "Print" = {
          screenshot = {
            write-to-disk = true;
            show-pointer = false;
          };
        };
      };

      # Clipboard settings
      clipboard = {
        disable-primary = true;
      };

      # Hotkey overlay settings
      hotkey-overlay = {
        skip-at-startup = true;
        hide-not-bound = true;
      };
    };
  };
}
