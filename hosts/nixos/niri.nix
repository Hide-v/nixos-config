# Niri window manager configuration
# Configured for compatibility with Noctalia shell
{ config, pkgs, ... }:

{
  programs.niri = {
    enable = true;

    settings = {
      # Visual settings for rounded corners
      window = {
        geometry-corner-radius = 20;
        clip-to-geometry = true;
      };

      # Allow notification actions and window activation from Noctalia
      debug = {
        honor-xdg-activation-with-invalid-serial = true;
      };

      # Spawn Noctalia at startup
      spawn-at-startup = [
        {
          command = [ "noctalia-shell" ];
        }
      ];

      # Keybindings for Noctalia integration
      binds = with config.lib.niri.actions; {
        # Launch Noctalia launcher (Ctrl+Return)
        "Control+Return".action.spawn = [
          "noctalia-shell" "ipc" "call" "launcher" "toggle"
        ];

        # Launch terminal - Kitty (Mod+Return)
        "Mod+Return".action.spawn = [
          "kitty"
        ];

        # Launch browser (Mod+B)
        "Mod+B".action.spawn = [
          "zen-browser"
        ];

        # Session menu
        "Mod+M".action.spawn = [
          "noctalia-shell" "ipc" "call" "sessionMenu" "toggle"
        ];

        # Lock screen
        "Mod+L".action.spawn = [
          "noctalia-shell" "ipc" "call" "lockScreen" "lock"
        ];

        # Volume controls via Noctalia
        "XF86AudioLowerVolume".action.spawn = [
          "noctalia-shell" "ipc" "call" "volume" "decrease"
        ];
        "XF86AudioRaiseVolume".action.spawn = [
          "noctalia-shell" "ipc" "call" "volume" "increase"
        ];
        "XF86AudioMute".action.spawn = [
          "noctalia-shell" "ipc" "call" "volume" "muteOutput"
        ];

        # Brightness controls via Noctalia
        "XF86MonBrightnessUp".action.spawn = [
          "noctalia-shell" "ipc" "call" "brightness" "increase"
        ];
        "XF86MonBrightnessDown".action.spawn = [
          "noctalia-shell" "ipc" "call" "brightness" "decrease"
        ];
      };
    };
  };
}
