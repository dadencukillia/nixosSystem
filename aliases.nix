{ pkgs, ... }:

{
  environment.shellAliases = {
    nixsw = "nixos-rebuild switch --flake \"path:/etc/nixos#linuxSystem\"";
  };
}
