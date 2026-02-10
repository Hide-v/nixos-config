# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # Change if needed

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Configure network settings.
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Enable wireless.
  networking.wireless.enable = true;

  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.sweet = {
    isNormalUser = true;
    description = "Sweet User";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Enable sudo for wheel users.
  security.sudo.wheelNeedsPassword = false;

  # Install some useful packages.
  environment.systemPackages = with pkgs; [
    wget
    vim
    git
    curl
    htop
    neofetch
    nix-tree
    nix-index
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = true;

  # Enable Bluetooth.
  hardware.bluetooth.enable = true;

  # Enable power management services required by Noctalia
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like database locations and
  # protocol versions, are taken.  It's perfectly fine and
  # recommended to leave this value at the release version of
  # the first install of this system.
  system.stateVersion = "24.11";
}
