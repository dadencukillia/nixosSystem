{ ... }:

{
  environment.shellAliases = {
    nixsw = "nixos-rebuild switch --flake \"path:/etc/nixos#linuxSystem\"";
    nixcl = "nix-collect-garbage -d";
    nixcfg = "sudo sh -c \"cd /etc/nixos && nvim .\"";
  };
}
