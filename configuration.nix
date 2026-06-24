# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./aliases.nix
    ./zsh.nix
  ];

  # Boot properties
  boot.loader = {
    grub.device = /mnt/nvme0n1p1;
    grub.useOSProber = true;

    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = (import ./options.nix).hostname;
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Kyiv";

  # Sound service
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };


  users.users = {
    ${(import ./options.nix).username} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "sudo" ];
    };
  };

  environment.systemPackages = with pkgs; [
     wget
     git
  ];

# Limit everything in firewall
  networking.firewall = {
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
    allowPing = false;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.libinput.enable = true; # Touchpad support
  programs.hyprland.enable = true;

  system.stateVersion = "26.05"; # Don't change it
}

