# Host-specific module for nixos
# This module imports the main configuration.nix and hardware-configuration.nix

{ ... }:

{
  imports = [
    ./configuration.nix
    ./niri.nix
  ];
}
