# Noctalia shell configuration module
# Wayland desktop shell built with Quickshell
{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;

    # Systemd service for auto-start
    systemd.enable = true;

    # Settings configuration
    settings = {
      settingsVersion = 0;

      # Bar configuration
      bar = {
        barType = "simple";
        position = "top";
        density = "compact";
        showCapsule = true;
        backgroundOpacity = 0.93;
        widgets = {
          left = [
            { id = "Launcher"; }
            { id = "Network"; }
            { id = "Bluetooth"; }
          ];
          center = [
            {
              id = "Workspace";
              hideUnoccupied = false;
              labelMode = "name";
            }
          ];
          right = [
            { id = "Tray"; }
            {
              id = "Battery";
              warningThreshold = 30;
            }
            {
              id = "Clock";
              formatHorizontal = "HH:mm";
              useMonospacedFont = true;
            }
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
          ];
        };
      };

      # General settings
      general = {
        avatarImage = "/home/sweet/.face";
        radiusRatio = 0.2;
        animationSpeed = 1;
        enableShadows = true;
        lockOnSuspend = true;
      };

      # Location and time
      location = {
        name = "Shanghai, China";
        weatherEnabled = true;
        useFahrenheit = false;
        showCalendarEvents = true;
      };

      # Color scheme
      colorSchemes = {
        predefinedScheme = "Monochrome";
        darkMode = true;
      };

      # App launcher
      appLauncher = {
        terminalCommand = "alacritty -e";
        viewMode = "list";
        showCategories = true;
        iconMode = "tabler";
      };

      # Session menu
      sessionMenu = {
        position = "center";
        enableCountdown = true;
        countdownDuration = 10000;
      };

      # Notifications
      notifications = {
        enabled = true;
        location = "top_right";
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
      };

      # Dock
      dock = {
        enabled = true;
        position = "bottom";
        displayMode = "auto_hide";
      };
    };

    # Theme colors (Material 3)
    colors = {
      mError = "#dddddd";
      mOnError = "#111111";
      mOnPrimary = "#111111";
      mOnSecondary = "#111111";
      mOnSurface = "#828282";
      mOnSurfaceVariant = "#5d5d5d";
      mOnTertiary = "#111111";
      mOnHover = "#ffffff";
      mOutline = "#3c3c3c";
      mPrimary = "#aaaaaa";
      mSecondary = "#a7a7a7";
      mShadow = "#000000";
      mSurface = "#111111";
      mHover = "#1f1f1f";
      mSurfaceVariant = "#191919";
      mTertiary = "#cccccc";
    };

    # Plugins
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
    };

    # Optional dependencies
    # Uncomment if you need these features:
    # calendarSupport = true;  # For calendar events (requires evolution-data-server)
  };

  # Home packages for Noctalia dependencies
  home.packages = with pkgs; [
    # Core dependencies
    quickshell
    brightnessctl
    imagemagick
    python
    git

    # Optional but recommended
    cliphist
    cava
    wlsunset

    # Desktop monitor brightness (may cause instability)
    # ddcutil
  ];

  # XDG config for wallpapers
  home.file.".cache/noctalia/wallpapers.json".text = builtins.toJSON {
    defaultWallpaper = "";
    wallpapers = { };
  };
}
