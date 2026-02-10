# Kitty terminal configuration module
{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    # Theme
    theme = "One Dark";

    # Font
    font = {
      package = pkgs.jetbrains-mono-nerd-font;
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };

    # Settings
    settings = {
      # Appearance
      background_opacity = "0.95";
      dynamic_background_opacity = true;
      cursor_shape = "beam";
      cursor_blink_interval = 0;

      # Scrolling
      scrollback_lines = 10000;
      scrollback_pager = "less +G";

      # Tabs
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}";

      # Window
      window_padding_width = "8";

      # Performance
      repaint_delay = 10;
      input_delay = 3;
    };

    # Keybindings
    keybindings = {
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_window";
      "ctrl+shift+[" = "previous_tab";
      "ctrl+shift+]" = "next_tab";
      "ctrl+shift+l" = "pass_selection_to_program";
    };
  };

  home.packages = with pkgs; [
    kitty
  ];
}
