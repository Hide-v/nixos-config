# Fish shell configuration module
{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    # Use fisher for plugin management
    package = pkgs.fishPlugins.fish;

    # Fish functions directory
    functionsDir = config.home.homeDirectory + "/.config/fish/functions";

    # Abbreviations
    abbreviations = {
      lg = "lazygit"
      g = "git";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git pull";
      ll = "eza --long --all --icons";
      la = "eza --all --long --icons";
    };

    # Environment variables
    env = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERM = "xterm-256color";
      ZO_DATA_DIR = "$HOME/.local/share/zoxide";
    };

    # Shell configuration
    shellAliases = {
      ls = "eza --icons";
      ll = "eza --long --all --icons";
      la = "eza --all --long --icons";
      cat = "bat";
      grep = "rg";
      find = "fd";
      vim = "nvim";
      vi = "nvim";
      neofetch = "fastfetch";
    };

    # Keybindings
    keybindings = {
      # Ctrl+P for reverse search (like Ctrl+R in bash)
      "\cp" = "history-search-backward";
      "\cn" = "history-search-forward";
      # Alt+Left/Right for word navigation
      "\e\e[D" = "backward-word";
      "\e\e[C" = "forward-word";
    };

    # Login shell setup
    loginShellInit = ''
      # Starship prompt
      starship init fish | source

      # Zoxide for smart cd
      zoxide init fish | source

      # Fisher plugin manager
      fisher install fiskr/fisher

      # Set GOPATH
      set -g GOPATH $HOME/go
      set -a PATH $GOPATH/bin

      # NVM setup
      set -g NVM_DIR ~/.nvm
      if test -d "$NVM_DIR"
        nvm load 2>/dev/null
      end

      # Rust setup
      set -g RUSTUP_HOME ~/.rustup
      set -g CARGO_HOME ~/.cargo
      set -a PATH $CARGO_HOME/bin
    '';

    # Interactive shell setup
    interactiveShellInit = ''
      # Fish greeting
      echo ""
      echo "Welcome to Fish!"
      echo "----------------"
      fastfetch
    '';

    # Universal variables
    universalVariables = [
      "FISH_THEME"
    ];
  };

  # Home file configuration
  xdg.configFile."fish/fish_variables".text = ''
    # Fish universal variables
    set -U FISH_THEME "one"
  '';

  xdg.configFile."fish/config.fish".text = ''
    # Fish configuration
    if status is-interactive
      # Commands to run in interactive sessions
    end
  '';
}
