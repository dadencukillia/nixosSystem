# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Boot properties
  boot.loader = {
    grub.device = /mnt/nvme0n1p1;
    grub.useOSProber = true;

    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "crocoby";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Kyiv";

  # Sound service
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Touchpad support
  services.libinput.enable = true;

  users.users.crocoby = {
    isNormalUser = true;
    extraGroups = [ "wheel" "sudo" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
     neovim
     wget
     git
  ];

  # Limit everything in firewall
  networking.firewall = {
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  system.stateVersion = "26.05"; # Don't change it

}

