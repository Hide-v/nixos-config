# Home Manager configuration for user sweet
# This file defines the user's home environment

{ config, pkgs, inputs, ... }:

{
  # Home directory
  home.homeDirectory = "/home/sweet";

  # Username
  home.username = "sweet";

  # State version
  home.stateVersion = "25.11";

  # Import modules
  imports = [
    ./kitty.nix
    ./fish.nix
    ./noctalia.nix
    ./opencode.nix
    ./niri.nix
  ];

  # Packages to install
  home.packages = with pkgs; [
    # CLI tools
    neovim
    git
    curl
    wget
    htop
    tree
    fd
    ripgrep
    fzf
    bat
    eza
    zoxide
    starship
    lazygit

    # Development tools
    git
    gcc
    make
    nodejs
    python3
    rustup
    go
    gopls

    # Terminal
    tmux
  ];

  # Programs configuration
  programs = {
    # Git configuration
    git = {
      enable = true;
      userName = "Hide-v";
      userEmail = "vcmingri19@outlook.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        pull = {
          rebase = true;
        };
        alias = {
          s = "status";
          l = "log --oneline";
          co = "checkout";
          br = "branch";
        };
      };
    };

    # Starship prompt
    starship = {
      enable = true;
      settings = {
        add_newline = true;
        command_timeout = 1000;
      };
    };

    # Fzf configuration
    fzf = {
      enable = true;
      defaultOptions = ["--height" "40%"];
    };

    # Tmux configuration
    tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        resurrect
      ];
      extraConfig = ''
        set -g mouse on
        set -g escape-time 0
        bind -n C-h select-pane -L
        bind -n C-l select-pane -R
        bind -n C-k select-pane -U
        bind -n C-j select-pane -D
      '';
    };

    # Home Manager itself
    home-manager.enable = true;
  };

  # Editor configuration
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
  };

  # Services
  services = {
    # Keychain for SSH/GPG
    keychain = {
      enable = true;
      inheritUser = true;
      agents = [ "ssh" "gpg" ];
    };
  };

  # Home file configuration
  xdg = {
    enable = true;
    configFile = {
      "nvim/init.lua".text = ''
        -- Neovim configuration
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.tabstop = 4
        vim.opt.shiftwidth = 4
        vim.opt.expandtab = true
        vim.opt.smartindent = true
        vim.opt.wrap = false
        vim.opt.termguicolors = true
        vim.opt.mouse = "a"
        vim.opt.clipboard = "unnamedplus"
      '';
    };
  };
}
